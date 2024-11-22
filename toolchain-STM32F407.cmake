set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_VERSION Cortex-M4-STM32F407)

set(CMAKE_SYSTEM_PROCESSOR arm)
set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_CXX_COMPILER arm-none-eabi-g++)
set(CMAKE_ASM_COMPILER arm-none-eabi-gcc)
set(CMAKE_AR arm-none-eabi-ar)
set(CMAKE_OBJCOPY arm-none-eabi-objcopy)
set(CMAKE_OBJDUMP arm-none-eabi-objdump)
set(CMAKE_NM arm-none-eabi-nm)
set(CMAKE_STRIP arm-none-eabi-strip)
set(CMAKE_RANLIB arm-none-eabi-ranlib)

set(ARM_FLAGS "-mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16")

set(C_FLAGS "-funsigned-char -ffunction-sections -fdata-sections -MMD -MP")
set(CXX_FLAGS "-funsigned-char -fno-rtti -fno-exceptions -MMD -MP")

set(CMAKE_C_FLAGS "${ARM_FLAGS} ${C_FLAGS}")
set(CMAKE_CXX_FLAGS "${ARM_FLAGS} ${CXX_FLAGS}")

add_compile_definitions(
  STM32F40_41xxx
  STM32F407xx
  USE_FULL_ASSERT
  $<$<CONFIG:DEBUG>:OS_USE_TRACE_SEMIHOSTING_STDOUT>
  $<$<CONFIG:DEBUG>:OS_USE_SEMIHOSTING>
)

add_link_options(
  ${ARM_OPTIONS}
  -u_printf_float
  -u_scanf_float
  -nostdlib++
  -specs=nosys.specs
  LINKER:--gc-sections
  LINKER:--build-id
)