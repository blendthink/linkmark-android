#!/bin/sh

rm -rf ./apiclient/build/openApiGenerator/linkmark

java -jar openapi-generator-cli.jar generate \
  --generator-name kotlin \
  --library jvm-retrofit2 \
  --output ./apiclient/build/openApiGenerator/linkmark \
  --input-spec ./linkmark.yaml \
  --package-name dev.honwakalab.linkmark.apiclient \
  --api-package dev.honwakalab.linkmark.apiclient.linkmark.api \
  --invoker-package dev.honwakalab.linkmark.apiclient.linkmark.invoker \
  --model-package dev.honwakalab.linkmark.apiclient.linkmark.model \
  --additional-properties collectionType=list,dateLibrary=java8,enumPropertyNaming=UPPERCASE,serializableModel=true,serializationLibrary=kotlinx_serialization,useCoroutines=true

rm -rf ./apiclient/src/main/kotlin/dev/honwakalab/linkmark/apiclient/infrastructure
rm -rf ./apiclient/src/main/kotlin/dev/honwakalab/linkmark/apiclient/linkmark

cp -r ./apiclient/build/openApiGenerator/linkmark/src/main/kotlin/dev/honwakalab/linkmark/apiclient/infrastructure ./apiclient/src/main/kotlin/dev/honwakalab/linkmark/apiclient/infrastructure
cp -r ./apiclient/build/openApiGenerator/linkmark/src/main/kotlin/dev/honwakalab/linkmark/apiclient/linkmark ./apiclient/src/main/kotlin/dev/honwakalab/linkmark/apiclient/linkmark
