#******************************************************************************
# Copyright (C) MD IFTHAKHAR MAHMUD
#
# Redistribution, modification or use of this software in source or binary
# forms is permitted as long as the files maintain this copyright. Users are 
# permitted to modify this and use it to learn about the field of embedded
#
# 
#
#*****************************************************************************

#------------------------------------------------------------------------------
# Makefile for the cortex-m4 or Host build system, 
# that switch with help "PLATFORM=<PLATFORM_NAME>" option
#
# Use: make [TARGET] [PLATFORM-OVERRIDES]
#
# Build Targets:
#      <FILE>.i - Builds <FILE>.i preprocessor files
#      <FILE>.o - Builds <FILE>.o object files
#      <FILE>.asm - Builds <FILE>.asm assembly files
#      <FILE>.d - Builds <FILE>.d dependency files
#      build - compile all object files and link into a final executable
#      compile-all - compile all object files, but do not link
#      clean - removes all compiled objects,
#              preprocessedoutputs, assembly outputs, executibale
#              files and output files
#
# Platform Overrides:
#      CPU - ARM cortex Architecture (cortex-m4)
#      ARCH - ARM Architecture(armv7e-m)
#      SPECS - Specs file to give the linker (nosys.specs)
#      ABI - ABI floating-poiint to use (hard)
#------------------------------------------------------------------------------
include sources.mk

# Platform Overrides
PLATFORM = MSP432
TARGET = c1m2

ifeq ($(PLATFORM), MSP432)
# Architectures Specific Flags
    LINKER_FILE = ../msp432p401r.lds
    CPU = cortex-m4
    ARCH = armv7e-m
    SPECS = nosys.specs
    FPU = fpv4-sp-d16
    ABI = hard
# Compiler Flags and Defines for Platform MSP432
    CC = arm-none-eabi-gcc
    LD = arm-none-eabi-ld
    OBJDUMP = arm-none-eabi-objdump
    SIZE = arm-none-eabi-size
    LDFLAGS = -Wl,-Map=$(TARGET).map -T $(LINKER_FILE)
    CFLAGS = -D$(PLATFORM) -mcpu=$(CPU)         \
             -march=$(ARCH) -mfpu=$(FPU)        \
             --specs=$(SPECS) -mfloat-abi=$(ABI)\
             -mthumb
    CPPFLAGS = -Wall -Werror -O0 -std=c99 -g
else
# Compiler Flags and Defines Host Platform
    CC = gcc
    OBJDUMP = objdump
    SIZE = size
    LDFLAGS = -Wl,-Map=$(TARGET).map
    CFLAGS = -D$(PLATFORM)
    CPPFLAGS = -Wall -Werror -O0 -std=c99 -g
endif
PRE = $(SOURCES:.c=.i)
%.i : %.c
	$(CC) -E $< $(CFLAGS) $(INCLUDES) $(CPPFLAGS) -o $@
ASM = $(SOURCES:.c=.asm)
%.asm : %.c
	$(CC) -S $<  $(CFLAGS) $(INCLUDES) $(CPPFLAGS) -o $
DEP = $(SOURCES:.c=.d)
%.d : %.c
	$(CC) -M $< $(CFLAGS) $(INCLUDES) $(CPPFLAGS) -o $@


OBJS = $(SRCS:.c=.o)

%.o : %.c
	$(CC) -c $@ -o $< $(CFLAGS)

.PHONY: build
build: all

.PHONY: all
all: $(TARGET).out

$(TARGET).out: $(OBJS)
	$(CC) $(OBJS) $(CFLAGS) $(LDFLAGS) -o $@

.PHONY: clean
clean:
	rm -f $(OBJS) $(TARGET).out $(TARGET).map
