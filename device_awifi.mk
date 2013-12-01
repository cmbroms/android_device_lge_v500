$(call inherit-product-if-exists, vendor/lge/awifi/awifi-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/awifi/overlay

LOCAL_PATH := device/lge/awifi
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_CHARACTERISTICS := nosdcard

LOCAL_PATH := $(LOCAL_PATH)

PRODUCT_COPY_FILES := \
    $(LOCAL_PATH)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

PRODUCT_PACKAGES += \
    libgenlock \
    liboverlay \
    hwcomposer.msm8974 \
    gralloc.msm8974 \
    copybit.msm8974

PRODUCT_PACKAGES += \
    audio_policy.msm8974 \
    audio.primary.msm8974 \
    libaudio-resampler \
    libdashplayer

# loki
PRODUCT_PACKAGES += \
    loki_patch \
    loki_flash \
    loki.sh

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/snd_soc_msm_Taiko:system/etc/snd_soc_msm/snd_soc_msm_Taiko \
    $(LOCAL_PATH)/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    $(LOCAL_PATH)/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/media_codecs.xml:system/etc/media_codecs.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.awifi.rc:root/init.awifi.rc \
    $(LOCAL_PATH)/rootdir/init.awifi.usb.rc:root/init.awifi.usb.rc \
    $(LOCAL_PATH)/rootdir/init.goldfish.rc:root/init.goldfish.rc \
    $(LOCAL_PATH)/rootdir/init.gvar.cmm.usb.sh:root/init.gvar.cmm.usb.sh \
    $(LOCAL_PATH)/rootdir/init.gvar.usb.sh:root/init.gvar.usb.sh \
    $(LOCAL_PATH)/rootdir/init.lge.early.rc:root/init.lge.early.rc \
    $(LOCAL_PATH)/rootdir/init.lge.log.rc:root/init.lge.log.rc \
    $(LOCAL_PATH)/rootdir/init.lge.rc:root/init.lge.rc \
    $(LOCAL_PATH)/rootdir/initlogo_l.rle:root/initlogo_l.rle \
    $(LOCAL_PATH)/rootdir/initlogo.rle:root/initlogo.rle \
    $(LOCAL_PATH)/rootdir/init.miniOS.rc:root/init.miniOS.rc \
    $(LOCAL_PATH)/rootdir/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
    $(LOCAL_PATH)/rootdir/init.qcom.class_main.sh:root/init.qcom.class_main.sh \
    $(LOCAL_PATH)/rootdir/init.qcom.early_boot.sh:root/init.qcom.early_boot.sh \
    $(LOCAL_PATH)/rootdir/init.qcom.rc:root/init.qcom.rc \
    $(LOCAL_PATH)/rootdir/init.qcom.ril.sh:root/init.qcom.ril.sh \
    $(LOCAL_PATH)/rootdir/init.qcom.sh:root/init.qcom.sh \
    $(LOCAL_PATH)/rootdir/init.qcom.syspart_fixup.sh:root/init.qcom.syspart_fixup.sh \
    $(LOCAL_PATH)/rootdir/init.target.rc:root/init.target.rc \
    $(LOCAL_PATH)/rootdir/init.trace.rc:root/init.trace.rc \
    $(LOCAL_PATH)/rootdir/init.usb.rc:root/init.usb.rc \
    $(LOCAL_PATH)/rootdir/init.vmware.rc:root/init.vmware.rc \
	$(LOCAL_PATH)/rootdir/etc/init.ath3k.bt.sh:system/etc/init.ath3k.bt.sh \
    $(LOCAL_PATH)/rootdir/etc/init.crda.sh:system/etc/init.crda.sh \
    $(LOCAL_PATH)/rootdir/etc/init.galbi.audio.sh:system/etc/init.galbi.audio.sh \
    $(LOCAL_PATH)/rootdir/etc/init.galbi.bt.sh:system/etc/init.galbi.bt.sh \
    $(LOCAL_PATH)/rootdir/etc/init.galbi.coex.sh:system/etc/init.galbi.coex.sh \
    $(LOCAL_PATH)/rootdir/etc/init.galbi.efs.sync.sh:system/etc/init.galbi.efs.sync.sh \
    $(LOCAL_PATH)/rootdir/etc/init.galbi.factory.sh:system/etc/init.galbi.factory.sh \
    $(LOCAL_PATH)/rootdir/etc/init.galbi.fm.sh:system/etc/init.galbi.fm.sh \
    $(LOCAL_PATH)/rootdir/etc/init.galbi.modem_links.sh:system/etc/init.galbi.modem_links.sh \
    $(LOCAL_PATH)/rootdir/etc/init.galbi.post_boot.sh:system/etc/init.galbi.post_boot.sh \
    $(LOCAL_PATH)/rootdir/etc/init.galbi.ril.sh:system/etc/init.galbi.ril.sh \
    $(LOCAL_PATH)/rootdir/etc/init.galbi.sdio.sh:system/etc/init.galbi.sdio.sh \
    $(LOCAL_PATH)/rootdir/etc/init.galbi.thermal_conf.sh:system/etc/init.galbi.thermal_conf.sh \
    $(LOCAL_PATH)/rootdir/etc/init.galbi.wifi.sh:system/etc/init.galbi.wifi.sh

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bcmdhd.cal:system/etc/wifi/bcmdhd.cal \
    $(LOCAL_PATH)/FTM_PowerTable.XML:system/etc/wifi/FTM_PowerTable.XML \
    $(LOCAL_PATH)/p2p_supplicant.conf:system/etc/wifi/p2p_supplicant.conf \
    $(LOCAL_PATH)/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/gps.conf:system/etc/gps.conf

PRODUCT_PROPERTY_OVERRIDES := \
    ro.build.target_operator=VZW \
    ro.build.target_country=US \
    ro.lge.swversion=VS98011A \
    ro.lge.factoryversion=VS98011A_01 \
    ro.lge.swversion_short=V00a \
    ro.lge.swversion_rev=01 \
    sys.usb.provisioned=0 \
    persist.radio.no_wait_for_card=1 \
    persist.lge.uicc.log=false \
    persist.audio.nsenabled=ON \
    persist.audio.spkcall_2mic=OFF \
    ro.afwdata.LGfeatureset=VZWBASE \
    wlan.lge.concurrency=MCC \
    persist.data.tethering_oc=1 \
    wlan.lge.wifidisplay=both \
    ro.cdma.home.operator.alpha=Verizon \
    ro.cdma.home.operator.numeric=310004 \
    ro.cdma.otaspnumschema=SELC,3,00,07,80,87,88,99 \
    ro.gsm.sms.disablelog=64 \
    ime_extend_row_keyboard=true \
    ime_onehand_keyboard=true \
    ime_split_keyboard=true \
    ime_theme=true \
    ime_keyboard_layout=ko=QWERTY \
    ime_vibration_pattern=0:20 \
    ro.config.vc_call_vol_steps=7 \
    ro.config.vc_call_vol_default=5 \
    ro.lge.lcd_default_brightness=173 \
    lge.nfc.setype=uicc \
    lge.nfc.defaultonoff=offp2p \
    lge.nfc.handover=directbeam \
    lge.nfc.vendor=brcm \
    wifi.lge.sleeppolicy=2 \
    wifi.lge.offdelay=false \
    wlan.chip.vendor=brcm \
    wifi.supplicant_scan_interval=20 \
    wifi.lge.patch=true \
    wifi.lge.hanglessid=false \
    wifi.lge.offloading=true \
    wifi.lge.aggregation=true \
    wifi.lge.mhp=true \
    ro.com.google.gmsversion=4.2_r2_jul \
    ro.setupwizard.mode=DISABLED \
    ro.livewallpaper.map=DISABLED \
    ro.com.google.apphider=off \
    ro.com.google.clientidbase=android-om-lge \
    ro.com.google.clientidbase.ms=android-verizon \
    ro.com.google.clientidbase.am=android-verizon \
    ro.com.google.clientidbase.gmm=android-om-lge \
    ro.com.google.clientidbase.yt=android-verizon \
    tangible_device_config=B1BCNAOTDO \
    ro.lge.vib_magnitude_index=0,20,40,60,80,100,120,127 \
    lge.normalizer.param=version2.0/true/14.5/true/8230/1.0/2050/0.55 \
    ro.radio.topreviousmode=disable \
    drm.service.enabled=true \
    ro.cdma.homesystem=66,67,69,71,72,74 \
    ro.lge.lcd_auto_brightness_mode=true \
    wlan.chip.version=bcm4335 \
    dhcp.dlna.using=false \
    wlan.lge.passpoint=true \
    persist.radio.apm_sim_not_pwdn=1 \
    ro.sf.lcd_density_secondary=400 \
    persist.service.crash.enable=0 \
    persist.sys.ssr.restart_level=3 \
    qcom.thermal=thermal-engine \
    ro.sf.lcd_density=480 \
    net.tethering.noprovisioning=true \
    persist.bandwidth.enable=1 \
    persist.lg.data.fd=-1 \
    persist.radio.data_no_toggle=1 \
    ro.lge.audio_soundexception=true \
    ro.lge.audio_soundprofile=true \
    ro.carrier=unknown \
    ro.vendor.extension_library=/vendor/lib/libqc-opt.so \
    ro.lge.ps.eco.pv=0 \
    ro.lge.ps.freqlowlimit=1036800 \
    ro.lge.capp_cupss.rootdir=/system/cust \
    ro.lge.capp_optimusui=true \
    ro.lge.capp_core=true \
    ro.lge.capp_themeicon=true \
    ro.lge.capp_drm=true \
    ro.lge.capp_divx_drm=true \
    ro.lge.capp_almond=true \
    ro.lge.capp_resource=true \
    ro.lge.capp_wapservice=true \
    ro.lge.capp_osp=true \
    ro.lge.capp_ghost_finger=true \
    ro.lge.capp_touch_scroller=true \
    ro.lge.capp_key_exception=true \
    ro.lge.capp_keyled_timeout=true \
    ro.lge.capp_nfc=true \
    ro.lge.capp_mdm=true \
    ro.lge.capp_lockscreen=true \
    ro.lge.capp_nfs=true \
    ro.lge.capp_compat=true \
    ro.lge.capp_bubble_popup=true \
    ro.lge.capp_smf=true \
    ro.lge.capp_art=true \
    lge.signed_image=true \
    ro.lge.capp_qwindow=true \
    ro.lge.qslide.max_window=2 \
    ro.config.libemoji=libemoji_lge.so \
    ro.lge.capp_emoji=true \
    ro.lge.capp_cliptray=true \
    capp_media_audioeffect=true \
    ro.lge.capp_ir_remote=true \
    ro.lge.capp_cello=true \
    ro.lge.capp_emotional_led=true \
    ro.lge.capp_volume_vibrator=true \
    ro.lge.capp_smartcard_ac_gp=true \
    ro.lge.capp_smartcard_ac_gto=false \
    ro.lge.capp_smartcard_lgril=false \
    ro.lge.capp_smartcard_uicc=true \
    ro.lge.capp_smartcard_smartmx=false \
    ro.lge.fonts=true \
    ro.lge.capp_wfd=true \
    ro.lge.capp_qctwfd=true \
    ro.lge.capp_touch_flick_noti=true \
    ro.lge.capp_lgevpn=true \
    ro.lge.capp_smartcard=true \
    ro.lge.capp_smartcard_oma=true \
    ro.lge.capp_slideAside=true \
    ro.lge.capp_app_preinstall=true \
    persist.data_netmgrd_mtu=1428 \
    persist.qcril.disable_retry=true \
    android.telephony.apn-restore=1800000 \
    vzw.telephony.appsapn-restore=60000 \
    ro.lge.b2b.vmware=true \
    ro.telephony.default_network=10 \
    ro.qc.sdk.izat.premium_enabled=0 \
    ro.qc.sdk.izat.service_mask=0x0 \
    persist.gps.qc_nlp_in_use=0

PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxQcelp13Enc

PRODUCT_PACKAGES += \
    libmm-omxcore \
    libdivxdrmdecrypt \
    libOmxVdec \
    libOmxVenc \
    libOmxCore \
    libstagefrighthw \
    libc2dcolorconvert

PRODUCT_PACKAGES += \
    lights.msm8974

# Inherit from the common Open Source product configuration
$(call inherit-product, build/target/product/full_base_telephony.mk)

# call dalvik heap config
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)

PRODUCT_NAME := awifi
PRODUCT_BRAND := LGE
