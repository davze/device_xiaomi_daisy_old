#
#
# system.prop for msm8953-common
#

# ART
PRODUCT_PROPERTY_OVERRIDES += \
dalvik.vm.dex2oat-filter=speed \
dalvik.vm.image-dex2oat-filter=speed \

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
audio_para_version=QL1715-Audiopara-V03-20180302 \
acdb_id_para_version=QL1715-Audiopara-V03-20180302 \
audio.chk.cal.us=0 \
audio.chk.cal.spk=0 \
af.fast_track_multiplier=1 \
audio.deep_buffer.media=true \
audio.offload.disable=true \
audio.offload.min.duration.secs=30 \
audio.offload.video=true \
persist.audio.parameter.ce=0 \
persist.dirac.acs.controller=qem \
persist.dirac.acs.ignore_error=1 \
persist.dirac.acs.storeSettings=1 \
persist.vendor.audio.fluence.speaker=true \
persist.vendor.audio.fluence.voicecall=true \
persist.vendor.audio.fluence.voicerec=false \
persist.vendor.audio.hw.binder.size_kbyte=1024 \
persist.vendor.btstack.enable.splita2dp=false \
persist.vendor.audio.speaker.prot.enable=false \
ro.audio.soundfx.dirac=true \
ro.vendor.audio.sdk.fluencetype=fluence \
ro.vendor.audio.sdk.ssr=false \
vendor.audio.dolby.ds2.enabled=false \
vendor.audio.dolby.ds2.hardbypass=false \
vendor.audio.flac.sw.decoder.24bit=true \
vendor.audio.hw.aac.encoder=true \
vendor.audio.offload.buffer.size.kb=64 \
vendor.audio.offload.gapless.enabled=true \
vendor.audio.offload.multiaac.enable=true \
vendor.audio.offload.multiple.enabled=false \
vendor.audio.offload.passthrough=false \
vendor.audio.offload.track.enable=false \
vendor.audio.parser.ip.buffer.size=262144 \
vendor.audio.playback.mch.downsample=true \
vendor.audio.pp.asphere.enabled=false \
vendor.audio.safx.pbe.enabled=false \
vendor.audio.tunnel.encode=false \
vendor.audio.use.sw.alac.decoder=true \
vendor.audio.use.sw.ape.decoder=true \
vendor.audio_hal.period_size=192 \
vendor.voice.conc.fallbackpath=deep-buffer \
vendor.voice.path.for.pcm.voip=true \
vendor.voice.playback.conc.disabled=true \
vendor.voice.record.conc.disabled=false \
vendor.voice.voip.conc.disabled=true

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
bluetooth.hfp.client=1 \
qcom.bluetooth.soc=smd \
ro.bluetooth.hfp.ver=1.7 \
ro.qualcomm.bt.hci_transport=smd \

# camera hal buffer management
PRODUCT_PROPERTY_OVERRIDES += \
persist.camera.managebuffer.enable=1

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
persist.vendor.camera.display.lmax=1280x720 \
persist.vendor.camera.display.umax=1920x1080 \
camera.lowpower.record.enable=1 \
media.camera.ts.monotonic=1 \
persist.vendor.camera.CDS=off \
persist.vendor.camera.video.CDS=off \
persist.vendor.camera.dual.camera=0 \
persist.vendor.camera.gyro.disable=0 \
persist.vendor.camera.isp.clock.optmz=0 \
persist.vendor.camera.stats.test=5 \
persist.vendor.qti.telephony.vt_cam_interface=2 \
vidc.enc.dcvs.extra-buff-count=2 \
vendor.camera.lowpower.record.enable=1 \
camera.disable_zsl_mode=true 

#Additional prop camera
PRODUCT_PROPERTY_OVERRIDES += \
persist.vendor.camera.HAL3.enabled=1 \
persist.vendor.camera.eis.enable=1 \
persist.camera.HAL3.enabled=1 \
persist.camera.eis.enable=1 \
persist.camera.max.previewfps=60 \
persist.vendor.camera.max.previewfps=60 

# AF wait AEC settle count
PRODUCT_PROPERTY_OVERRIDES += \
ro.config.calibration_cad=/vendor/etc/calibration_cad.xml \
persist.bokeh.switch.lux=290 \
persist.camera.auxswitch.threshold=330 \
persist.camera.mainswitch.threshold=419 \
persist.vendor.camera.preview.ubwc=0 \
persist.vendor.camera.stats.test=0 \
persist.vendor.camera.depth.focus.cb=0 \
persist.vendor.camera.isp.clock.optmz=0 \
persist.vendor.camera.linkpreview=0 \
persist.vendor.camera.isp.turbo=1 \
persist.vendor.camera.awb.sync=2 \
persist.vendor.camera.expose.aux=1 \
persist.camera.is_type=4 \
persist.vendor.camera.is_type=4 \
persist.camera.is_mode=4 \
persist.vendor.camera.is_mode=4 \
persist.camera.llv.fuse=2

# Expose aux camera for below packages
PRODUCT_PROPERTY_OVERRIDES += \
camera.aux.packagelist=org.lineageos.snap,com.google.android.GoogleCameraWide,com.android.camera \
vendor.camera.aux.packagelist=org.lineageos.snap,com.google.android.GoogleCameraWide,com.android.camera \
vendor.camera.aux.packagelist2=com.android.systemui,com.huaqin.cameraautotest,com.huaqin.runtime \
vendor.camera.aux.packageblacklist=com.discord

# HAL1
PRODUCT_PROPERTY_OVERRIDES += \
vendor.camera.hal1.packagelist=com.skype.raider,com.google.android.talk,com.whatsapp


#Temporal Noise Reduction
PRODUCT_PROPERTY_OVERRIDES += \
persist.camera.tnr_cds=1 \
persist.camera.tnr.video=1 \
persist.vendor.camera.tnr.video=1 \
persist.camera.tnr.preview=1 \
persist.vendor.camera.tnr.preview=1 \
persist.camera.tnr.snapshot=1 \
persist.vendor.camera.tnr.snapshot=1 \
persist.camera.llnoise=1 \
persist.tnr.process.plates=1 \
persist.vendor.tnr.process.plates=1 \
persist.denoise.process.plates=1 \
persist.vendor.denoise.process.plates=1

# Cne/Dpm
PRODUCT_PROPERTY_OVERRIDES += \
persist.vendor.cne.feature=1 \
persist.vendor.dpm.feature=0

# Coresight
persist.debug.coresight.config=stm-events \

# Dirac - D2AO-1004
PRODUCT_PROPERTY_OVERRIDES += \
persist.dirac.acs.controller=afm \
persist.dirac.afm.mode=global \
persist.dirac.acs.storeSettings=1 \
persist.dirac.poolsize=3

# Display
PRODUCT_PROPERTY_OVERRIDES += \
debug.hwui.use_buffer_age=false \
debug.sf.enable_hwc_vds=1 \
debug.sf.hw=1 \
ro.opengles.version=196610 \
vendor.display.disable_partial_split=1 \
vendor.display.disable_rotator_downscale=1 \
vendor.display.disable_skip_validate=1 \
vendor.display.enable_default_color_mode=0 \
vendor.display.perf_hint_window=50 \
vendor.gralloc.enable_fb_ubwc=1 \
debug.hwui.renderer=opengl

# DRM
PRODUCT_PROPERTY_OVERRIDES += \
drm.service.enabled=true

# Fingerprint
PRODUCT_PROPERTY_OVERRIDES += \
persist.qfp=false

# Fm
PRODUCT_PROPERTY_OVERRIDES += \
ro.fm.transmitter=false

# Frp
PRODUCT_PROPERTY_OVERRIDES += \
ro.frp.pst=/dev/block/bootdevice/by-name/config

# GPS
PRODUCT_PROPERTY_OVERRIDES += \
persist.gps.qc_nlp_in_use=1 \
persist.loc.nlp_name=com.qualcomm.location \
ro.gps.agps_provider=1 \
ro.ril.def.agps.mode=1

# IOP properties
PRODUCT_PROPERTY_OVERRIDES += \
vendor.iop.enable_uxe=1 \
vendor.perf.iop_v3.enable=true

# Media
PRODUCT_PROPERTY_OVERRIDES += \
av.debug.disable.pers.cache=1 \
debug.sf.enable_hwc_vds=1 \
media.aac_51_output_enabled=true \
media.msm8956hw=0 \
media.stagefright.audio.sink=280 \
vendor.mm.enable.qcom_parser=1048575 \
mm.enable.smoothstreaming=true \
mmp.enable.3g2=true \
vendor.audio.hw.aac.encoder=true \
vendor.vidc.dec.downscalar_height=1088 \
vendor.vidc.dec.downscalar_width=1920 \
vendor.vidc.disable.split.mode=1 \
vendor.vidc.enc.disable.pq=true \
vendor.vidc.enc.disable_bframes=1 \
vendor.display.enable_default_color_mode=1 \
vendor.gralloc.enable_fb_ubwc=1 \
vendor.video.disable.ubwc=1

# Memory optimizations
PRODUCT_PROPERTY_OVERRIDES += \
ro.vendor.qti.sys.fw.bservice_enable=true

# Perf
PRODUCT_PROPERTY_OVERRIDES += \
ro.sys.fw.dex2oat_thread_count=8 \
ro.vendor.extension_library=libqti-perfd-client.so

# Netmgrd
PRODUCT_PROPERTY_OVERRIDES += \
ro.vendor.use_data_netmgrd=true \
persist.data.netmgrd.qos.enable=true \
persist.vendor.data.mode=concurrent

# Nitz
PRODUCT_PROPERTY_OVERRIDES += \
persist.rild.nitz_plmn="" \
persist.rild.nitz_long_ons_0="" \
persist.rild.nitz_long_ons_1="" \
persist.rild.nitz_long_ons_2="" \
persist.rild.nitz_long_ons_3="" \
persist.rild.nitz_short_ons_0="" \
persist.rild.nitz_short_ons_1="" \
persist.rild.nitz_short_ons_2="" \
persist.rild.nitz_short_ons_3=""

# Property to enable display default color mode
PRODUCT_PROPERTY_OVERRIDES += \
vendor.display.enable_default_color_mode=1

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
DEVICE_PROVISIONED=1 \
persist.dbg.volte_avail_ovr=1 \
persist.dbg.vt_avail_ovr=1 \
persist.dbg.wfc_avail_ovr=1 \
persist.vendor.radio.apm_sim_not_pwdn=1 \
persist.radio.multisim.config=dsds \
persist.radio.VT_ENABLE=1 \
persist.radio.volte.dan_support=true \
persist.sys.cust.lte_config=true \
persist.vendor.radio.custom_ecc=1 \
persist.vendor.radio.jbims=1 \
persist.vendor.radio.rat_on=combine \
persist.vendor.radio.sib16_support=1 \
persist.vendor.data.iwlan.enable=true \
persist.dbg.ims_volte_enable=1 \
persist.data.iwlan=1 \
persist.data.iwlan.ipsec.ap=1 \
ril.subscription.types=NV,RUIM \
rild.libargs=-d/dev/smd0 \
rild.libpath=/vendor/lib64/libril-qc-qmi-1.so \
ro.telephony.iwlan_operation_mode=legacy \
ro.telephony.call_ring.multiple=false \
ro.telephony.default_network=22,20 \
persist.sys.fflag.override.settings_network_and_internet_v2=true \
service.qti.ims.enabled=1 \
persist.vendor.vt.supported=1 \
persist.vendor.sys.cnd.iwlan=1 \
persist.vendor.cne.logging.qxdm=3974

# Sensors
PRODUCT_PROPERTY_OVERRIDES += \
ro.sensor.proximity=true

# SurfaceFlinger
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
ro.surface_flinger.protected_contents=true \
ro.surface_flinger.force_hwc_copy_for_virtual_displays=true \
ro.surface_flinger.max_virtual_display_dimension=4096 \
ro.surface_flinger.max_virtual_display_dimension=4096 \
ro.surface_flinger.vsync_event_phase_offset_ns=2000000 \
ro.surface_flinger.vsync_sf_event_phase_offset_ns=6000000 \
ro.surface_flinger.max_frame_buffer_acquired_buffers=3

PRODUCT_PROPERTY_OVERRIDES += \
debug.sf.early_phase_offset_ns=1500000 \
debug.sf.early_app_phase_offset_ns=1500000 \
debug.sf.early_gl_phase_offset_ns=3000000 \
    debug.sf.early_gl_app_phase_offset_ns=15000000 \
    debug.sf.latch_unsignaled=1 \
    debug.sf.disable_backpressure=1 \
    debug.sf.enable_gl_backpressure=1

# The default sf phase offset is set to 6ms, to avoid it be included into next
# vsync threshold, set high fps early sf and next vsync threshold phase offset
# to 6.1ms, which is bigger than all sf phase offsets in normal frame rate.
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.high_fps_early_phase_offset_ns=6100000 \
    debug.sf.high_fps_early_gl_phase_offset_ns=9000000 \
    debug.sf.phase_offset_threshold_for_next_vsync_ns=6100000

# Time Services
PRODUCT_PROPERTY_OVERRIDES += \
persist.timed.enable=true \
persist.vendor.delta_time.enable=true \
persist.delta_time.enable=true

# Tcp
PRODUCT_PROPERTY_OVERRIDES += \
net.tcp.2g_init_rwnd=10

# UI
PRODUCT_PROPERTY_OVERRIDES += \
sys.use_fifo_ui=1

# Usb
PRODUCT_PROPERTY_OVERRIDES += \
persist.vendor.usb.config.extra=none

# USB debugging
PRODUCT_PROPERTY_OVERRIDES += \
persist.sys.usb.config=mtp

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
wifi.interface=wlan0

# Unsorted properties
PRODUCT_PROPERTY_OVERRIDES += \
keyguard.no_require_sim=true \
persist.backup.ntpServer=0.pool.ntp.org \
persist.dirac.acs.controller=afm \
persist.dirac.acs.storeSettings=1 \
persist.dirac.afm.mode=global \
persist.dirac.poolsize=3 \
persist.fuse_sdcard=true \
persist.mm.sta.enable=0 \
persist.vendor.audio.speaker.prot.enable=false \
persist.vendor.data.profile_update=true \
persist.vendor.radio.prefer_spn=1 \
vendor.audio.offload.passthrough=false

# Thermal configs path
PRODUCT_PROPERTY_OVERRIDES += \
sys.thermal.data.path=/data/vendor/thermal/

# Rescue party
PRODUCT_PROPERTY_OVERRIDES += \
persist.sys.disable_rescue=true

#Dolby Plus
PRODUCT_PROPERTY_OVERRIDES += \
sys.keep_app_1=com.dolby.ds1appUI
