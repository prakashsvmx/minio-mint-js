#!/bin/zsh
#
#  Minio Cloud Storage, (C) 2017 Minio, Inc.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#
#$WGET --output-document="${test_run_dir}/test/functional-tests.js" "https://raw.githubusercontent.com/prakashsvmx/minio-js/7.0.17/src/test/functional/functional-tests.js"
# ./run.sh info.log err.log

# handle command line arguments

./create-data-files.sh  && npm install && MINT_DATA_DIR=./data SERVER_ENDPOINT="localhost:22000" ACCESS_KEY=minio  SECRET_KEY=minio123  ./node_modules/mocha/bin/mocha -R minioreporter -b --exit 1>>"$output_log_file" 2>"$error_log_file"
