#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)

rm -rf $SCRIPT_DIR/apiclient/build/openApiGenerator/linkmark

java -jar openapi-generator-cli.jar generate \
  --generator-name kotlin \
  --library jvm-retrofit2 \
  --output $SCRIPT_DIR/apiclient/build/openApiGenerator/linkmark \
  --input-spec $SCRIPT_DIR/linkmark.yaml \
  --package-name dev.honwakalab.linkmark.apiclient \
  --api-package dev.honwakalab.linkmark.apiclient.linkmark.api \
  --invoker-package dev.honwakalab.linkmark.apiclient.linkmark.invoker \
  --model-package dev.honwakalab.linkmark.apiclient.linkmark.model \
  --additional-properties collectionType=list,dateLibrary=java8,enumPropertyNaming=UPPERCASE,serializationLibrary=kotlinx_serialization,useCoroutines=true

rm -rf $SCRIPT_DIR/apiclient/src/main/kotlin/dev/honwakalab/linkmark/apiclient/infrastructure
rm -rf $SCRIPT_DIR/apiclient/src/main/kotlin/dev/honwakalab/linkmark/apiclient/linkmark

mkdir "$SCRIPT_DIR/apiclient/src/main/kotlin/dev/honwakalab/linkmark/apiclient/infrastructure"
mkdir "$SCRIPT_DIR/apiclient/src/main/kotlin/dev/honwakalab/linkmark/apiclient/linkmark"

sudo chmod -R 755 $SCRIPT_DIR/apiclient/src/main/kotlin/dev/honwakalab/linkmark/apiclient/infrastructure
sudo chmod -R 755 $SCRIPT_DIR/apiclient/src/main/kotlin/dev/honwakalab/linkmark/apiclient/linkmark

cp -r $SCRIPT_DIR/apiclient/build/openApiGenerator/linkmark/src/main/kotlin/dev/honwakalab/linkmark/apiclient/infrastructure $SCRIPT_DIR/apiclient/src/main/kotlin/dev/honwakalab/linkmark/apiclient/infrastructure
cp -r $SCRIPT_DIR/apiclient/build/openApiGenerator/linkmark/src/main/kotlin/dev/honwakalab/linkmark/apiclient/linkmark $SCRIPT_DIR/apiclient/src/main/kotlin/dev/honwakalab/linkmark/apiclient/linkmark
