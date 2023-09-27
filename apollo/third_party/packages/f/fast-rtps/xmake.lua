package("fast-rtps")

on_load(function(package)
	package:set("installdir", path.join(os.scriptdir(), package:plat(), package:arch(), package:mode()))
end)

on_fetch(function(package)
	local result = {}
	result.links = { "fastcdr", "fastrtps" }
	result.linkdirs = package:installdir("lib")
	result.includedirs = package:installdir("include")
	result.libfiles = {
		path.join(package:installdir("lib"), "libfastcdr.so.1.0.7"),
		path.join(package:installdir("lib"), "libfastrtps.so.1.5.0"),
	}
	-- result.libfiles = {path.join(package:installdir("lib"), "libfastcdr.so.1.0.7"), path.join(package:installdir("lib"), "libfastrtps.so.1.5.0")}
	-- package.addenv("linkdirs", package:installdir("lib"))
	return result
end)

-- on_install("macosx", "linux", function (package)
--   import("package.tools.cmake").install(package)
-- end)
