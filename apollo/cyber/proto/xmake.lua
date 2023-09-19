add_requires("protobuf-cpp")

target("clock_cc_proto")
set_kind("static")
set_languages("c++17")
add_packages("protobuf-cpp", { public = true })
add_files("clock.proto", { rules = "protobuf.cpp", proto_public = true, proto_rootdir = "." })
