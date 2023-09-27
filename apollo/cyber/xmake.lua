add_requires("protobuf-cpp")

target("cc_proto")
  set_kind("static")
  set_languages("c++14")
  add_packages("protobuf-cpp", { public = true })
  add_files("**.proto", { rules = "protobuf.cpp", proto_public = true, proto_rootdir = "." })

target("cyber")
  set_kind("static")
  add_files("**.cc")

  add_files("**.proto", { rules = "protobuf.cpp", proto_public = true, proto_rootdir = "." })
  add_files("croutine/detail/swap_x86_64.S")
  add_deps("cc_proto")
  add_packages("protobuf-cpp", "glog", "nlohmann_json", "gflag", {public = true})
  set_policy("build.across_targets_in_parallel", false)