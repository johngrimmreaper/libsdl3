# Copyright 2019 Collabora Ltd.
# SPDX-License-Identifier: Zlib
# (see "zlib/libpng" in debian/copyright)

cmake_minimum_required(VERSION 3.13)
project(Hello)

find_package(SDL3 REQUIRED)
include_directories(${SDL3_INCLUDE_DIRS})

add_executable(hello hello.c)
target_link_libraries(hello SDL3)
