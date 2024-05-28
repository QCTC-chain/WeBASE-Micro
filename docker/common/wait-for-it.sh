#!/usr/bin/env sh
# Use this script to test if a given TCP host/port are available

WAITFORIT_cmdname=${0##*/}

echoerr()
{
if [ $WAITFORIT_QUIET -ne 1 ]
then
    echo "$@" 1>&2;
fi
}

usage()
{
    cat << USAGE >&2
Usage:
    $WAITFORIT_cmdname host port subcommand
USAGE
    exit 1
}

wait_for()
{
    echoerr "$WAITFORIT_cmdname: waiting for $WAITFORIT_HOST:$WAITFORIT_PORT without a timeout"

    WAITFORIT_start_ts=$(date +%s)
    while :
    do
        if test "$NC_PATH" != ""
        then
            nc -z $WAITFORIT_HOST $WAITFORIT_PORT
            WAITFORIT_result=$?
        else
            (echo -n > /dev/tcp/$WAITFORIT_HOST/$WAITFORIT_PORT) >/dev/null 2>&1
            WAITFORIT_result=$?
        fi
        if [ $WAITFORIT_result -eq 0 ]
        then
            WAITFORIT_end_ts=$(date +%s)
            echoerr "$WAITFORIT_cmdname: $WAITFORIT_HOST:$WAITFORIT_PORT is available after $((WAITFORIT_end_ts - WAITFORIT_start_ts)) seconds"
            break
        fi
        sleep 1
    done
    return $WAITFORIT_result
}

if [ $# -lt 2 ]
then
    usage
 else
    WAITFORIT_HOST=$1
    WAITFORIT_PORT=$2
    WAITFORIT_CLI=$3
fi

if test "$WAITFORIT_HOST" = "" -o "$WAITFORIT_PORT" = ""
then
    echoerr "Error: you need to provide a host and port to test."
    usage
fi

WAITFORIT_QUIET=0
WAITFORIT_TIMEOUT=0
NC_PATH=$(which nc)

wait_for
WAITFORIT_RESULT=$?

if test "$WAITFORIT_CLI" != ""
then
    exec "${WAITFORIT_CLI}"
else
    exit $WAITFORIT_RESULT
fi
