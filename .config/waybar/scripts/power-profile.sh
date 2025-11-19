#!/bin/bash

if command -v powerprofilesctl &> /dev/null; then
    PROFILE=$(powerprofilesctl get 2>/dev/null)
    
    if [ -z "$PROFILE" ]; then
        echo '{"text":"N/A","class":"unknown","tooltip":"Power profiles daemon not running"}'
        exit 0
    fi
    
    case $PROFILE in
        "performance")
            TEXT="PERF"
            ;;
        "balanced")
            TEXT="BAL"
            ;;
        "power-saver")
            TEXT="SAVE"
            ;;
        *)
            TEXT="?"
            ;;
    esac
    
    echo "{\"text\":\"$TEXT\",\"class\":\"$PROFILE\",\"tooltip\":\"Power Profile: $PROFILE\"}"
else
    echo '{"text":"?","class":"unknown","tooltip":"powerprofilesctl not found"}'
fi
