# CMakeTemplate

Template of CMake (>=v3.19) C++ library project

Includes:
+ boost
+ gtest

```bash
ROOT=$PWD && \
cd $ROOT/tools && \
git clone https://github.com/google/googletest.git && \
mkdir $ROOT/build && \
cd $ROOT/build
```
```bash
cmake ..
cmake --build .
```
