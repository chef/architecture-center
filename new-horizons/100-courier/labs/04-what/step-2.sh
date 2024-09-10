#!/bin/bash

NAME="100-courier-lab-04-what---"
EXPECT=1


function wait_for_job(){    
    FORMAT="%1s | %36s | %10s | %36s | %30s \n"
    RESP=$(chef-courier-cli state instance list-all --job-id $JOBID --format json --profile admin --pagination.size 100)
    COUNT=$(echo $RESP | jq '.items | length')

    COMPLETE="0"
    for i in $(seq 1 $COUNT);
    do
        if [ "$i" -eq "1" ]; then
            clear
            echo ""
            echo ""
            printf "$FORMAT" "#" "Execution ID" "Status" "Job ID" "Created At"
            echo "-----------------------------------------------------------------------------------------------------------------------------"
        fi

        idx="$((i-1))"
        ITEM=$(echo $RESP | jq -br --argjson idx $idx '.items[$idx]')
        id=$(echo $ITEM | jq -br '.id' )
        status=$(echo $ITEM | jq -br '.status' )
        jobId=$(echo $ITEM | jq -br '.jobId' )
        createdAt=$(echo $ITEM | jq -br '.createdAt' )

        if [ "$status" == "failure" ]; then
            COMPLETE="$((COMPLETE+1))"
        fi
        
        if [ "$status" == "success" ]; then
            COMPLETE="$((COMPLETE+1))"
        fi

        printf "$FORMAT" $i $id $status $jobId $createdAt
    done

    if [ "$COMPLETE" -eq "$EXPECT" ]; then
        echo ""
        print_runs
    else
        echo ""
        echo "Job not yet complete. Screen will refresh in 5 seconds."
        sleep 5
        wait
    fi
}

function print_runs(){
    FORMAT="%1s | %5s | %10s | %36s | %36s | %30s \n"
    INSTANCES=$(chef-courier-cli state instance list-all --job-id $JOBID --format json --profile admin --pagination.size 100)    
    INSTANCE=$(echo $INSTANCES | jq -br '.items[0]')
    INSTANCE_ID=$(echo $INSTANCE | jq -br '.id' )

    RUNS=$(chef-courier-cli state instance list-instance-runs --instanceId $INSTANCE_ID --format json --profile admin --pagination.size 100)
    COUNT=$(echo $RUNS | jq '.items | length')

    for i in $(seq 1 $COUNT);
    do
        if [ "$i" -eq "1" ]; then
            echo ""
            echo ""
            printf "$FORMAT" "#" "Group" "Status" "Node ID" "Run ID" "Received Time"
            echo "----------------------------------------------------------------------------------------------------------------------------------------"
        fi

        idx="$((i-1))"
        ITEM=$(echo $RUNS | jq -br --argjson idx $idx '.items[$idx]')
        groupNumber=$(echo $ITEM | jq -br '.groupNumber' )
        status=$(echo $ITEM | jq -br '.status' )
        nodeId=$(echo $ITEM | jq -br '.nodeId' )
        runId=$(echo $ITEM | jq -br '.runId' )
        receivedTime=$(echo $ITEM | jq -br '.receivedTime' )
        printf "$FORMAT" $i $groupNumber $status $nodeId $runId $receivedTime
    done    

    print_steps
}    

function print_steps(){
    FORMAT="%5s | %8s | %10s | %36s | %60s \n"
    INSTANCES=$(chef-courier-cli state instance list-all --job-id $JOBID --format json --profile admin --pagination.size 100)    
    INSTANCE=$(echo $INSTANCES | jq -br '.items[0]')
    INSTANCE_ID=$(echo $INSTANCE | jq -br '.id' )

    RUNS=$(chef-courier-cli state instance list-instance-runs --instanceId $INSTANCE_ID --format json --profile admin --pagination.size 100)
    RUN_COUNT=$(echo $RUNS | jq '.items | length')

    for i in $(seq 1 $RUN_COUNT);
    do
        idx="$((i-1))"
        RUN=$(echo $RUNS | jq -br --argjson idx $idx '.items[$idx]')
        runId=$(echo $ITEM | jq -br '.runId' )

        STEPS=$(chef-courier-cli state run list-steps --runId $runId --format json --profile admin --pagination.size 100)
        STEP_COUNT=$(echo $STEPS | jq '.items | length')

        for j in $(seq 1 $STEP_COUNT);
        do
            jdx="$((j-1))"
            STEP=$(echo $STEPS | jq -br --argjson jdx $jdx '.items[$jdx]')
            stepNumber=$(echo $STEP | jq -br '.stepNumber' )
            numAttempts=$(echo $STEP | jq -br '.numAttempts' )
            status=$(echo $STEP | jq -br '.status' )
            reason=$(echo $STEP | jq -br '.reason' )
            args=$(echo $STEP | jq -brc '{ inputs: .inputs, outputs: .outputs }' )

            if [ -z "${reason}" ]; then
                reason="-"
            fi

            if [ "$j" -eq "1" ]; then
                echo ""
                echo ""
                printf "$FORMAT" "Step" "Attempts" "Status" "reason" "args"
                echo "----------------------------------------------------------------------------------------------------------------------------------------"
            fi
            printf "$FORMAT" $stepNumber $numAttempts $status $reason $args
        done
    done  
    echo ""
}

JOBID=$(chef-courier-cli scheduler jobs list-jobs --format json --profile admin --pagination.size 100 | jq --arg NAME "$NAME" '.items[] | select(.name == $NAME) | .id')
wait_for_job