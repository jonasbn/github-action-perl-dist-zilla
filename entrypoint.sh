#!/bin/sh -l

echo ""
echo "Using dzil for CI test"
echo "----------------------"
echo "$@"
echo "----------------------"

$@

EXITCODE=$?

test $EXITCODE -eq 0 || echo "($EXITCODE) dzil failed, check logs";

exit $EXITCODE
