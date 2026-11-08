# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, build/make/target/product/go_defaults_512.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/userspace_reboot.mk)

# Use the low-memory allocator on this 2 GB device, including userdebug builds.
MALLOC_LOW_MEMORY := true

# Use profile-guided preoptimization to reduce first-boot compilation work.
PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := speed-profile

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
    BuildDesc="missi-user 12 SP1A.210812.016 V13.0.18.0.SGMEUXM release-keys"

BUILD_FINGERPRINT := "Redmi/ice_eea/ice:12/SP1A.210812.016/V13.0.18.0.SGMEUXM:user/release-keys"
