project "Box2D"
	kind "StaticLib"
	language "C++"
    staticruntime "on"

	targetdir("%{wks.location}/Build/Binary/"..output_dir.."/%{prj.name}");
	objdir("%{wks.location}/Build/Intermediate/"..output_dir.."/%{prj.name}");

	files
	{
		"src/**.h",
		"src/**.cpp",
		"include/**.h"
	}
	
	includedirs
	{
		"include",
		"src"
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++latest"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

    filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"
