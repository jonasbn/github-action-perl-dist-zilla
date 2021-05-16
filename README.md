# github-action-perl-dist-zilla

An experimental GitHub Action for Perl's Dist::Zilla

The action utilizes a Docker image based on [Ebirah](https://github.com/jonasbn/ebirah), offering easy access to a containerized version Dist::Zilla's `dzil`.

The action is very _alpha_ software and Ebirah is very experimental.

Currently the implementation can be used for continuous integration (CI), more information below.

## Inputs

### `dzil-arguments`

**Required** the arguments to the `dzil` command. Default `help`, which displays a help message

## Example usage

```yaml
name: Dist::Zilla Action
on: push

jobs:
  dzil:
    runs-on: ubuntu-latest
    name: "dzil run"
    steps:
      - name: "Checkout repository"
        uses: actions/checkout@v2
      - name: "Installing dependencies and testing all using dzil"
        uses: jonasbn/github-action-perl-dist-zilla@0.2.0
        with:
          dzil-arguments: 'test --all'
```

More examples are available here:

- [App::Yak](https://github.com/jonasbn/perl-app-yak)

## Resources and References

1. [dzil.org](http://dzil.org/)
1. [MetaCPAN: Dist::Zilla](https://metacpan.org/pod/Dist::Zilla)
1. [GitHub: Ebirah](https://github.com/jonasbn/ebirah)
1. [DockerHub: Ebirah](https://hub.docker.com/repository/docker/jonasbn/ebirah)

## License

This project is released under the MIT License, please see LICENSE file for details.
