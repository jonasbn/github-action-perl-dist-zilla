# github-action-perl-dist-zilla

An experimental GitHub Action for Perl's Dist::Zilla

The action utilizes a Docker image Ebirah, offering easy access to Dist::Zilla's `dzil`.

The action is very _alpha_ software and even Ebirah is very experimental.

Currently the

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
        uses: jonasbn/github-action-perl-dist-zilla@master
        with:
          dzil-arguments: 'test --all'
```

## Resources and References

- [dzil.org](http://dzil.org/)
- [MetaCPAN: Dist::Zilla](https://metacpan.org/pod/Dist::Zilla)
- [GitHub: Ebirah](https://github.com/jonasbn/ebirah)
- [DockerHub: Ebirah][https://hub.docker.com/repository/docker/jonasbn/ebirah]

## License

This project is released under the MIT License, please see LICENSE file for details.
