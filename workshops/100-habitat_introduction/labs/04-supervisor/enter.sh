#!/bin/bash
if [ -n "$STUDIO_TYPE" ]; then
    echo "This can not be run from inside of hab studio"
    exit -1
fi

SUP=$(sudo hab svc status 2>/dev/null)
echo $SUP
if [ -n "${SUP}" ]; then
    clear
    echo "WARNING: Habitat Supervisor is already running, this lab was designed to be run before running the supervisor."
    echo "WARNING: Stopping Supervisor it will attempt to restart after the script exits."    
    echo ""
    echo ""
    echo ""

    SUP=$(sudo hab sup term)
    while true; do
        sleep 1
        SUP=$(sudo hab svc status 2>/dev/null)
        if [ -z "${SUP}" ]; then
            break;
        fi
        echo "waiting..."
    done
    
    sudo hab studio enter
    sudo hab studio rm

    sleep 1
    
    echo "Restarting Habitat"        
    sudo systemctl start hab-sup

    SUP=$(sudo hab svc status 2>/dev/null)
    while true; do
        sleep 1
        SUP=$(sudo hab svc status 2>/dev/null)
        if [ -n "${SUP}" ]; then
            break;
        fi
        echo "waiting..."
    done

else

    sudo hab studio enter
    sudo hab studio rm

fi