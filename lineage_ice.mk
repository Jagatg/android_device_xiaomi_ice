# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from KE6 device
$(call inherit-product, device/xiaomi/ice/device.mk)

# Device identifiers
PRODUCT_NAME := lineage_ice
PRODUCT_DEVICE := ice
PRODUCT_BRAND := xiaomi
PRODUCT_MANUFACTURER := Redmi
PRODUCT_MODEL := 220733SH

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    missi-user 12 SP1A.210812.016 V13.0.18.0.SGMEUXM release-keys

BUILD_FINGERPRINT := "Redmi/ice_eea/ice:12/SP1A.210812.016/V13.0.18.0.SGMEUXM:user/release-keys"

