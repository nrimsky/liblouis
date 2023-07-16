source ./.github/workflows/scripts/emscripten-build-command.sh &&
mkdir out &&

echo "[liblouis-js] starting build process in docker image..." &&

./autogen.sh &&

echo "[liblouis-js] configuring and making UTF-16 builds..." &&
emconfigure ./configure --disable-shared &&
emmake make &&

emmake make install prefix="$(pwd)/out-emscripten-install"

buildjs "16" "build-tables-embeded-root-utf16.js" "--embed-files ./out-emscripten-install/share/liblouis/tables/" &&

echo "[liblouis-js] done building in docker image..."