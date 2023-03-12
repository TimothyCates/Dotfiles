#!/bin/bash

arg=$1

case $arg in
    "--hour")
        # If the argument is "--hour", output the current hour in 12-hour format
        date "+%I"
        ;;
    "--minutes")
        # If the argument is "--minutes", output the current minute
        date "+%M"
        ;;
    "--type")
        # If the argument is "--type", output the current time period (AM or PM)
        date "+%p"
        ;;
    "--date")
        # If the argument is "--date", output the current date in the format "Day, Month Day"
        date "+ %a, %b %d"
        ;;
    *)
        # If the argument doesn't match any of the cases above, do nothing and exit with status 0 (success)
        true
        ;;
esac