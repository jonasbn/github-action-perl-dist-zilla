# Change log for GitHub Action Perl Dist::Zilla

## 0.5.5 2024-07-03 Maintenance release, update recommended

- Removing `USER` directive from Dockerfile, since it is not supported by GitHub Actions.

  REF: [docs.github.com](https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners/about-github-hosted-runners#file-systems)]

## 0.5.4 2024-07-03 Maintenance release, update recommended

- Added more debug information to the output, to help diagnose the issue with the build directory.

## 0.5.3 2024-07-02 Maintenance release, update recommended

- Attempting to correct a second bug (second attempt) by changing to `/tmp/` as build directory.

## 0.5.2 2024-07-02 Maintenance release, update recommended

- Attempting to correct a second bug (we got past the first one):

  `mkpath failed for .build: Permission denied at /home/runner/perl5/lib/perl5/Dist/Zilla/Dist/Builder.pm line 668.`

  When running the following command (default):

  ```bash
  dzil test
  ```

  The test step requires a build directory, which is created by the `dzil build` command, but the `dzil test`.

  Observed in: [jonasbn/perl-date-holidays/](https://github.com/jonasbn/perl-date-holidays/)

  Have added `--verbose` to `dzil` to get some more information on the issue.

## 0.5.1 2024-07-02 Maintenance release, update recommended

- Attempt a correcting bug:

  `Can't write to cpanm home '/github/home/.cpanm': You should fix it with chown/chmod first.`

  Observed in: [jonasbn/perl-date-holidays/](https://github.com/jonasbn/perl-date-holidays/)

## 0.5.0 2024-06-30 Maintenance release, update recommended

- Bumped [Ebirah](https://github.com/jonasbn/ebirah) requirement from version 0.8.0 to 0.9.0. Which had the core component Dist::Zilla updated from version `6.025` to `6.032`. Please see change log for [Ebirah](https://github.com/jonasbn/ebirah).

## 0.4.0 2022-10-03 Maintenance release, update recommended

- Bumped [Ebirah](https://github.com/jonasbn/ebirah) requirement from version 0.7.0 to 0.8.0. Which had the core component Dist::Zilla updated from version `6.017` to `6.025`. Please see change log for [Ebirah](https://github.com/jonasbn/ebirah).

## 0.3.0 2022-09-03 Feature release, update not required

- Bumped [Ebirah](https://github.com/jonasbn/ebirah) requirement from version 0.6.0 to 0.7.0. Please see [Ebirah](https://github.com/jonasbn/ebirah) change log for details

- This release holds a set of enhancements by @glasswalk3er via PR: [#22](https://github.com/jonasbn/github-action-perl-dist-zilla/pull/22)
  - Allows repositories that does not have a `cpanfile` to have their dependencies installed
  - Does optional configuration of the [CPAN](https://metacpan.org/pod/CPAN) client, since it might be required by some distributions
  - Changed to use of Bash, since it is available in the Docker image
  - Fixed entry point so it can be tested outside GitHub eco-system

## 0.2.0 2020-12-13 Maintenance release, update not required

- Bumped [Ebirah](https://github.com/jonasbn/ebirah) requirement from version 0.4.0 to 0.6.0. Please see [Ebirah](https://github.com/jonasbn/ebirah) change log for details

## 0.1.0 2020-05-06 Feature release

- Initial release
- Support for very limited use of [Dist::Zilla](https://metacpan.org/pod/Dist::Zilla) 6.014
