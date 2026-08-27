#
# Copyright (C) 2026 The TWRP Open Source Project
# SPDX-License-Identifier: Apache-2.0
#
# omni_y83.mk - TWRP product makefile for vivo Y83 (PD1803, MT6765)
#

# Inherit from the omni base product
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

PRODUCT_NAME := omni_y83
PRODUCT_DEVICE := y83
PRODUCT_BRAND := vivo
PRODUCT_MODEL := vivo PD1803
PRODUCT_MANUFACTURER := vivo
PRODUCT_RELEASE_NAME := y83

# Device identifier
PRODUCT_GOTOS := true

# Build properties
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="PD1803" \
    TARGET_DEVICE="PD1803" \
    PRIVATE_BUILD_DESC="full_k62v1_64_bsp-user 8.1.0 O11019 1565086959 release-keys"

BUILD_FINGERPRINT := "vivo/PD1803/PD1803:8.1.0/O11019/1565086959:user/release-keys"

# Recovery-only - minimal set
PRODUCT_PACKAGES += \
    adbd \
    twrp

# Copy MTK recovery init (USB gadget + symlinks - required by LK bootloader)
PRODUCT_COPY_FILES += \
    device/vivo/y83/root/init.recovery.mt6765.rc:root/init.recovery.mt6765.rc

# Note: init.recovery.vivo.rc is kept in root/ as reference but NOT copied to
# the build - it references stock /sbin/* binaries that TWRP does not ship.

# Recovery fstab
PRODUCT_COPY_FILES += \
    device/vivo/y83/recovery.fstab:recovery/root/system/etc/recovery.fstab \
    device/vivo/y83/recovery.fstab:$(TARGET_COPY_OUT_VENDOR)/etc/recovery.fstab

# Allow ADB to be enabled by default
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.adb.secure=0 \
    ro.debuggable=1 \
    ro.secure=0 \
    persist.sys.usb.config=mtp,adb \
    sys.usb.config=mtp,adb

# Display & density
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320

# Hardware platform label
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.hardware.chip=mt6762 \
    ro.board.platform=mt6765
