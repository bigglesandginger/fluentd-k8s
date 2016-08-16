IMAGE = fluentd-k8s
TAG = 0.3.1

build:
	docker build -t better/${IMAGE}:${TAG} .
	docker tag better/${IMAGE}:${TAG} better/${IMAGE}:latest

push:
	docker push better/${IMAGE}:${TAG}
	docker push better/${IMAGE}:latest
