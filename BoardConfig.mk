#
# Copyright (C) 2022 Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

BOARD_VENDOR := nokia

DEVICE_PATH := device/nokia/drg

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a73

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a73

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "qualcomm-hidl"

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    system \
    vendor

# Audio
AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT := true
BOARD_SUPPORTS_SOUND_TRIGGER := true
BOARD_USES_ALSA_AUDIO := true
USE_CUSTOM_AUDIO_POLICY := 1

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/configs/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := sdm636
TARGET_NO_BOOTLOADER := true

# Camera
USE_CAMERA_STUB := true

# DRM
TARGET_ENABLE_MEDIADRM_64 := true

# Filesystem
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/configs/config.fs

# FM
BOARD_HAVE_QCOM_FM := true
BOARD_HAS_QCA_FM_SOC := "cherokee"

# Graphics
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_USES_GRALLOC1 := true
TARGET_USES_HWC2 := true
TARGET_USES_ION := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# Hack
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_VENDOR_PROPERTY_NAMESPACE := true

# HIDL
DEVICE_MANIFEST_FILE += \
    $(DEVICE_PATH)/configs/hidl/manifest.xml

DEVICE_MATRIX_FILE := $(DEVICE_PATH)/configs/hidl/compatibility_matrix.xml

# Kernel
BOARD_KERNEL_CMDLINE := \
    console=ttyMSM0,115200,n8 \
    androidboot.console=ttyMSM0 \
    earlycon=msm_serial_dm,0xc170000 \
    androidboot.hardware=qcom \
    msm_rtb.filter=0x37 \
    ehci-hcd.park=3 \
    lpm_levels.sleep_disabled=1 \
    sched_enable_hmp=1 \
    sched_enable_power_aware=1 \
    service_locator.enable=1 \
    swiotlb=1 \
    androidboot.configfs=true \
    androidboot.usbcontroller=a800000.dwc3 \
    loop.max_part=7

BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096

TARGET_KERNEL_CONFIG := vendor/drg-perf_defconfig
TARGET_KERNEL_SOURCE := kernel/nokia/drg

TARGET_KERNEL_ADDITIONAL_FLAGS := \
    HOSTCFLAGS="-fuse-ld=lld -Wno-unused-command-line-argument"

# OTA
TARGET_OTA_ASSERT_DEVICE := drg,DRG,DRG_sprout

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2684354560
BOARD_VENDORIMAGE_PARTITION_SIZE := 536870912
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648

BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_USES_SYSTEM_OTHER_ODEX := true
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_COPY_OUT_PRODUCT := system/product
TARGET_COPY_OUT_VENDOR := vendor

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

# Platform
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := sdm660

# Power
TARGET_USES_INTERACTION_BOOST := true
TARGET_TAP_TO_WAKE_NODE := "/proc/AllHWList/tp_double_tap"

# Properties
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_NO_RECOVERY := true
TARGET_RECOVERY_DEVICE_DIRS += $(DEVICE_PATH)
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Root Directories
BOARD_ROOT_EXTRA_SYMLINKS := \
    /mnt/vendor/persist:/persist \
    /vendor/bt_firmware:/bt_firmware \
    /vendor/dsp:/dsp \
    /vendor/firmware_mnt:/firmware

# Screen density
TARGET_SCREEN_DENSITY := 420

# Security Patch Level
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# SELinux
include device/qcom/sepolicy-legacy-um/SEPolicy.mk

SELINUX_IGNORE_NEVERALLOWS := true

PRODUCT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Telephony
TARGET_PROVIDES_QTI_TELEPHONY_JAR := true

# Vendor
include vendor/nokia/drg/BoardConfigVendor.mk

# VNDK
BOARD_VNDK_VERSION := current

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_AP  := "ap"
WIFI_DRIVER_FW_PATH_P2P := "p2p"
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION := VER_0_8_X