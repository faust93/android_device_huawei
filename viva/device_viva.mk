#
# Copyright (C) 2012 The Android Open-Source Project
# Copyright (C) 2012 mdeejay
# Copyright (C) 2013 faust93
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product-if-exists, vendor/huawei/viva/viva-vendor.mk)
$(call inherit-product, hardware/ti/omap4xxx/omap4.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)


# This file includes all definitions that apply to ALL viva devices, and
# are also specific to viva devices
#
# Everything in this directory will become public

DEVICE_PACKAGE_OVERLAYS := device/huawei/viva/overlay

#Camera
PRODUCT_PACKAGES += \
        Camera

# Audio Packages
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio.usb.default \
	libtinyalsa \
	tinycap \
	tinymix \
	tinyplay \
	libaudioutils

# PowerHAL
PRODUCT_PACKAGES += \
	audio.primary.viva \
	power.viva \
	hwcomposer.viva \
	libion_ti

# Ramdisk
PRODUCT_COPY_FILES += \
	device/huawei/viva/ramdisk/init:root/init \
	device/huawei/viva/ramdisk/init.rc:root/init.rc \
	device/huawei/viva/ramdisk/init.viva.rc:root/init.viva.rc \
	device/huawei/viva/ramdisk/init.viva.usb.rc:root/init.viva.usb.rc \
	device/huawei/viva/ramdisk/ueventd.viva.rc:root/ueventd.viva.rc

# Media / Audio
PRODUCT_COPY_FILES += \
	device/huawei/viva/media/media_profiles.xml:system/etc/media_profiles.xml \
	device/huawei/viva/media/media_codecs.xml:system/etc/media_codecs.xml \
	device/huawei/viva/audio/audio_policy.conf:system/etc/audio_policy.conf \
	device/huawei/viva/audio/huawei/audio/cm_viva_audio_config.conf:system/etc/huawei/audio/cm_viva_audio_config.conf \
	device/huawei/viva/audio/huawei/audio/viva_audio_config.conf:system/etc/huawei/audio/viva_audio_config.conf \
	device/huawei/viva/audio/huawei/audio/viva_factory_audio_config.conf:system/etc/huawei/audio/viva_factory_audio_config.conf \
	device/huawei/viva/audio/huawei/audio/U9200_audio_config.conf:system/etc/huawei/audio/U9200_audio_config.conf \
	device/huawei/viva/audio/huawei/audio/U9200_factory_audio_config.conf:system/etc/huawei/audio/U9200_factory_audio_config.conf

# GPS
PRODUCT_COPY_FILES += \
	device/huawei/viva/gps/gps.conf:system/etc/gps.conf \
	device/huawei/viva/gps/gpsconfig.xml:system/etc/gpsconfig.xml

# BT
PRODUCT_COPY_FILES += \
	device/huawei/viva/bluetooth/audio.conf:system/etc/bluetooth/audio.conf \
	device/huawei/viva/bluetooth/auto_pairing.conf:system/etc/bluetooth/auto_pairing.conf \
	device/huawei/viva/bluetooth/BCM4330B1.hcd:system/etc/bluetooth/BCM4330B1.hcd \
	device/huawei/viva/bluetooth/blacklist.conf:system/etc/bluetooth/blacklist.conf \
	device/huawei/viva/bluetooth/init.bcm.chip_off.sh:system/etc/bluetooth/init.bcm.chip_off.sh \
	device/huawei/viva/bluetooth/init.bcm.chip_on.sh:system/etc/bluetooth/init.bcm.chip_on.sh \
	device/huawei/viva/bluetooth/input.conf:system/etc/bluetooth/input.conf \
	device/huawei/viva/bluetooth/network.conf:system/etc/bluetooth/network.conf

# Vold
PRODUCT_COPY_FILES += \
	device/huawei/viva/vold.fstab:system/etc/vold.fstab

# Torch
PRODUCT_PACKAGES += \
        Torch

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        VisualizationWallpapers \
        librs_jni

# Common
PRODUCT_PACKAGES += \
	make_ext4fs \
	setup_fs \
	l2ping \
	com.android.future.usb.accessory

# Key maps
PRODUCT_COPY_FILES += \
	device/huawei/viva/usr/omap4-keypad.kl:system/usr/keylayout/omap4-keypad.kl \
	device/huawei/viva/usr/omap4-keypad.kcm:system/usr/keychars/omap4-keypad.kcm \
	device/huawei/viva/usr/twl6030_pwrbutton.kl:system/usr/keylayout/twl6030_pwrbutton.kl

# Input device calibration files
PRODUCT_COPY_FILES += \
	device/huawei/viva/usr/syn_tm12xx_ts_1.idc:system/usr/idc/syn_tm12xx_ts_1.idc \
	device/huawei/viva/usr/syn_tm12xx_ts_2.idc:system/usr/idc/syn_tm12xx_ts_2.idc

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

PRODUCT_COPY_FILES += $(call add-to-product-copy-files-if-exists,\
packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml)

PRODUCT_PACKAGES += \
	librs_jni \
	com.android.future.usb.accessory

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs \
	e2fsck \
	setup_fs

#Lib Skia test
PRODUCT_PACKAGES += \
	SkLibTiJpeg_Test

# for bugmailer
PRODUCT_PACKAGES += send_bug
PRODUCT_COPY_FILES += \
	system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
	system/extras/bugmailer/send_bug:system/bin/send_bug

PRODUCT_PROPERTY_OVERRIDES += \
	ro.setupwizard.enable_bypass=1 \
	dalvik.vm.dexopt-flags=m=y \
	ro.product.board=U9200

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.secure=0

PRODUCT_CHARACTERISTICS := default
#PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
#PRODUCT_TAGS += dalvik.gc.type-precise
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES += en_US hdpi
BOARD_WLAN_DEVICE_REV := bcm4330_b1
WIFI_BAND             := 802_11_ABG

