#!/bin/bash

function verifySkills(){
    name=$1
    node=$2

    NODE_JSON=$(chef-node-management-cli management node find-one-node --nodeId $node --format json --profile admin)
    cohortId=$(echo $NODE_JSON | jq -rbc '.item.cohortId' )
    assemblyId=$(chef-node-management-cli management cohort find-one-cohort --cohortId $cohortId --format json --profile admin | jq -rbc '.item.skillAssemblyId')
    required_skills=$(chef-node-management-cli management assembly find-one-assembly --skillAssemblyId $assemblyId  --format json --profile admin | jq '[ .item.skills[] | select(.action == "add") | {"name": .skill.name} ]')
    

    echo "Skills status for $name"
    echo "-----------------------------------------------------"

    for item in $(echo "$required_skills" | jq -c '.[]'); do
        skill=$(echo "$item" | jq -r '.name')

        required=$(echo $NODE_JSON | jq -r --arg skill "$skill" '.item.requiredSkills[] | select(.name==$skill) | .canister.version')    
        installed=$(echo $NODE_JSON | jq -r --arg skill "$skill" '.item.installedSkills[] | select(.name == $skill) | .canister.version')

        if [ "$required" != "$installed" ]; then 
            echo "     ERROR: $skill exected to have version $required installed."
        else
            echo "     $skill version $required installed."

        fi
    done

    echo ""
    echo ""

}


verifySkills "Node 1" $NODE1
verifySkills "Node 2" $NODE2
verifySkills "Node 3" $NODE3
