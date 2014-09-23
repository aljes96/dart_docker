#! /bin/bash
# Build the Docker images for Dart.
#
# This is only used to test the Docker images locally. For distribution
# the automated builds on hub.docker.com is used.
VERSION=1.6.0
REPOSITORY_PREFIX=google_test
echo 'Building base'
docker build -t $REPOSITORY_PREFIX/dart base
docker tag $REPOSITORY_PREFIX/dart $REPOSITORY_PREFIX/dart:$VERSION
echo 'Building runtime'
docker build -t $REPOSITORY_PREFIX/dart-runtime runtime
docker tag $REPOSITORY_PREFIX/dart $REPOSITORY_PREFIX/dart-runtime:$VERSION
echo 'Building hello'
cd hello
pub update
cd ..
docker build -t $REPOSITORY_PREFIX/dart-hello hello
docker tag $REPOSITORY_PREFIX/dart-hello $REPOSITORY_PREFIX/dart-hello:$VERSION
