#!/bin/sh

sudo rm -rf ./apiclient/build/openApiGenerator/linkmark

java -jar openapi-generator-cli.jar generate \
  --enable-post-process-file \
  --generator-name kotlin \
  --library jvm-retrofit2 \
  --output ./apiclient/build/openApiGenerator/linkmark \
  --input-spec ./linkmark.yaml \
  --package-name dev.honwakalab.linkmark.apiclient \
  --api-package dev.honwakalab.linkmark.apiclient.linkmark.api \
  --invoker-package dev.honwakalab.linkmark.apiclient.linkmark.invoker \
  --model-package dev.honwakalab.linkmark.apiclient.linkmark.model \
  --additional-properties collectionType=list,dateLibrary=java8,enumPropertyNaming=UPPERCASE,serializationLibrary=kotlinx_serialization,useCoroutines=true

sudo rm -rf ./apiclient/src/main/kotlin/dev/honwakalab/linkmark/apiclient/infrastructure
sudo rm -rf ./apiclient/src/main/kotlin/dev/honwakalab/linkmark/apiclient/linkmark

sudo cp -r ./apiclient/build/openApiGenerator/linkmark/src/main/kotlin/dev/honwakalab/linkmark/apiclient/infrastructure ./apiclient/src/main/kotlin/dev/honwakalab/linkmark/apiclient/infrastructure
sudo cp -r ./apiclient/build/openApiGenerator/linkmark/src/main/kotlin/dev/honwakalab/linkmark/apiclient/linkmark ./apiclient/src/main/kotlin/dev/honwakalab/linkmark/apiclient/linkmark
