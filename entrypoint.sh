#!/bin/bash

set -eo pipefail

# to allow the optional minimum configuration of the CPAN client, as required
# by some distributions
if [ "${CPAN_CLIENT}" == 'true' ]
then
    echo -e '\nCreating minimal CPAN client configuration\n'
    echo | cpan
fi

echo -e '\nInstalling dependencies...\n'

if [ -e ./cpanfile ]
then
    cpanm --installdeps .
else
    dzil authordeps --missing | cpanm --notest
    dzil listdeps --missing | cpanm --notest
fi

set -u

LINE='---------------------------------------------'

echo -e '\nExecuting dzil with the following arguments:\n'
echo $LINE
echo "$@"
echo -e "${LINE}\n"

set +e

# shellcheck disable=SC2068
dzil $@

EXITCODE=$?

test $EXITCODE -eq 0 || echo "($EXITCODE) dzil failed, check logs";

exit $EXITCODE

