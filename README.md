# PlusBuild
This project contains CMake scripts for building Plus library, applications, and all required dependencies.
This fork was cloned from PlusToolkit/PlusBuild.git and is intended to be extended specifically for interfacing with the da Vinci Si robot's proprietary API (not included).

# Documentation

## Required:

1. CMake 3.10.3 or a newer version.
2. Microsoft Visual Studio **2013** or **2015**. Newer versions weren't tested.
3. Qt **5.5.0** or a newer version. It must be compatible with your Microsoft Visual Studio version. Also it must be **a x86 not x64.**

## Build Steps

1. Create a folder and clone this repo to that folder. The file path must be short so create build directory like this **C:\E\PlusBuild**.
2. Open CMake.
3. Set the CMake source directory to this directory.
4. Set the build directory to wherever you want to build the binaries. The file path must be short so create build directory like this **C:\E\PlusB-Bin**.
5. Click **Configure** and chosee the appropriate Microsoft Visual Studio version. And chosee Win32 for optional platform.
6. If it gives the Qt5 error specify Qt5_DIR where the **Qt5Config.cmake** file found. Look the directories where Qt installed.
7. Click **Configure** again.
5. Set the following flags to make the build less complicated, others should be same as created:

| Name                           | Value   |
| ------------------------------ |:-------:|
| PLUSAPP_TEST_GUI               | *FALSE* |
| PLUSBUILD_BUILD_PLUSAPP        | *TRUE* |
| PLUSBUILD_BUILD_PLUS_WIDGETS   | *TRUE* |
| PLUSBUILD_USE_IntuitiveDaVinci | *TRUE*  |
| PLUSBUILD_USE_NDI              | *TRUE* |

6. Click **Configure**.
7. We need to find the include directory and static library for the da Vinci API in order to link to it:
    * Set DV_DIR     			to  where VSBuild found in DaVinciAPI folder like *C:\D\daVinciSi-API\DaVinciAPI\Extension\DLLBuild\VSBuild*. Note that this is a private repository.
    * Set ISI_INCLUDE_DIR       to  where isi_api.lib found in DaVinciAPI folder like *C:\D\daVinciSi-API\DaVinciAPI\WindowsInstall\ISI API 1.0\lib*. Note that this is a proprietary library from Intuitive.
8. Click **Configure**.
9. Then **Generate**.
10. Open the project. 
12. Set configuration to RELEASE and make sure the target platform is Win32.
    * This is for binary compatibility with *ndi api*.
13. Select Build -> Build Solution.  
    * Allow approximately 2 hours to build.
14. The binaries should now be located in *your/build/directory/bin* and **dv_api.dll** file must be in the Release folder.

