# github-action-perl-dist-zilla

An experimental GitHub Action for Perl's [Dist::Zilla][dzil.org]

The action utilizes a Docker image based on [Ebirah][ebirah], offering easy access to a containerized version Dist::Zilla's `dzil`.

The action is very _alpha_ software and Ebirah is very experimental.

Currently the implementation can be used for continuous integration (CI), more information below.

## Inputs

### `dzil-arguments`

**Required** the arguments to the `dzil` command. Default `help`, which displays a help message

`dzil` has a `--verbose` option, which can be used to get more information on the execution of the command.

## Example usage

```yaml
name: Dist::Zilla Action
on: push

jobs:
  dzil:
    runs-on: ubuntu-latest
    name: "dzil run"
    steps:
      - name: Check out repository
        uses: actions/checkout@v3
      - name: Installing dependencies and testing all using dzil
        uses: jonasbn/github-action-perl-dist-zilla@0.5.0
        with:
          dzil-arguments: 'test --all'
```

More examples are available here:

- [perl-app-yak](https://github.com/jonasbn/perl-app-yak)
- [perl-date-holidays](https://github.com/jonasbn/perl-date-holidays)
- [perl-date-holidays-abstract](https://github.com/jonasbn/perl-date-holidays)
- [perl-date-holidays-super](https://github.com/jonasbn/perl-date-holidays)

### Running the GitHub Action Locally

It is possible to test the Docker image locally.

```bash
docker run --rm -v $PWD:/opt jonasbn/github-action-perl-dist-zilla help
```

## Diagnostics

### `dzil authordeps only works on dist.ini files, and you don't have one`

If you run the action in a repository or directory, which does not contain a `dist.ini` the message:

- `dzil authordeps only works on dist.ini files, and you don't have one`

Will be emitted.

Make sure you are testing in a directory containing a `dist.ini`, which is a [Dist::Zilla][dzil.org] configuration file.

## Acknowledgements

- Ricardo Signes ([@rjbs](https://github.com/rjbs)) author of [Dist::Zilla]([dzil.org])
- Alceu Rodrigues de Freitas Junior ([@glasswalk3r](https://github.com/glasswalk3r)) contributor to this repository
- All of the Dist::Zilla plugin authors and Dist::Zilla contributors

## Resources and References

1. [dzil.org]
2. [MetaCPAN: Dist::Zilla](https://metacpan.org/pod/Dist::Zilla)
3. [GitHub: Ebirah][ebirah]
4. [DockerHub: Ebirah](https://hub.docker.com/repository/docker/jonasbn/ebirah)

## License

This project is released under the MIT License, please see LICENSE file for details.

[dzil.org]: http://dzil.org/
[ebirah]: https://github.com/jonasbn/ebirah
