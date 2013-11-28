## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := v500

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/lge/v500/device_v500.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := v500
PRODUCT_NAME := cm_v500
PRODUCT_BRAND := lge
PRODUCT_MODEL := v500
PRODUCT_MANUFACTURER := lge
