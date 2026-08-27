#
# Copyright (C) 2026 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#
# BoardConfig for vivo Y83 (PD1803, MT6765 / Helio P22)
# Prebuilt-kernel TWRP port, recovery-only.
#

DEVICE_PATH := device/vivo/y83

# ===================== Architecture =====================
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_USES_64_BIT_BINDER := true

# ===================== Bootloader / Platform =====================
TARGET_BOOTLOADER_BOARD_NAME := y83
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_BOARD_PLATFORM := mt6765
TARGET_BOARD_PLATFORM_GPU := mali-g72

# ===================== Kernel (prebuilt) =====================
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB :=
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE :=
TARGET_KERNEL_CONFIG :=
BOARD_KERNEL_IMAGE_NAME := Image.gz

# Boot image header layout (parsed from stock boot.img, page_size=2048)
# kernel_addr 0x40080000 = base 0x40000000 + kernel_offset 0x8000
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x15000000
BOARD_SECOND_OFFSET := 0x00f00000
BOARD_TAGS_OFFSET := 0x14000000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x15000000 --second_offset 0x00f00000 --tags_offset 0x14000000 --board k62v1_64_bsp --header_version 0

# ===================== Filesystem / Partitions =====================
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_REAL_SDCARD := true

# Recovery / Boot partition sizes (64 MB each, MTK non-A/B)
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864       # 0x4000000
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864           # 0x4000000

# Block sizes
BOARD_FLASH_BLOCK_SIZE := 4096

# ===================== Recovery =====================
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
RECOVERY_VARIANT := twrp

# Recovery UI - vivo Y83 has 1520x720 HD+ 19:9 screen
DEVICE_RESOLUTION := 720x1520
BOARD_HAS_FLIPPED_SCREEN := false

# Touch
BOARD_HAS_NO_REAL_SDCARD := true

# ===================== TWRP =====================
ifeq ($(RECOVERY_VARIANT), twrp)
    TW_THEME := portrait_hdpi
    TW_DEVICE_VERSION := vivo_y83
    TW_EXTRA_LANGUAGES := true
    TW_DEFAULT_LANGUAGE := zh_CN
    TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
    TW_MAX_BRIGHTNESS := 255
    TW_DEFAULT_BRIGHTNESS := 128
    TW_EXCLUDE_DEFAULT_USB_INIT := true
    TW_INCLUDE_NTFS_3G := true
    TW_INCLUDE_FUSE_EXFAT := true
    TW_HAS_USB_STORAGE := true
    TW_NO_SCREEN_TIMEOUT := true
    TW_FORCE_SCREEN_REFRESH := true
endif

# ===================== SEPolicy / Treble =====================
TARGET_COPY_OUT_VENDOR := vendor
BUILD_SEPOLINUX := true

# VNDK - twrp-8.1 minimal manifest only supports "current"
BOARD_VNDK_VERSION := current

# Allow building with custom partition layout (MTK)
TARGET_USE_SQUASHFS := false
