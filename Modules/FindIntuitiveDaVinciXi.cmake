###############################################################################
# Find the IntuitiveDaVinciXi Library
#
#     find_package(IntuitiveDaVinciXi)
#
# Variables defined by this module:
#
#  IntuitiveDaVinciXi_FOUND               True if da Vinci Xi API was found
#  IntuitiveDaVinciXi_INCLUDE_DIRS        The location(s) of da Vinci Xi API headers.  
#                                         This will be two different locations:
#		    					            one for isi_api_types.h (part of ISI API 1.0)
#									        one for the dv_api headers (the DLL wrapper for ISI API 1.0)
#  IntuitiveDavinciXi_LIBRARY_DIR         Libraries needed to use IntuitiveDaVinciXi
#  IntuitiveDaVinciXi_BINARY_DIR          Binaries needed to use IntuitiveDaVinciXi

SET(IntuitiveDaVinciXi_SDK_PATH_HINTS 
  ../IntuitiveDaVinciXi
  ../PLTools/IntuitiveDaVinciXi
  ../../PLTools/IntuitiveDaVinciXi
  ${CMAKE_CURRENT_BINARY_DIR}/PLTools/IntuitiveDaVinciXi
)

FIND_PATH(ISI_INCLUDE_XI_DIR
  NAMES "isi_api.h" "isi_api_math.h" "isi_api_types.h"
  PATH_SUFFIXES inc
  PATHS ${IntuitiveDaVinci_SDK_PATH_HINTS}
  DOC "Include directory, i.e parent directory of the ISI API"
)

SET(DV_XI_DIR_DEFAULT DV_XI_DIR-NOTFOUND)
SET(DV_XI_DIR ${DV_XI_DIR_DEFAULT} CACHE PATH "The location of the dll build of the isi_api.")

IF("${DV_XI_DIR}" STREQUAL "${DV_XI_DIR_DEFAULT}")
  MESSAGE(FATAL_ERROR "Please supply a location for the dv_api dll build of isi_api.")
ENDIF()

# Take Python binary directory from user
SET(PYTHON_BINARY_DIR_DEFAULT PYTHON_BINARY_DIR-NOTFOUND)
SET(PYTHON_BINARY_DIR ${PYTHON_BINARY_DIR_DEFAULT} CACHE PATH "The location of the dll build of the python api.")

IF("${PYTHON_BINARY_DIR}" STREQUAL "${PYTHON_BINARY_DIR_DEFAULT}")
  MESSAGE(FATAL_ERROR "Please supply a location for the python36 dll build of python api.")
ENDIF()

# End of Python directory 

SET(DV_INCLUDE_XI_DIR ${DV_XI_DIR}/Include)
SET(PYTHON_INCLUDE_DIR ${PYTHON_BINARY_DIR}/include)

SET(IntuitiveDaVinciXi_INCLUDE_DIRS
  "${DV_INCLUDE_XI_DIR}"
  "${ISI_INCLUDE_XI_DIR}"
  "${PYTHON_INCLUDE_DIR}"
)

SET(IntuitiveDaVinciXi_LIBRARY_DIR ${DV_XI_DIR}/bin/Release)
SET(PYTHON_LIBRARY_DIR ${PYTHON_BINARY_DIR}/libs)
SET(IntuitiveDaVinciXi_BINARY_DIR ${DV_XI_DIR}/bin/Release)

# handle the QUIETLY and REQUIRED arguments and set ISIAPI_FOUND to TRUE if 
# all listed variables are TRUE
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(IntuitiveDaVinciXi DEFAULT_MSG  
  IntuitiveDaVinciXi_LIBRARY_DIR
  IntuitiveDaVinciXi_BINARY_DIR
  IntuitiveDaVinciXi_INCLUDE_DIRS
  PYTHON_LIBRARY_DIR
  PYTHON_BINARY_DIR
)

SET(IntuitiveDaVinciXi_FOUND ${IntuitiveDaVinciXi_FOUND}) 
IF(IntuitiveDaVinciXi_FOUND)
  SET( IntuitiveDaVinciXi_LIBRARY_DIR ${IntuitiveDaVinciXi_LIBRARY_DIR} )
  SET( IntuitiveDaVinciXi_BINARY_DIR ${IntuitiveDaVinciXi_BINARY_DIR} )
  SET( IntuitiveDaVinciXi_INCLUDE_DIRS ${IntuitiveDaVinciXi_INCLUDE_DIRS} )
  SET( PYTHON_LIBRARY_DIR ${PYTHON_LIBRARY_DIR} )
  SET( PYTHON_BINARY_DIR ${PYTHON_BINARY_DIR} )
ENDIF()