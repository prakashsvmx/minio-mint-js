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

./create-data-files.sh
 #npm install
 rm -f "./logs.log" ||true
 rm -f "./errors.log"||true

 export MINT_DATA_DIR="$PWD/data"
 export SERVER_ENDPOINT="localhost:22000"
 export ACCESS_KEY=minio
 export SECRET_KEY=minio123
 mocha "./minio-js/tests/functional" -R minioreporter -b --exit 1>>"./logs.log" 2>"./errors.log"