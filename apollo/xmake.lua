set_project("apollo")

set_languages("c++14")

set_warnings("all")

add_rules("mode.debug", "mode.release")

add_repositories("repo third_party")

add_requires("gtest", "glog 0.4.0", "gflags","nlohmann_json", "protobuf-cpp", {system = false , external = false})
add_requires("fast-rtps", {system = false , external = false})

-- add_includedirs("$(projectdir)/build/.gens/cc_proto/linux/x86_64/release/rules/protobuf")

add_includedirs("$(projectdir)")

add_packages("fast-rtps")



add_syslinks("pthread", "dl", "uuid", "atomic", "rt")

includes("cyber")

-- target("task_test")
--   set_kind("binary")
--   add_files("example/croutine/croutine_test.cc")
--   add_deps("cc_proto", "cyber")
--   add_packages("protobuf-cpp", "glog", "nlohmann_json", "gflag", "gtest", { public = true })
--   set_policy("build.across_targets_in_parallel", false)

target("listener")
  set_kind("binary")
  add_files("example/listener.cc")
  add_deps("cc_proto", "cyber")
  add_packages("protobuf-cpp", "glog", "nlohmann_json", "gflag")
  set_policy("build.across_targets_in_parallel", false)

target("talker")
  set_kind("binary")
  add_files("example/talker.cc")
  add_deps("cc_proto", "cyber")
  add_packages("protobuf-cpp", "glog", "nlohmann_json", "gflag")
  set_policy("build.across_targets_in_parallel", false)





--
-- If you want to known more usage about xmake, please see https://xmake.io
--
-- ## FAQ
--
-- You can enter the project directory firstly before building project.
--
--   $ cd projectdir
--
-- 1. How to build project?
--
--   $ xmake
--
-- 2. How to configure project?
--
--   $ xmake f -p [macosx|linux|iphoneos ..] -a [x86_64|i386|arm64 ..] -m [debug|release]
--
-- 3. Where is the build output directory?
--
--   The default output directory is `./build` and you can configure the output directory.
--
--   $ xmake f -o outputdir
--   $ xmake
--
-- 4. How to run and debug target after building project?
--
--   $ xmake run [targetname]
--   $ xmake run -d [targetname]
--
-- 5. How to install target to the system directory or other output directory?
--
--   $ xmake install
--   $ xmake install -o installdir
--
-- 6. Add some frequently-used compilation flags in xmake.lua
--
-- @code
--    -- add debug and release modes
--    add_rules("mode.debug", "mode.release")
--
--    -- add macro defination
--    add_defines("NDEBUG", "_GNU_SOURCE=1")
--
--    -- set warning all as error
--    set_warnings("all", "error")
--
--    -- set language: c99, c++11
--    set_languages("c99", "c++11")
--
--    -- set optimization: none, faster, fastest, smallest
--    set_optimize("fastest")
--
--    -- add include search directories
--    add_includedirs("/usr/include", "/usr/local/include")
--
--    -- add link libraries and search directories
--    add_links("tbox")
--    add_linkdirs("/usr/local/lib", "/usr/lib")
--
--    -- add system link libraries
--    add_syslinks("z", "pthread")
--
--    -- add compilation and link flags
--    add_cxflags("-stdnolib", "-fno-strict-aliasing")
--    add_ldflags("-L/usr/local/lib", "-lpthread", {force = true})
--
-- @endcode
--
