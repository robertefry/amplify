
function(declare_system_libraries targets)
  foreach(target ${targets})
    get_target_property(target_aliased_name ${target} ALIASED_TARGET)
    if (target_aliased_name)
      set(target ${target_aliased_name})
    endif()
    set_target_properties(${target} PROPERTIES
      INTERFACE_SYSTEM_INCLUDE_DIRECTORIES $<TARGET_PROPERTY:${target},INTERFACE_INCLUDE_DIRECTORIES>)
  endforeach(target)
endfunction()
