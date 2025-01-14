# --[ correctly show folder structure in Visual Studio
function(assign_source_group)
  foreach(_source IN ITEMS ${ARGN})
    if (IS_ABSOLUTE "${_source}")
      file(RELATIVE_PATH _source_rel "${CMAKE_CURRENT_SOURCE_DIR}" "${_source}")
    else()
      set(_source_rel "${_source}")
    endif()
    get_filename_component(_source_path "${_source_rel}" PATH)
    string(REPLACE "/" "\\" _source_path_msvc "${_source_path}")
    source_group("${_source_path_msvc}" FILES "${_source}")
  endforeach()
endfunction(assign_source_group)

function(overlook_add_executable)
  if (CMAKE_SYSTEM_NAME MATCHES "Windows" OR CMAKE_SYSTEM_NAME MATCHES "Darwin")
    foreach(_source IN ITEMS ${ARGN})
      assign_source_group(${_source})
    endforeach()
    #message("${ARGV}")
  endif ()
  add_executable(${ARGV})
endfunction(overlook_add_executable)

function(overlook_cuda_add_executable)
  if (CMAKE_SYSTEM_NAME MATCHES "Windows" OR CMAKE_SYSTEM_NAME MATCHES "Darwin")
    foreach(_source IN ITEMS ${ARGN})
      assign_source_group(${_source})
    endforeach()
    #message("${ARGV}")
  endif ()
  cuda_add_executable(${ARGV})
endfunction(overlook_cuda_add_executable)

function(overlook_add_library)
  if (CMAKE_SYSTEM_NAME MATCHES "Windows" OR CMAKE_SYSTEM_NAME MATCHES "Darwin")
    foreach(_source IN ITEMS ${ARGN})
      assign_source_group(${_source})
    endforeach()
    #message("${ARGV}")
  endif ()
  add_library(${ARGV})
endfunction(overlook_add_library)

function(overlook_cuda_add_library)
  if (CMAKE_SYSTEM_NAME MATCHES "Windows" OR CMAKE_SYSTEM_NAME MATCHES "Darwin")
    foreach(_source IN ITEMS ${ARGN})
      assign_source_group(${_source})
    endforeach()
    #message("${ARGV}")
  endif ()
  cuda_add_library(${ARGV})
endfunction(overlook_cuda_add_library)