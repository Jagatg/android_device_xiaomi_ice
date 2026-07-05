#
# Copyright (C) 2023-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/go_defaults.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/userspace_reboot.mk)

# Inherit from ice device
$(call inherit-product, device/xiaomi/ice/device.mk)

# Set Lineage specific identifier for Android Go enabled products
PRODUCT_TYPE := go

# Inherit mini common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_mini_phone.mk)

# Device identifiers
PRODUCT_NAME := lineage_ice
PRODUCT_DEVICE := ice
PRODUCT_BRAND := Redmi
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := 220733SH

PRODUCT_SYSTEM_NAME := ice
PRODUCT_SYSTEM_DEVICE := ice

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="missi-user 12 SP1A.210812.016 V13.0.18.0.SGMEUXM release-keys"

BUILD_FINGERPRINT := "Redmi/ice_eea/ice:12/SP1A.210812.016/V13.0.18.0.SGMEUXM:user/release-keys"
