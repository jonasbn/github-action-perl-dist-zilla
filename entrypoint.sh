#!/bin/bash

set -eo pipefail

# TODO: probably not the best way to setup local::lib, but bash --login
# is not doing it's job
PATH="/home/runner/perl5/bin${PATH:+:${PATH}}"
export PATH
PERL5LIB="/home/runner/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL5LIB
PERL_LOCAL_LIB_ROOT="/home/runner/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_LOCAL_LIB_ROOT
# shellcheck disable=SC2089
PERL_MB_OPT="--install_base \"/home/runner/perl5\"";
PERL_CPANM_HOME="/home/runner/perl5"
# shellcheck disable=SC2090
export PERL_MB_OPT PERL_CPANM_HOME
PERL_MM_OPT="INSTALL_BASE=/home/runner/perl5"
export PERL_MM_OPT

# to allow the optional minimum configuration of the CPAN client, as required
# by some distributions
if [ "${CPAN_CLIENT}" == 'true' ]
then
    echo -e '\nCreating minimal CPAN client configuration\n'
    echo | cpan
fi

# inspect dist.ini for the line: [Prereqs::FromCPANfile]
# set a variable to indicate the presence of the plugin
if grep -q '\[Prereqs::FromCPANfile\]' ./dist.ini
then
    echo -e '\nPrereqs::FromCPANfile plugin detected\n'
    export PREREQS_FROM_CPANFILE='true'
fi

echo -e '\nInstalling dependencies...\n'

if [ -e ./dist.ini ] && [ -e ./cpanfile ] && [ "${PREREQS_FROM_CPANFILE}" == 'true' ]
then
    echo -e '\nInstalling dependencies using dzil and cpanfile:\n'
    dzil authordeps --missing | cpanm --notest
    dzil listdeps --missing | cpanm --notest

elif [ -e ./dist.ini ]
then
    echo -e '\nInstalling dependencies using dzil:\n'
    dzil authordeps --missing | cpanm --notest
    dzil listdeps --missing | cpanm --notest

else
    echo -e '\nInstalling dependencies from cpanfile:\n'
    cpanm --installdeps .

fi

ls -la $PERL_CPANM_HOME/lib/perl5

set -u

LINE='---------------------------------------------'

echo -e "\nExecuting dzil with the following arguments in: >$(pwd)<:\n"
echo $LINE
echo "$@"
echo -e "${LINE}\n"

set +e

# shellcheck disable=SC2068
dzil $@

EXITCODE=$?

test $EXITCODE -eq 0 || echo "($EXITCODE) dzil failed, check the logs";

exit $EXITCODE
