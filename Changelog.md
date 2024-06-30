# Change log for GitHub Action Perl Dist::Zilla

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
