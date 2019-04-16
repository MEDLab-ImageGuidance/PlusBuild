# PlusBuild
This project contains CMake scripts for building Plus library, applications, and all required dependencies.
This fork was cloned from PlusToolkit/PlusBuild.git and is intended to be extended specifically for interfacing with the da Vinci Si robot's proprietary API (not included).

# Documentation

## Required:

1. CMake 3.10.3
2. Microsoft Visual Studio **2010**

## Build Steps

1. Open CMake.
2. Set the CMake source directory to this directory.
3. Set the build directory to wherever you want to build the binaries.
4. Configure with Visual Studio **2010 WIN32** native compliers.
5. Set the following flags to make the build less complicated:

| Name                           | Value   |
| ------------------------------ |:-------:|
| PLUSAPP_TEST_GUI               | *FALSE* |
| PLUSBUILD_BUILD_PLUSAPP        | *FALSE* |
| PLUSBUILD_BUILD_PLUS_WIDGETS   | *FALSE* |
| PLUSBUILD_USE_IntuitiveDaVinci | *TRUE*  |
| PLUSBUILD_USE_*OtherDevices*   | *FALSE* |

6. Configure.
7. We need to find the include directory and static library for the da Vinci API in order to link to it:
    * Set IntuitiveDaVinci_INCLUDE_DIR     to  *your/isi_api/install/location/include*
    * Set IntuitiveDaVinci_LIBRARY         to  *your/isi_api/install/location/lib/isi_api.lib*
8. Now in order to fix an unknown compatibility issue: 
    * Set PLUSBUILD_EXTERNAL_VTK_VERSION  to *v7.1.0*
9. Configure.
10. Generate.
11. Open the project.  It should open with VS10 by default.
12. Set configuration to RELEASE.  
    * This is for binary compatibility with *isi_api.lib*.
13. Select Build -> Build Solution.  
    * Allow approximately 2 hours to build.
14. The binaries should now be located in *your/build/directory/bin*
