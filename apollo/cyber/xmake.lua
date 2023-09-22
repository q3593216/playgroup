includes("data")
includes("proto")

target("init")
set_kind("shared")
add_files("init.cc")
add_deps("clock_cc_proto")
set_policy("build.across_targets_in_parallel", false)
