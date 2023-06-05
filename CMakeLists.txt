cmake_minimum_required(VERSION 3.7.2)

# ---- project ----
include(.cmake/project_options.cmake) # toolkit of project options

project("amplify" VERSION "0.0.0" LANGUAGES "C" "CXX"
  HOMEPAGE_URL "https://github.com/robertefry/amplify"
  DESCRIPTION "My collection of C++ utilities to extend and complement the standard libraries.")

# Since this project is designed to extend the standard libraries, we require
# the earliest "complete" standard to maximise it's applications.
set(CMAKE_CXX_STANDARD "11")

# Strongly encouraged to enable this globally to avoid conflicts between
# -Wpedantic being enabled and -std=c++20 and -std=gnu++20 for example
# when compiling with PCH enabled
set(CMAKE_CXX_EXTENSIONS OFF)

# ---- add dependencies via CPM ----
# see https://github.com/cpm-cmake/CPM.cmake for more info
include(.cmake/get_cpm.cmake)
include(.cmake/declare_system_libraries.cmake)

CPMAddPackage(NAME "Catch2"
  GITHUB_REPOSITORY "catchorg/Catch2" VERSION "3.3.2")
declare_system_libraries(Catch2::Catch2 Catch2::Catch2WithMain)

# ---- project targets ----
include(.cmake/build_defaults.cmake) # toolkit of buildsystem　defaults

# ---- project packaged targets ----
# this allows users to install and find the library via `find_package`.
CPMAddPackage("gh:TheLartians/PackageProject.cmake@1.11.0")
