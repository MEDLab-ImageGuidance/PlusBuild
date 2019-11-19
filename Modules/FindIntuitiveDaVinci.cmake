###############################################################################
# Find the IntuitiveDaVinci Library DaVinciXiCApi
#
#     find_package(IntuitiveDaVinci)
#
# Variables defined by this module:
#
#   IntuitiveDaVinci_FOUND               True if DaVinciXiCApi was found
#   IntuitiveDaVinci_INCLUDE_DIRS        The location of DaVinciXiCApi.h
#   IntuitiveDavinci_LIBRARY_DIR         The location of DaVinciXiCApi.lib
#   IntuitiveDaVinci_BINARY_DIR          The location of DaVinciXiCApi.dll and other DLLs necessary for the API


# Set the include directory for DaVinciXiCApi

SET(DaVinciXiCApi_INCLUDE_DIR_DEFAULT DaVinciXiCApi_INCLUDE_DIR-NOTFOUND)
SET(DaVinciXiCApi_INCLUDE_DIR ${DaVinciXiCApi_INCLUDE_DIR_DEFAULT} CACHE PATH "Location of DaVinciXiCApi.h")

IF("${DaVinciXiCApi_INCLUDE_DIR}" STREQUAL "${DaVinciXiCApi_INCLUDE_DIR_DEFAULT}")
  MESSAGE(FATAL_ERROR "Please supply a path to the DaVinciXiCApi include directory.")
ENDIF()

# Set the library directory for DaVinciXiCApi

SET(DaVinciXiCApi_LIBRARY_DIR_DEFAULT DaVinciXiCApi_LIBRARY_DIR-NOTFOUND)
SET(DaVinciXiCApi_LIBRARY_DIR ${DaVinciXiCApi_LIBRARY_DIR_DEFAULT} CACHE PATH "Location of DaVinciXiCApi.lib")

IF("${DaVinciXiCApi_LIBRARY_DIR}" STREQUAL "${DaVinciXiCApi_LIBRARY_DIR_DEFAULT}")
  MESSAGE(FATAL_ERROR "Please supply a path to the DaVinciXiCApi library directory.")
ENDIF()

# Set the binary directory for DaVinciXiCApi

SET(DaVinciXiCApi_BINARY_DIR_DEFAULT DaVinciXiCApi_BINARY_DIR-NOTFOUND)
SET(DaVinciXiCApi_BINARY_DIR ${DaVinciXiCApi_BINARY_DIR_DEFAULT} CACHE PATH "Location of DaVinciXiCApi.dll")

IF("${DaVinciXiCApi_BINARY_DIR}" STREQUAL "${DaVinciXiCApi_BINARY_DIR_DEFAULT}")
  MESSAGE(FATAL_ERROR "Please supply a path to the DaVinciXiCApi binary directory.")
ENDIF()


SET(IntuitiveDaVinci_INCLUDE_DIR ${DaVinciXiCApi_INCLUDE_DIR})
SET(IntuitiveDaVinci_LIBRARY_DIR ${DaVinciXiCApi_LIBRARY_DIR})
SET(IntuitiveDaVinci_BINARY_DIR ${DaVinciXiCApi_LIBRARY_DIR})

# handle the QUIETLY and REQUIRED arguments and set IntuitiveDaVinci_FOUND to TRUE if 
# all listed variables are TRUE
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(IntuitiveDaVinci DEFAULT_MSG  
  IntuitiveDaVinci_LIBRARY_DIR
  IntuitiveDaVinci_BINARY_DIR
  IntuitiveDaVinci_INCLUDE_DIR
)

SET(IntuitiveDaVinci_FOUND ${INTUITIVEDAVINCI_FOUND}) 
IF(IntuitiveDaVinci_FOUND)
  SET( IntuitiveDaVinci_LIBRARY_DIR ${IntuitiveDaVinci_LIBRARY_DIR} )
  SET( IntuitiveDaVinci_BINARY_DIR ${IntuitiveDaVinci_BINARY_DIR} )
  SET( IntuitiveDaVinci_INCLUDE_DIR ${IntuitiveDaVinci_INCLUDE_DIR} )
ENDIF()
