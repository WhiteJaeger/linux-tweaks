# Linux tweaks

## Launch Command

`MANGOHUD=1 DXVK_HDR=1 PROTON_ENABLE_HDR=1 PROTON_DLSS_UPGRADE=1 DXVK_NVAPI_DRS_NGX_DLSS_RR_MODE=custom,NGX_DLSS_RR_OVERRIDE_SCALING_RATIO=90 DXVK_NVAPI_DRS_NGX_DLSSG_MULTI_FRAME_COUNT=3 %command%`

* (optional) `MANGOHUD=1` - performance monitor
* `PROTON_DLSS_UPGRADE=1` - use the latest DLSS
* `DXVK_HDR=1 PROTON_ENABLE_HDR=1` - HDR
* (optional) `DXVK_NVAPI_DRS_NGX_DLSS_RR_MODE=custom,NGX_DLSS_RR_OVERRIDE_SCALING_RATIO=90` - custom DLSS scaling (`90` == 90%) 
  * `DXVK_NVAPI_DRS_NGX_DLAA_OVERRIDE=dlaa_on` - DLAA
* (optional) `DXVK_NVAPI_DRS_NGX_DLSSG_MULTI_FRAME_COUNT=3` - override DLSS Frame Generation frame count
  * Valid VALUEs are: `0` (application-controlled), `1` (2x), `2` (3x) and `3` (4x).

## More on DLSS
* https://github.com/jp7677/dxvk-nvapi/wiki/Passing-driver-settings#override-dlss-sr-performance-mode

## More on HDR 

* https://github.com/GloriousEggroll/proton-ge-custom?tab=readme-ov-file#enable-hdr

## Audio

* Dolby Atmos: https://www.reddit.com/r/linuxquestions/comments/pfl0g7/dolby_atmos_support_in_linux/?rdt=41004

  1. Update/Install pipewire (reboot after installing)

  2. Install EasyEffects (flatpak)

  3. After installing EasyEffects, run it at least once (important, this creates some directories which will be needed later)

  4. Install the EasyEffects Presets from [this](https://github.com/JackHack96/EasyEffects-Presets) repository.

  5. Open the program

  6. Open the "plugins" tab on the bottom

  7. Click "Add plugin"

  8. Add a convolver

  9. Select "Impulses" on the right

  10. Select "Dolby ATMOS" from the list

