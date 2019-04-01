REM @echo off

set deployPath=D:\workspace\gritmodeler1\deploy-win64
set cmakeToolchainArgument=-DCMAKE_TOOLCHAIN_FILE=%deployPath%/vcpkg_share/scripts/buildsystems/vcpkg.cmake
set generatorArgument=-G"Visual Studio 15 2017 Win64"
set opencvArgument=-DOpenCV_DIR="%deployPath%/openCV_share"
set "cmakeGenerateArguments=.. %cmakeToolchainArgument% %generatorArgument%"
set "cmakeCompileArguments=--build . --target install"

echo Configuring and building ORB_SLAM2 ...

mkdir build
pushd build
cmake %cmakeGenerateArguments% %opencvArgument%
popd
exit /b