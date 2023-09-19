includes("data")
includes("proto")

target("init")
set_kind("shared")
add_files("init.cc")
add_deps("clock_cc_proto")
