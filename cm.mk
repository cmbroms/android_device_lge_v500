## Specify phone tech before including full_phone
$(call inherit-product, vendor/cmb/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := awifi

# Inherit some common CM stuff.
$(call inherit-product, vendor/cmb/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/lge/awifi/device_awifi.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := awifi
PRODUCT_NAME := cm_awifi
PRODUCT_BRAND := lge
PRODUCT_MODEL := v500
PRODUCT_MANUFACTURER := lge
