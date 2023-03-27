## `minio-js` tests
This directory serves as the location for Mint tests using `minio-js`.  Top level `mint.sh` calls `run.sh` to execute tests.

## Adding new tests
New tests is added in functional tests of minio-js.  Please check https://github.com/minio/minio-js

## Running tests manually
- Set environment variables `MINT_DATA_DIR`, `MINT_MODE`, `SERVER_ENDPOINT`, `ACCESS_KEY`, `SECRET_KEY`, `SERVER_REGION` and `ENABLE_HTTPS`
- Call `run.sh` with output log file and error log file. for example
```bash
export MINT_DATA_DIR=~/my-mint-dir
export MINT_MODE=core
export SERVER_ENDPOINT="play.minio.io:9000"
export ACCESS_KEY="Q3AM3UQ867SPQQA43P2F"
export SECRET_KEY="zuf+tfteSlswRu7BJ86wekitnifILbZam1KYY3TG"
export ENABLE_HTTPS=1
export SERVER_REGION=us-east-1
./run.sh /tmp/output.log /tmp/error.log
```


Running locally:
Run server locally in erasure coded setup..
MINIO_ROOT_USER=minio MINIO_ROOT_PASSWORD=minio123 minio server /tmp/data{1..4} --address ":22000" --console-address ":9001"


Branch/Fix Testing:

Modify the package.json to include the correct version/branch
e.g : "minio": "git+https://github.com/harshavardhana/minio-js.git#cleanup-js",

#git+https://github.com/prakashsvmx/minio-js.git#fix-test-mint-s3-gw

replace the functional test in test/ folder with the content from version/branch and modify the functional tests to point to the server

SERVER_ENDPOINT="localhost:9000" ./node_modules/mocha/bin/mocha -R minioreporter

Verify that there are no failed tests.

MINIO_ROOT_USER=minio MINIO_ROOT_PASSWORD=minio123 ./minio gateway nas /tmp/nas --address ":22000" --console-address ":22001"

//Run s3 gateway

//MINIO_ROOT_USER=<AWS_KEY> MINIO_ROOT_PASSWORD=<AWS_SECRET> minio gateway s3 --address ":22000" --console-address ":22001"

Run Tests:
//ACCESS_KEY=<AWS_KEY> SECRET_KEY=<AWS_SECRET> SERVER_ENDPOINT="localhost:22000" ./node_modules/mocha/bin/mocha -R minioreporter


ACCESS_KEY=minio SECRET_KEY=minio123 SERVER_ENDPOINT="localhost:22000" ./node_modules/mocha/bin/mocha -R minioreporter

For latest release version specific testing:

./install.sh
then
./run.sh
