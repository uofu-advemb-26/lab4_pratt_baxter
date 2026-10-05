# This is the main binary. List your C files here.
# Lab 4 is test-driven, so the main binary is only built once src/main.c exists.
if(NOT EXISTS ${CMAKE_CURRENT_LIST_DIR}/main.c)
    return()
endif()

add_executable(lab4
    main.c
    signaling.c
)

pico_set_program_name(lab4 "lab4")
pico_set_program_version(lab4 "0.1")

# Modify the below lines to enable/disable output over UART/USB.
# These are mutually exclusive, only set one.
pico_enable_stdio_uart(lab4 1)
pico_enable_stdio_usb(lab4 0)

# Add the libraries to the build
target_link_libraries(lab4 PRIVATE
  pico_stdlib
  pico_multicore
  pico_async_context_freertos
  FreeRTOS-Kernel-Heap4
)

# The CYW43 is the Wifi/Bluetooth module. If the board is set to pico_w, this
# variable will be set and the wireless libraries added.
if(PICO_CYW43_SUPPORTED)
    # For led support on pico_w
    target_link_libraries(lab4 PRIVATE
        pico_cyw43_arch_none
    )
endif()

# Another pico macro which generates the uf2 file in addition to the elf
pico_add_extra_outputs(lab4)

find_program(OPENOCD openocd)
find_program(PICOTOOL picotool)

add_custom_target(flash ${PICOTOOL} load -f $<TARGET_FILE:lab4> DEPENDS lab4)
add_custom_target(openocd_flash ${OPENOCD} -s ${OPENOCD_PATH} -f interface/cmsis-dap.cfg -f target/rp2040.cfg -c "adapter speed 5000" -c "program $<TARGET_FILE:lab4> verify reset exit" DEPENDS lab4)
