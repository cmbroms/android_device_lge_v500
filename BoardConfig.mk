USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/lge/awifi/BoardConfigVendor.mk

TARGET_ARCH := arm
TARGET_BOARD_PLATFORM := msm8960
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_BOOTLOADER_BOARD_NAME := awifi
TARGET_CPU_VARIANT := krait

TARGET_NO_BOOTLOADER := true

BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 lpj=67677 androidboot.hardware=awifi androidboot.selinux=permissive vmalloc=600M
BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 25165824
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 25165824
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2248146944
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12071206912
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_PREBUILT_KERNEL := device/lge/awifi/kernel

# loki
TARGET_RELEASETOOLS_EXTENSIONS := device/lge/awifi/loki

BOARD_EGL_CFG := device/lge/awifi/egl.cfg


TARGET_RECOVERY_FSTAB = device/lge/awifi/recovery.fstab
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
ENABLE_LOKI_RECOVERY := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_HAS_NO_SELECT_BUTTON := true
