# PlusBuild
This project contains CMake scripts for building Plus library, applications, and all required dependencies.
This fork was cloned from PlusToolkit/PlusBuild.git and is intended to be extended specifically for interfacing with the da Vinci Si robot.

# Documentation

Required:
	CMake 3.10.3
	Microsoft Visual Studio 2010
Steps:
	Open CMake
	Set source directory to this repository
	Set build directory to whereevery you want to build the project
	Configure with Visual Studio 2010 WIN32 native compliers
	Set flags:
		PLUSAPP_TEST_GUI              : FALSE
		PLUSBUILD_BUILD_PLUSAPP       : FALSE
		PLUSBUILD_BUILD_PLUS_WIDGETS  : FALSE
		PLUSBUILD_USE_IntuitiveDaVinci : TRUE
		PLUSBUILD_USE_<AllOtherDevices> : False
			We only really care about using the da Vinci API right now, so don't use any of the other devices right now.
	Configure
	Set include directory and object library for the da Vinci API:
		IntuitiveDaVinci_INCLUDE_DIR: your/install/location/include
		IntuitiveDaVinci_LIBRARY: your/install/location/lib/isi_api.lib
	Set options:
		PLUSBUILD_EXTERNAL_VTK_VERSION : v7.1.0 (for compatibility with VS10)
	Configure 
	Generate
	Open project (should default to VS10)
	Set configuration to RELEASE (for binary compatibility with isi_api.lib)
	Build -> Build Solution
