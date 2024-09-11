#!/bin/bash
NAME="100-courier-lab-02-where-all"
EXPECT=3
FORMAT="%1s | %5s | %10s | %36s | %36s | %30s \n"

function wait() {
    INSTANCES=$(chef-courier-cli state instance list-all --job-id $JOBID --format json --profile admin --pagination.size 100)    
    INSTANCE=$(echo $INSTANCES | jq -br '.items[0]')
    INSTANCE_ID=$(echo $INSTANCE | jq -br '.id' )

    RUNS=$(chef-courier-cli state instance list-instance-runs --instanceId $INSTANCE_ID --format json --profile admin --pagination.size 100)
    COUNT=$(echo $RUNS | jq '.items | length')

    COMPLETE="0"
    for i in $(seq 1 $COUNT);
    do
        if [ "$i" -eq "1" ]; then
            clear
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

        if [ "$status" == "failure" ]; then
            COMPLETE="$((COMPLETE+1))"
        fi
        if [ "$status" == "failed" ]; then
            COMPLETE="$((COMPLETE+1))"
        fi
        if [ "$status" == "success" ]; then
            COMPLETE="$((COMPLETE+1))"
        fi
        if [ "$status" == "timeout" ]; then
            COMPLETE="$((COMPLETE+1))"
        fi

    done    

    if [ "$COMPLETE" -eq "$EXPECT" ]; then
        echo ""
        echo "Job Completed"
    else
        echo ""
        echo "Job not yet complete. Screen will refresh in 1 seconds."
        sleep 1
        wait
    fi

}

JOBID=$(chef-courier-cli scheduler jobs list-jobs --format json --profile admin --pagination.size 100 | jq --arg NAME "$NAME" '.items[] | select(.name == $NAME) | .id')

wait