# Copyright (c) 2024 [Ribose Inc](https://www.ribose.com).
# All rights reserved.
# This file is a part of the Tebako project.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.

def_ext_prj_t(LIBHOWARDHINNANTDATE "3.0.1" "7a390f200f0ccd207e8cff6757e04817c1a0aec3e327b006b7eb451c57ee3538")

message(STATUS "Collecting libutfcpp - " v${LIBHOWARDHINNANTDATE_VER} " at " ${LIBHOWARDHINNANTDATE_SOURCE_DIR})

set(CMAKE_ARGUMENTS -DCMAKE_INSTALL_PREFIX=${DEPS}
                    -DUTF8_INSTALL=OFF
                    -DUTF8_SAMPLES=OFF
                    -DUTF8_TESTS=OFF
                    -DCMAKE_BUILD_TYPE=Release
                    -DCMAKE_PREFIX_PATH=${CMAKE_PREFIX_PATH}
                    -DCMAKE_OSX_ARCHITECTURES=${CMAKE_OSX_ARCHITECTURES}
)

if(TEBAKO_BUILD_TARGET)
  list(APPEND CMAKE_ARGUMENTS  -DCMAKE_C_FLAGS=--target=${TEBAKO_BUILD_TARGET})
  list(APPEND CMAKE_ARGUMENTS  -DCMAKE_EXE_LINKER_FLAGS=--target=${TEBAKO_BUILD_TARGET})
  list(APPEND CMAKE_ARGUMENTS  -DCMAKE_SHARED_LINKER_FLAGS=--target=${TEBAKO_BUILD_TARGET})
endif(TEBAKO_BUILD_TARGET)

ExternalProject_Add(${LIBHOWARDHINNANTDATE_PRJ}
  PREFIX "${DEPS}"
  URL https://github.com/HowardHinnant/date/archive/refs/tags/v${LIBHOWARDHINNANTDATE_VER}.tar.gz
  URL_HASH SHA256=${LIBHOWARDHINNANTDATE_HASH}
  DOWNLOAD_NO_PROGRESS true
  UPDATE_COMMAND ""
  CMAKE_ARGS ${CMAKE_ARGUMENTS}
  SOURCE_DIR ${LIBHOWARDHINNANTDATE_SOURCE_DIR}
  BINARY_DIR ${LIBHOWARDHINNANTDATE_BINARY_DIR}
  BUILD_BYPRODUCTS ${__LIBHOWARDHINNANTDATE}
)
