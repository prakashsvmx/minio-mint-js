
install_path="./minio-js/"
rm -rf $install_path

git clone https://github.com/minio/minio-js.git $install_path

cd "./minio-js" || exit 0

pwd

LATEST="master" #$(git tag | tail -1)

git checkout "${LATEST}" --force

npm i
