
install_path="./minio-js/"
rm -rf $install_path

git clone https://github.com/minio/minio-js.git $install_path

cd $install_path || exit 0

LATEST="master" #$(git tag | tail -1)

git checkout "${LATEST}" --force

npm i
