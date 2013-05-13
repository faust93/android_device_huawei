#
# Copyright (C) 2012 The CyanogenMod Project
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

# Camera
USE_CAMERA_STUB := false
BOARD_USES_TI_CAMERA_HAL := true

## TI_OMAP4_CAMERAHAL_VARIANT := DONOTBUILDIT

HARDWARE_OMX := true
OMX_VENDOR := ti
#BOARD_NEEDS_CUTILS_LOG := true
#OMX_VENDOR_WRAPPER := TI_OMX_Wrapper
BOARD_OPENCORE_LIBRARIES := libOMX_Core
BOARD_OPENCORE_FLAGS := -DHARDWARE_OMX=1

#BOARD_USE_TI_DUCATI_H264_PROFILE := true

COMMON_GLOBAL_CFLAGS += -DENHANCED_DOMX
ENHANCED_DOMX := true

# U9200 uses omap enhancement!
OMAP_ENHANCEMENT := true
COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT -DOMAP_ENHANCEMENT_BURST_CAPTURE

COMMON_GLOBAL_CFLAGS += -DMR0_AUDIO_BLOB
MR0_AUDIO_BLOB := true

TARGET_GLOBAL_CFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp

# Audio
BOARD_USES_GENERIC_AUDIO := false
#
#BOARD_HAVE_FM_RADIO := true
#BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

# inherit from the proprietary version
-include vendor/huawei/viva/BoardConfigVendor.mk

# Target arch settings
TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := omap4
TARGET_BOARD_PLATFORM_GPU := POWERVR_SGX540_120
TARGET_BOOTLOADER_BOARD_NAME := viva
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_ARCH_VARIANT_FPU := neon
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

#HWcomposer
BOARD_USES_HWCOMPOSER := true
#BOARD_USE_SYSFS_VSYNC_NOTIFICATION := true
TARGET_HAS_WAITFORVSYNC := true

# Setup custom omap4xxx defines
BOARD_USE_CUSTOM_LIBION := true

# Kernel/Ramdisk
BOARD_KERNEL_CMDLINE := console=ttyGS2,115200n8 mem=1G vmalloc=768M vram=16M omapfb.vram=0:8M omap_wdt.timer_margin=30 mmcparts=mmcblk0:p15(splash) androidboot.hardware=viva
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
TARGET_PREBUILT_KERNEL := device/huawei/viva/kernel
TARGET_PROVIDES_INIT_TARGET_RC := true

# EGL
BOARD_EGL_CFG := device/huawei/viva/egl.cfg
USE_OPENGL_RENDERER := true

# Lights
TARGET_PROVIDES_LIBLIGHTS := true

# PowerHAL
TARGET_PROVIDES_POWERHAL := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_P2P     := "/vendor/firmware/fw_bcmdhd_p2p.bin"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcmdhd_apsta.bin"

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# Set 32 byte cache line to true
ARCH_ARM_HAVE_32_BYTE_CACHE_LINES := true

# RIL
TARGET_PROVIDES_LIBRIL := vendor/huawei/viva/proprietary/lib/libxgold-ril.so

# Webkit
ENABLE_WEBGL := true

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/f_mass_storage/lun/file"

# fix this up by examining /proc/mtd on a running device
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1342177280
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2302672896
BOARD_FLASH_BLOCK_SIZE := 4096

# Security
BOARD_USES_SECURE_SERVICES := true

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true

#TWRP
#TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
DEVICE_RESOLUTION := 540x960
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_RECOVERY_INITRC := device/huawei/viva/recovery/init.twrp.rc
RECOVERY_SDCARD_ON_DATA := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/sdcard"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard"
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_FLASH_FROM_STORAGE := true	  	
TW_HAS_DOWNLOAD_MODE := true
SP1_NAME := "cust"
SP1_BACKUP_METHOD := files
SP1_MOUNTABLE := 1
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_MAX_BRIGHTNESS := 250
TW_BRIGHTNESS_PATH := /sys/devices/omapdss/display0/backlight/lcd/brightness
TW_CUSTOM_BATTERY_PATH := /sys/class/power_supply/Battery
TW_SDEXT_NO_EXT4 := true
# End TWRP