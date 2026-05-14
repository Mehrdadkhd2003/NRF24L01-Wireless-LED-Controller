################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/Alireza/Desktop/nrf_final/NRF24.c 

OBJS += \
./nrf_final/NRF24.o 

C_DEPS += \
./nrf_final/NRF24.d 


# Each subdirectory must supply rules for building sources it contributes
nrf_final/NRF24.o: C:/Users/Alireza/Desktop/nrf_final/NRF24.c nrf_final/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/Alireza/Desktop/nrf_final" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-nrf_final

clean-nrf_final:
	-$(RM) ./nrf_final/NRF24.cyclo ./nrf_final/NRF24.d ./nrf_final/NRF24.o ./nrf_final/NRF24.su

.PHONY: clean-nrf_final

