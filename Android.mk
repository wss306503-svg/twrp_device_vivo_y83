#
# Copyright (C) 2026 The TWRP Open Source Project
# SPDX-License-Identifier: Apache-2.0
#

# Empty Android.mk - prebuilt kernel is referenced via TARGET_PREBUILT_KERNEL
# (set in BoardConfig.mk) and recoveryimage packing includes it automatically.
LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_PREBUILT_KERNEL),)
    ifneq ($(TARGET_DEVICE),)
        LOCAL_KERNEL := $(wildcard device/vivo/$(TARGET_DEVICE)/prebuilt/kernel)
        ifneq ($(LOCAL_KERNEL),)
            TARGET_PREBUILT_KERNEL := $(LOCAL_KERNEL)
        endif
    endif
endif
