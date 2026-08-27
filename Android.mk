#
# Copyright (C) 2026 The TWRP Open Source Project
# SPDX-License-Identifier: Apache-2.0
#

# Empty Android.mk - prebuilt kernel is referenced via TARGET_PREBUILT_KERNEL
# and recovery root files via PRODUCT_COPY_FILES in omni_y83.mk
LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_PREBUILT_KERNEL),)
    ifneq ($(TARGET_DEVICE),)
        LOCAL_KERNEL := $(wildcard device/vivo/$(TARGET_DEVICE)/prebuilt/kernel)
        ifneq ($(LOCAL_KERNEL),)
            TARGET_PREBUILT_KERNEL := $(LOCAL_KERNEL)
        endif
    endif
endif

# Copy prebuilt kernel into out directory if present
ifneq ($(TARGET_PREBUILT_KERNEL),)
    PRODUCT_COPY_FILES += $(TARGET_PREBUILT_KERNEL):kernel
endif
