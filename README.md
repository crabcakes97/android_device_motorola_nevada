# TWRP Device Tree for Motorola nevada (moto g play - 2026)

## Device Info
- Codename: nevada
- Model: moto g play - 2026 (XT2615V)
- SoC: MediaTek Dimensity 6300 / MT6835
- Kernel: 5.15
- Android version base: 16 (from stock)

## Building

1. Sync TWRP source (twrp-12.1 or latest that supports header v4 + vendor_boot recovery):
```bash
repo init -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
repo sync
```

2. Clone this device tree:
```bash
git clone <your-repo> device/motorola/nevada
```

3. Build:
```bash
. build/envsetup.sh
lunch twrp_nevada-eng
mka bootimage vendorbootimage -j$(nproc)
```

## Notes
- TARGET_RECOVERY_PIXEL_FORMAT is set to RGBX_8888 (try this for the button rendering issue)
- Touch modules and firmware are included
- TW_DEVICE_VERSION set to Romlord14495
- Uses vendor_boot for recovery (BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT)

## Pixel / UI issue
The black-box / garbled text issue is a known DRM + minui problem on some MTK devices.
RGBX_8888 + TW_SCREEN_BLANK_ON_BOOT is the current recommended combination.
If it still fails after a source build, try changing to BGRA_8888 or RGBA_8888 in BoardConfig.mk.
