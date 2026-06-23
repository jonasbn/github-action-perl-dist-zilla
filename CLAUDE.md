# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repository Is

A Docker-based GitHub Action that wraps Perl's [Dist::Zilla](http://dzil.org/) (`dzil`) CLI tool. Users include this action in their Perl project workflows to install dependencies and run `dzil` commands (e.g., `dzil test --all`).

The action is built on top of the [Ebirah](https://github.com/jonasbn/ebirah) Docker base image, which provides a pre-installed Dist::Zilla environment. The current base image version is `jonasbn/ebirah:0.11.0` (pinned in `Dockerfile`).

## Architecture

The three core files and how they interact:

- **`action.yml`** — Declares the action interface. Accepts a single input `dzil-arguments` (required, defaults to `help`). Instructs GitHub to build and run the local `Dockerfile`, passing the input as args.
- **`Dockerfile`** — Extends `jonasbn/ebirah`, copies `entrypoint.sh` into `/opt`, sets `WORKDIR /tmp` (intentionally `/tmp`, not `/opt` — dzil needs a writable build directory and `/opt` caused permission issues in GitHub-hosted runners).
- **`entrypoint.sh`** — The runtime logic. Sets up `local::lib` paths for the `runner` user, then:
  1. Optionally initializes the CPAN client if `CPAN_CLIENT=true` is set.
  2. Detects `[Prereqs::FromCPANfile]` in `dist.ini` and sets `PREREQS_FROM_CPANFILE=true`.
  3. Installs dependencies via one of two paths based on what config files exist (`dist.ini` + `cpanfile` with the plugin, or `dist.ini` alone). Note: the script currently expects `dist.ini` to exist because it greps it for `[Prereqs::FromCPANfile]`.
  4. Runs `dzil $@` with the forwarded arguments, propagating the exit code.

## Common Commands

**Build the Docker image locally:**

```bash
make image
```

This runs `docker buildx build --no-cache` with a `NOW` build-arg timestamp for the `org.opencontainers.image.created` label.

**Test the Docker image locally against a Perl project:**

```bash
docker run --rm -v $PWD:/opt jonasbn/github-action-perl-dist-zilla help
```

Replace `help` with any `dzil` subcommand (e.g., `test --all`). Mount the Perl project directory to `/opt`.

## CI / Linting

Two workflows run on every push:

- **Markdownlint** (`markdownlint.yml`) — Uses `nosborn/github-action-markdown-cli`. Config in `.markdownlint.json` (currently only disables line-length rule).
- **Spellcheck** (`spellcheck.yml`) — Uses `rojopolis/spellcheck-github-actions` with `aspell` (English). Config in `.spellcheck.yaml`. Custom allowed words are in `.wordlist.txt`.

When adding new technical terms or proper nouns to Markdown files, add them to `.wordlist.txt` to avoid spellcheck failures.

## Key Conventions

- **Action pins**: Workflow steps reference actions by SHA commit hash (e.g., `actions/checkout@df4cb1c...`), not just a tag. Follow this pattern when adding or updating workflow steps.
- **Versioning**: Releases follow semver and are documented in `Changelog.md`. The action is referenced by consumers as `jonasbn/github-action-perl-dist-zilla@<version>`.
- **Dockerfile `USER`**: `Dockerfile` currently sets `USER root`. Avoid switching to a non-root user unless you also adjust filesystem permissions for GitHub Actions' mounted workspace.
- **Ebirah upgrades**: Upgrading the base image means changing the `FROM` line in `Dockerfile` and documenting the Ebirah version and resulting Dist::Zilla version in `Changelog.md`.
