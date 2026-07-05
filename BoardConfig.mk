#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# build-hacks
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_PREBUILT_ELF_FILES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_VENDOR_PROPERTY_NAMESPACE := true
SELINUX_IGNORE_NEVERALLOWS := true
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_USES_BUILD_COPY_HEADERS := true

# A/B
AB_OTA_UPDATER := true
BOARD_USES_RECOVERY_AS_BOOT := true
AB_OTA_PARTITIONS := \
    boot \
    dtbo \
    system \
    product \
    vendor \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_BOOTLOADER_BOARD_NAME := ice
TARGET_NO_BOOTLOADER := true

