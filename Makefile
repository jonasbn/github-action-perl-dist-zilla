now=$(shell date --iso-8601=ns)

image:
	docker buildx build --tag github-action-perl-dist-zilla --build-arg "NOW=${now}" .

