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

# Take Python binary directory from user
SET(PYTHON_BINARY_DIR_DEFAULT PYTHON_BINARY_DIR-NOTFOUND)
SET(PYTHON_BINARY_DIR ${PYTHON_BINARY_DIR_DEFAULT} CACHE PATH "The location of the dll build of the python api.")

IF("${PYTHON_BINARY_DIR}" STREQUAL "${PYTHON_BINARY_DIR_DEFAULT}")
  MESSAGE(FATAL_ERROR "Please supply a location for the python36 dll build of python api.")
ENDIF()
# End of Python directory 

SET(PYTHON_INCLUDE_DIR ${PYTHON_BINARY_DIR}/include)
SET(PYTHON_LIBRARY_DIR ${PYTHON_BINARY_DIR}/libs)

# handle the QUIETLY and REQUIRED arguments and set ISIAPI_FOUND to TRUE if 
# all listed variables are TRUE
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(IntuitiveDaVinciXi DEFAULT_MSG  
  PYTHON_INCLUDE_DIR
  PYTHON_LIBRARY_DIR
  PYTHON_BINARY_DIR
)

SET(IntuitiveDaVinciXi_FOUND ${IntuitiveDaVinciXi_FOUND}) 
IF(IntuitiveDaVinciXi_FOUND)
  SET( PYTHON_INCLUDE_DIR ${PYTHON_INCLUDE_DIR} )
  SET( PYTHON_LIBRARY_DIR ${PYTHON_LIBRARY_DIR} )
  SET( PYTHON_BINARY_DIR ${PYTHON_BINARY_DIR} )
ENDIF()