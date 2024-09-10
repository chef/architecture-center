#!/bin/bash

NAME="100-courier-lab-02-when"
EXPECT=5
FORMAT="%1s | %36s | %10s | %36s | %30s \n"

function wait(){    
    RESP=$(chef-courier-cli state instance list-all --job-id $JOBID --format json --profile admin --pagination.size 100)
    COUNT=$(echo $RESP | jq '.items | length')

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

        printf "$FORMAT" $i $id $status $jobId $createdAt
    done

    if [ "$i" -eq "$EXPECT" ]; then
        echo ""
        echo "Job Completed"
    else
        echo ""
        echo "Job not yet complete. Screen will refresh in 30 seconds."
        sleep 30
        wait
    fi

    #printf "%10s %10d %10s" stringarray[$i] numberarray[$i] anotherfieldarray[%i]

}
JOBID=$(chef-courier-cli scheduler jobs list-jobs --format json --profile admin | jq --arg NAME "$NAME" '.items[] | select(.name == $NAME) | .id')
wait