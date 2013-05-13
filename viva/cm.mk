# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)
$(call inherit-product, vendor/cm/config/gsm.mk)

$(call inherit-product, device/huawei/viva/device_viva.mk)

# Release name
PRODUCT_RELEASE_NAME := viva

# Preload bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Boot animation
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540

#Set build fingerprint / ID / Product Name ect.
#PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=viva BUILD_FINGERPRINT="Huawei/viva/viva:4.2.1:user/release-keys" PRIVATE_BUILD_DESC="U9200-1V100R001RUSC00B523_SYSTEM"

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := viva
PRODUCT_NAME := cm_viva
PRODUCT_RELEASE_NAME := U9200
PRODUCT_BRAND := Huawei
PRODUCT_MODEL := U9200
PRODUCT_MANUFACTURER := Huawei
