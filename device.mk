LOCAL_PATH := $(call my-dir)

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 32

# API
PRODUCT_SHIPPING_API_LEVEL := 32

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery

# Keystore
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1-service

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Product properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.twrp.version=3.7.1_12-By Romlord14495 \
    ro.minui.pixel_format=RGBX_8888

# Copy firmware and modules
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/vendor/firmware/focaltech_ts_fw_boe_ft8057m.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware/focaltech_ts_fw_boe_ft8057m.bin \
    $(LOCAL_PATH)/recovery/root/vendor/firmware/focaltech_ts_fw_boe_ft8057s.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware/focaltech_ts_fw_boe_ft8057s.bin \
    $(LOCAL_PATH)/recovery/root/vendor/firmware/nt36528_novatek_ts_fw.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware/nt36528_novatek_ts_fw.bin \
    $(LOCAL_PATH)/recovery/root/vendor/firmware/nt36528_novatek_ts_mp.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware/nt36528_novatek_ts_mp.bin \
    $(LOCAL_PATH)/recovery/root/vendor/firmware/nt36528a_novatek_ts_fw.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware/nt36528a_novatek_ts_fw.bin \
    $(LOCAL_PATH)/recovery/root/vendor/firmware/nt36528a_novatek_ts_mp.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware/nt36528a_novatek_ts_mp.bin
