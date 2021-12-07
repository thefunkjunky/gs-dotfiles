#!/usr/bin/env bash

if [[ $OSTYPE != 'darwin'* ]]; then
  echo 'Not MacOS, skipping gcloud installation...'
  exit 0
fi

SDK_VERSION=355.0.0

if [[ `uname -m` == 'arm64' ]]; then
  echo M1
  SDK_FILE=google-cloud-sdk-$SDK_VERSION-darwin-arm.tar.gz
  SDK_URL=https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/$SDK_FILE
elif [[ `uname -m` == 'x86_64' ]]; then
  echo x86_64
  SDK_FILE=google-cloud-sdk-$SDK_VERSION-darwin-x86_64.tar.gz
  SDK_URL=https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/$SDK_FILE
fi

# curl -O $SDK_URL
# tar -xzvf $SDK_FILE -C $HOME
# rm $SDK_FILE
bash $HOME/google-cloud-sdk/install.sh \
  --usage-reporting false \
  --command-completion true \
  --path-update $HOME/.shellrc/bashrc.d/00-PATH.bash \
  --additional-components app-engine-go appctl cbt bigtable datalab cloud-datastore-emulator cloud-firestore-emulator pubsub-emulator cloud_sql_proxy emulator-reverse-proxy cloud-build-local docker-credential-gcr kustomize anthos-auth config-connector beta app-engine-python app-engine-python-extras app-engine-java bq gsutil core
source $HOME/.shellrc/bashrc.d/00-PATH.bash
