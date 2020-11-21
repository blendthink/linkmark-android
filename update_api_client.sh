#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# API Client のパッケージ
API_CLIENT_PACKAGE=dev.honwakalab.linkmark.apiclient

# linkmark の API Client のパッケージ
LINKMARK_API_CLIENT_PACKAGE=$API_CLIENT_PACKAGE.linkmark

# linkmark の API Client の api, invoker, model のパッケージ
LINKMARK_API_CLIENT_API_PACKAGE=$LINKMARK_API_CLIENT_PACKAGE.api
LINKMARK_API_CLIENT_INVOKER_PACKAGE=$LINKMARK_API_CLIENT_PACKAGE.invoker
LINKMARK_API_CLIENT_MODEL_PACKAGE=$LINKMARK_API_CLIENT_PACKAGE.model

# Open API Generator の出力先
OPEN_API_GENERATOR_OUTPUT_DIR=$SCRIPT_DIR/apiclient/build/openApiGenerator/linkmark

# API Client の出力先
API_CLIENT_OUTPUT_DIR=$OPEN_API_GENERATOR_OUTPUT_DIR/src/main/kotlin/dev/honwakalab/linkmark/apiclient

# API Client infrastructure の出力先
API_CLIENT_INFRASTRUCTURE_OUTPUT_DIR=$API_CLIENT_OUTPUT_DIR/infrastructure

# API Client linkmark の出力先
API_CLIENT_LINKMARK_OUTPUT_DIR=$API_CLIENT_OUTPUT_DIR/linkmark

# プロジェクト内の API Client のディレクトリ
API_CLIENT_DIR=$SCRIPT_DIR/apiclient/src/main/kotlin/dev/honwakalab/linkmark/apiclient

# API Client の出力先を削除しておく
rm -rf $API_CLIENT_OUTPUT_DIR

# API Client 生成
java -jar openapi-generator-cli.jar generate \
  --generator-name kotlin \
  --library jvm-retrofit2 \
  --output $OPEN_API_GENERATOR_OUTPUT_DIR \
  --input-spec $SCRIPT_DIR/linkmark.yaml \
  --package-name $API_CLIENT_PACKAGE \
  --api-package $LINKMARK_API_CLIENT_API_PACKAGE \
  --invoker-package $LINKMARK_API_CLIENT_INVOKER_PACKAGE \
  --model-package $LINKMARK_API_CLIENT_MODEL_PACKAGE \
  --additional-properties collectionType=list,dateLibrary=java8,enumPropertyNaming=UPPERCASE,serializationLibrary=kotlinx_serialization,useCoroutines=true

# API Client 生成に成功したら、プロジェクト内の API Client のディレクトリを空っぽにする
rm -rf $API_CLIENT_DIR
mkdir -p $API_CLIENT_DIR

# 必要なファイルをコピーする
cp -r $API_CLIENT_INFRASTRUCTURE_OUTPUT_DIR $API_CLIENT_DIR
cp -r $API_CLIENT_LINKMARK_OUTPUT_DIR $API_CLIENT_DIR
