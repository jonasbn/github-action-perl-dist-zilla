#!/bin/sh -l

echo ""
echo "Installing dependencies specified in cpanfile"
echo ""

cpanm --installdeps .

echo ""
echo "Executing dzil with the following arguments: "
echo "---------------------------------------------"
echo "$@"
echo "---------------------------------------------"
echo ""

$@

EXITCODE=$?

test $EXITCODE -eq 0 || echo "($EXITCODE) dzil failed, check logs";

exit $EXITCODE
