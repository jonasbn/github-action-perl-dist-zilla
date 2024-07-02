now=$(shell date +"%Y-%m-%dT%H:%M:%S.%N%z")

image:
	docker buildx build --no-cache --tag jonasbn/github-action-perl-dist-zilla:latest --build-arg "NOW=${now}" .
