HARBOR_IMG ?= harbor.cloud.aurora.tech/library/cloud/kubeflow/pipelines/api-server
GIT_TAG ?= $(shell git describe --tags --always --dirty)
DOCKERFILE ?= backend/Dockerfile
UNIX_TS ?= $(shell date +%s)
IMAGE_TAG = $(GIT_TAG)-$(UNIX_TS)
harbor-push:
	docker push $(HARBOR_IMG):$(IMAGE_TAG)

.PHONY: harbor-image
harbor-image:
	docker build -t ${HARBOR_IMG}:$(IMAGE_TAG) -f ${DOCKERFILE} .
	docker push $(HARBOR_IMG):$(IMAGE_TAG)
