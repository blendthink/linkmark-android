#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# API Client コードの出力先
API_CLIENT_OUTPUT_DIR=$SCRIPT_DIR/apiclient/build/openApiGenerator/linkmark

API_CLIENT_PACKAGE_NAME=dev.honwakalab.linkmark.apiclient
API_CLIENT_API_PACKAGE=dev.honwakalab.linkmark.apiclient.linkmark.api
API_CLIENT_INVOKER_PACKAGE=dev.honwakalab.linkmark.apiclient.linkmark.invoker
API_CLIENT_MODEL_PACKAGE=dev.honwakalab.linkmark.apiclient.linkmark.model

API_CLIENT_DIR=$SCRIPT_DIR/apiclient/src/main/kotlin/dev/honwakalab/linkmark/apiclient

# API Client コードの出力先を削除しておく
rm -rf $API_CLIENT_OUTPUT_DIR

java -jar openapi-generator-cli.jar generate \
  --generator-name kotlin \
  --library jvm-retrofit2 \
  --output $API_CLIENT_OUTPUT_DIR \
  --input-spec $SCRIPT_DIR/linkmark.yaml \
  --package-name $API_CLIENT_PACKAGE_NAME \
  --api-package $API_CLIENT_API_PACKAGE \
  --invoker-package $API_CLIENT_INVOKER_PACKAGE \
  --model-package $API_CLIENT_MODEL_PACKAGE \
  --additional-properties collectionType=list,dateLibrary=java8,enumPropertyNaming=UPPERCASE,serializationLibrary=kotlinx_serialization,useCoroutines=true

# API Client コードの出力先に移動
cd $API_CLIENT_OUTPUT_DIR

# コード生成に成功したらコピー先のディレクトリを削除する
rm -rf $API_CLIENT_DIR

mkdir $API_CLIENT_DIR

cp -r ./src/main/kotlin/dev/honwakalab/linkmark/apiclient/infrastructure $API_CLIENT_DIR
cp -r ./src/main/kotlin/dev/honwakalab/linkmark/apiclient/linkmark $API_CLIENT_DIR
