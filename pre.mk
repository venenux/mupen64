#/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
# *   Mupen64plus - pre.mk                                                  *
# *   Mupen64Plus homepage: http://code.google.com/p/mupen64plus/           *
# *   Copyright (C) 2007-2008 DarkJeztr Tillin9 Richard42                   *
# *                                                                         *
# *   This program is free software; you can redistribute it and/or modify  *
# *   it under the terms of the GNU General Public License as published by  *
# *   the Free Software Foundation; either version 2 of the License, or     *
# *   (at your option) any later version.                                   *
# *                                                                         *
# *   This program is distributed in the hope that it will be useful,       *
# *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
# *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
# *   GNU General Public License for more details.                          *
# *                                                                         *
# *   You should have received a copy of the GNU General Public License     *
# *   along with this program; if not, write to the                         *
# *   Free Software Foundation, Inc.,                                       *
# *   51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.          *
# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

# detect system architecture: i386, x86_64, PPC/PPC64, ALPHA, ARM, AVR32, HPPA,
# IA64, M32R, M68K, MIPS, S390, SH3, SH4, SPARC
UNAME = $(shell uname -m)
NO_ASM ?= 1
ifeq ("$(UNAME)","x86_64")
  CPU := X86
  ifeq ("$(BITS)", "32")
    ARCH := 64BITS_32
  else
    ARCH := 64BITS
  endif
  NO_ASM := 0
  CPU_ENDIANNESS := LITTLE
endif
ifneq ("$(filter pentium i%86,$(UNAME))","")
  CPU := X86
  ARCH := 32BITS
  NO_ASM := 0
  CPU_ENDIANNESS := LITTLE
endif
ifneq ("$(filter ppc powerpc,$(UNAME))","")
  CPU := PPC
  ARCH := 32BITS
  NO_ASM := 1
  CPU_ENDIANNESS := BIG
endif
ifneq ("$(filter ppc64 powerpc64,$(UNAME))","")
  CPU := PPC
  ARCH := 64BITS
  NO_ASM := 1
  CPU_ENDIANNESS := BIG
endif
ifneq ("$(filter alpha%,$(UNAME))","")
  CPU := ALPHA
  ARCH := 64BITS
  NO_ASM := 1
  CPU_ENDIANNESS := LITTLE
endif
ifneq ("$(filter arm%b,$(UNAME))","")
  CPU := ARM
  ARCH := 32BITS
  NO_ASM := 1
  CPU_ENDIANNESS := BIG
else
ifneq ("$(filter arm%,$(UNAME))","")
  CPU := ARM
  ARCH := 32BITS
  NO_ASM := 1
  CPU_ENDIANNESS := LITTLE
endif
endif
ifneq ("$(filter hppa%b,$(UNAME))","")
  CPU := HPPA
  ARCH := 32BITS
  NO_ASM := 1
  CPU_ENDIANNESS := BIG
endif
ifeq ("$(UNAME)","ia64")
  CPU := IA64
  ARCH := 64BITS
  NO_ASM := 1
  CPU_ENDIANNESS := LITTLE
endif
ifeq ("$(UNAME)","avr32")
  CPU := AVR32
  ARCH := 32BITS
  NO_ASM := 1
  CPU_ENDIANNESS := BIG
endif
ifeq ("$(UNAME)","m32r")
  CPU := M32R
  ARCH := 32BITS
  NO_ASM := 1
  CPU_ENDIANNESS := BIG
endif
ifeq ("$(UNAME)","m68k")
  CPU := M68K
  ARCH := 32BITS
  NO_ASM := 1
  CPU_ENDIANNESS := BIG
endif
ifneq ("$(filter mips mipseb,$(UNAME))","")
  CPU := MIPS
  ARCH := 32BITS
  NO_ASM := 1
  CPU_ENDIANNESS := BIG
endif
ifeq ("$(UNAME)","mipsel")
  CPU := MIPS
  ARCH := 32BITS
  NO_ASM := 1
  CPU_ENDIANNESS := LITTLE
endif
ifeq ("$(UNAME)","s390")
  CPU := S390
  ARCH := 32BITS
  NO_ASM := 1
  CPU_ENDIANNESS := BIG
endif
ifeq ("$(UNAME)","s390x")
  CPU := S390
  ARCH := 64BITS
  NO_ASM := 1
  CPU_ENDIANNESS := BIG
endif
ifeq ("$(UNAME)","sh3")
  CPU := SH3
  ARCH := 32BITS
  NO_ASM := 1
  CPU_ENDIANNESS := LITTLE
endif
ifeq ("$(UNAME)","sh3eb")
  CPU := SH3
  ARCH := 32BITS
  NO_ASM := 1
  CPU_ENDIANNESS := BIG
endif
ifeq ("$(UNAME)","sh4")
  CPU := SH4
  ARCH := 32BITS
  NO_ASM := 1
  CPU_ENDIANNESS := LITTLE
endif
ifeq ("$(UNAME)","sh4eb")
  CPU := SH4
  ARCH := 32BITS
  NO_ASM := 1
  CPU_ENDIANNESS := BIG
endif
ifeq ("$(UNAME)","sparc")
  CPU := SPARC
  ARCH := 32BITS
  NO_ASM := 1
  CPU_ENDIANNESS := BIG
endif

# detect operation system. Currently just linux and OSX.
UNAME = $(shell uname -s)
ifeq ("$(UNAME)","Linux")
  OS = LINUX
endif
ifeq ("$(UNAME)","linux")
  OS = LINUX
endif
ifeq ("$(UNAME)","Darwin")
  OS = OSX
  LDFLAGS += -liconv -lpng
endif

ifeq ($(OS),)
   $(warning OS not supported or detected, using default linux options.)
   OS = LINUX
endif

