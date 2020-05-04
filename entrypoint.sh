#!/bin/sh -l

echo ""
echo "Using dzil for CI test"
echo "------------------------"

dzil installdeps && dzil test --all

EXITCODE=$?

test $EXITCODE -eq 0 || echo "($EXITCODE) Test failed, check logs";

exit $EXITCODE
