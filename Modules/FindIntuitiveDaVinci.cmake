###############################################################################
# Find the IntuitiveDaVinci Library
#
#     find_package(IntuitiveDaVinci)
#
# Variables defined by this module:
#
#  IntuitiveDaVinci_FOUND               True if da Vinci API was found
#  IntuitiveDaVinci_INCLUDE_DIRS        The location(s) of da Vinci API headers.  
#                                         This will be two different locations:
#		    					            one for isi_api_types.h (part of ISI API 1.0)
#									        one for the dv_api headers (the DLL wrapper for ISI API 1.0)
#  IntuitiveDavinci_LIBRARY_DIR         Libraries needed to use IntuitiveDaVinci
#  IntuitiveDaVinci_BINARY_DIR          Binaries needed to use IntuitiveDaVinci

SET(IntuitiveDaVinci_SDK_PATH_HINTS 
  ../IntuitiveDaVinci
  ../PLTools/IntuitiveDaVinci
  ../../PLTools/IntuitiveDaVinci
  ${CMAKE_CURRENT_BINARY_DIR}/PLTools/IntuitiveDaVinci
)

FIND_PATH(ISI_INCLUDE_DIR
  NAMES "isi_api.h" "isi_api_math.h" "isi_api_types.h"
  PATH_SUFFIXES inc
  PATHS ${IntuitiveDaVinci_SDK_PATH_HINTS}
  DOC "Include directory, i.e parent directory of the ISI API"
)

SET(DV_DIR_DEFAULT DV_DIR-NOTFOUND)
SET(DV_DIR ${DV_DIR_DEFAULT} CACHE PATH "The location of the dll build of the isi_api.")

IF("${DV_DIR}" STREQUAL "${DV_DIR_DEFAULT}")
  MESSAGE(FATAL_ERROR "Please supply a location for the dv_api dll build of isi_api.")
ENDIF()

SET(DV_INCLUDE_DIR ${DV_DIR}/Include)

SET(IntuitiveDaVinci_INCLUDE_DIRS
  "${DV_INCLUDE_DIR}"
  "${ISI_INCLUDE_DIR}"
)

SET(IntuitiveDaVinci_LIBRARY_DIR ${DV_DIR}/bin/Release)
SET(IntuitiveDaVinci_BINARY_DIR ${DV_DIR}/bin/Release)

# handle the QUIETLY and REQUIRED arguments and set ISIAPI_FOUND to TRUE if 
# all listed variables are TRUE
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(IntuitiveDaVinci DEFAULT_MSG  
  IntuitiveDaVinci_LIBRARY_DIR
  IntuitiveDaVinci_BINARY_DIR
  IntuitiveDaVinci_INCLUDE_DIRS
)

SET(IntuitiveDaVinci_FOUND ${INTUITIVEDAVINCI_FOUND}) 
IF(IntuitiveDaVinci_FOUND)
  SET( IntuitiveDaVinci_LIBRARY_DIR ${IntuitiveDaVinci_LIBRARY_DIR} )
  SET( IntuitiveDaVinci_BINARY_DIR ${IntuitiveDaVinci_BINARY_DIR} )
  SET( IntuitiveDaVinci_INCLUDE_DIRS ${IntuitiveDaVinci_INCLUDE_DIRS} )
ENDIF()
