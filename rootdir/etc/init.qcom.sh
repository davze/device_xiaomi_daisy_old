# Copyright (c) 2009-2012, 2014-2019, The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of The Linux Foundation nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

import /vendor/etc/init/hw/init.qcom.usb.rc
import /vendor/etc/init/hw/init.msm.usb.configfs.rc
import /vendor/etc/init/hw/init.target.rc
import /vendor/etc/init/hw/init.spectrum.rc

on early-init
    mount debugfs debugfs /sys/kernel/debug
    chmod 0755 /sys/kernel/debug
    chown root system /dev/kmsg
    chmod 0620 /dev/kmsg

on init
    # ZRAM setup
    write /sys/block/zram0/comp_algorithm lz4
    write /proc/sys/vm/page-cluster 0

on post-fs
    chmod 0755 /sys/kernel/debug/tracing

on early-boot
    # set RLIMIT_MEMLOCK to 64MB
    setrlimit 8 67108864 67108864
    # Allow subsystem (modem etc) debugging
    write /sys/kernel/boot_adsp/boot 1
    write /sys/kernel/boot_cdsp/boot 1
    write /sys/kernel/boot_slpi/boot 1

    exec u:r:qti_init_shell:s0 -- /vendor/bin/init.qcom.early_boot.sh

    # for backward compatibility
    chown system system /persist/sensors
    chown system system /persist/sensors/registry
    chown system system /persist/sensors/registry/registry
    chown system system /persist/sensors/registry/registry/sensors_registry
    chown system system /persist/sensors/sensors_settings
    chown system system /persist/sensors/registry/config
    chmod 0664 /persist/sensors/sensors_settings

    chown system system /mnt/vendor/persist/sensors
    chown system system /mnt/vendor/persist/sensors/sns.reg
    chown system system /mnt/vendor/persist/sensors/sensors_list.txt
    chown system system /mnt/vendor/persist/sensors/registry
    chown system system /mnt/vendor/persist/sensors/registry/registry
    chown system system /mnt/vendor/persist/sensors/registry/registry/sensors_registry
    chown system system /mnt/vendor/persist/sensors/sensors_settings
    chown system system /mnt/vendor/persist/sensors/registry/sns_reg_config
    chown system system /mnt/vendor/persist/sensors/registry/config
    chmod 0664 /mnt/vendor/persist/sensors/sensors_settings

    # Graphics
    chown system graphics /sys/class/graphics/fb0/idle_time
    chmod 0664 /sys/class/graphics/fb0/idle_time
    chown system graphics /sys/class/graphics/fb0/dynamic_fps
    chmod 0664 /sys/class/graphics/fb0/dynamic_fps
    chown system graphics /sys/class/graphics/fb0/dyn_pu
    chmod 0664 /sys/class/graphics/fb0/dyn_pu
    chown system graphics /sys/class/graphics/fb0/modes
    chmod 0664 /sys/class/graphics/fb0/modes
    chown system graphics /sys/class/graphics/fb0/mode
    chmod 0664 /sys/class/graphics/fb0/mode
    chown system graphics /sys/class/graphics/fb0/msm_cmd_autorefresh_en
    chmod 0664 /sys/class/graphics/fb0/msm_cmd_autorefresh_en

on boot
    chown system system /sys/bus/i2c/devices/3-0038/set_cover_mode
    chmod 0660 /sys/bus/i2c/devices/3-0038/set_cover_mode
    chown system system /sys/class/touch/sys/mode_cover
    chmod 0660 /sys/class/touch/sys/mode_cover
    chown bluetooth bluetooth /sys/module/bluetooth_power/parameters/power
    chown bluetooth net_bt /sys/class/rfkill/rfkill0/type
    chown bluetooth net_bt /sys/class/rfkill/rfkill0/state
    chown bluetooth bluetooth /proc/bluetooth/sleep/proto
    chown bluetooth bluetooth /sys/module/hci_uart/parameters/ath_lpm
    chown bluetooth bluetooth /sys/module/hci_uart/parameters/ath_btwrite
    chown system system /sys/module/sco/parameters/disable_esco
    chown bluetooth bluetooth /sys/module/hci_smd/parameters/hcismd_set
    chown system system /sys/module/radio_iris_transport/parameters/fmsmd_set
    chown system system /sys/module/msm_core/parameters/polling_interval
    chown system system /sys/module/msm_core/parameters/disabled
    chown system system /sys/kernel/debug/msm_core/enable
    chown system system /sys/kernel/debug/msm_core/ptable
    chown system system /sys/kernel/boot_slpi/ssr
    chown system system /sys/kernel/boot_adsp/ssr
    chmod 0660 /sys/module/bluetooth_power/parameters/power
    chmod 0660 /sys/module/hci_smd/parameters/hcismd_set
    chmod 0660 /sys/module/radio_iris_transport/parameters/fmsmd_set
    chmod 0660 /sys/class/rfkill/rfkill0/state
    chmod 0660 /proc/bluetooth/sleep/proto
    chown bluetooth net_bt /dev/ttyHS0
    chmod 0660 /sys/module/hci_uart/parameters/ath_lpm
    chmod 0660 /sys/module/hci_uart/parameters/ath_btwrite
    chmod 0660 /dev/ttyHS0
    chown bluetooth bluetooth /sys/devices/platform/msm_serial_hs.0/clock
    chmod 0660 /sys/devices/platform/msm_serial_hs.0/clock

    chmod 0660 /dev/ttyHS2
    chown bluetooth bluetooth /dev/ttyHS2

    chown bluetooth net_bt /sys/class/rfkill/rfkill0/device/extldo
    chmod 0660 /sys/class/rfkill/rfkill0/device/extldo

    #Create QMUX deamon socket area
    mkdir /dev/socket/qmux_radio 0770 radio radio
    chmod 2770 /dev/socket/qmux_radio
    mkdir /dev/socket/qmux_audio 0770 media audio
    chmod 2770 /dev/socket/qmux_audio
    mkdir /dev/socket/qmux_bluetooth 0770 bluetooth bluetooth
    chmod 2770 /dev/socket/qmux_bluetooth
    mkdir /dev/socket/qmux_gps 0770 gps gps
    chmod 2770 /dev/socket/qmux_gps

    mkdir /persist/drm 0770 system system
    mkdir /mnt/vendor/persist/bluetooth 0770 bluetooth bluetooth
    mkdir /persist/misc 0770 system system
    mkdir /persist/alarm 0770 system system
    mkdir /mnt/vendor/persist/time 0770 system system
    mkdir /mnt/vendor/persist/secnvm 0770 system system
    restorecon_recursive /mnt/vendor/persist

    #create port-bridge log dir
    mkdir /data/vendor/port_bridge 0770 radio radio
    chmod 0770 /data/vendor/port_bridge

    #Create NETMGR daemon socket area
    mkdir /dev/socket/netmgr 0750 radio radio

    #Remove SUID bit for iproute2 ip tool
    chmod 0755 /system/bin/ip


    chmod 0444 /sys/devices/platform/msm_hsusb/gadget/usb_state

#   Assign TCP buffer thresholds to be ceiling value of technology maximums
#   Increased technology maximums should be reflected here.
    write /proc/sys/net/core/rmem_max  8388608
    write /proc/sys/net/core/wmem_max  8388608

    # To prevent out of order acknowledgements from making
    # connection tracking to treat them as not belonging to
    # the connection they belong to.
    # Otherwise, a weird issue happens in which some long
    # connections on high-throughput links get dropped when
    # an ack packet comes out of order
    write /proc/sys/net/netfilter/nf_conntrack_tcp_be_liberal 1

    # Set the console loglevel to < KERN_INFO
    # Set the default message loglevel to KERN_INFO
    write /proc/sys/kernel/printk "6 6 1 7"

    # Allow access for CCID command/response timeout configuration
    chown system system /sys/module/ccid_bridge/parameters/bulk_msg_timeout

    # bond0 used by FST Manager
    chown wifi wifi /sys/class/net/bond0/bonding/queue_id

    # Notification LED
    chown system system /sys/class/leds/red/blink
    chown system system /sys/class/leds/green/blink
    chown system system /sys/class/leds/blue/blink
    chown system system /sys/class/leds/red/brightness
    chown system system /sys/class/leds/green/brightness
    chown system system /sys/class/leds/blue/brightness

    # Allow access to emmc rawdump block partition and dload sysfs node
    chown root system /dev/block/bootdevice/by-name/rawdump
    chmod 0660 /dev/block/bootdevice/by-name/rawdump
    chown root system /sys/kernel/dload/emmc_dload
    chmod 0660 /sys/kernel/dload/emmc_dload
    chown root system /dev/block/bootdevice/by-name/ramdump
    chmod 0660 /dev/block/bootdevice/by-name/ramdump
    chown root system /sys/kernel/dload/dload_mode
    chmod 0660 /sys/kernel/dload/dload_mode

    chown wifi wifi /sys/module/wlan/parameters/fwpath

    chown system system /sys/class/backlight/panel0-backlight/brightness
    chown system system /sys/class/backlight/panel0-backlight/max_brightness

    # Create directory used for display
    # for backward compatibilit
    mkdir /persist/display 0770 system graphics
    mkdir /mnt/vendor/persist/display 0770 system graphics

    # Create hvdcp_opti directory
    mkdir /mnt/vendor/persist/hvdcp_opti 0770 root system

# msm specific files that need to be created on /data
on post-fs-data
    mkdir /data/vendor/misc 01771 system system

    # Create directory used for dump collection
    mkdir /data/vendor/ssrdump 0770 root system

    # Create directory used by display clients
    mkdir /data/vendor/display 0770 system graphics

    # Change lm related dirs
    mkdir /data/vendor/lm 0700 root root

    # Create directory used by media clients
    mkdir /data/vendor/media 0770 mediacodec media

    # create QDMA dropbox
    mkdir /data/vendor/qdmastats 0700 system system
    mkdir /data/vendor/qdma 0770 system system
    mkdir /dev/socket/qdma 0770 system system
    chmod 2770 /dev/socket/qdma

    # Create /data/vendor/tzstorage directory for SFS listener
    mkdir /data/vendor/tzstorage 0770 system system

    # Create directory for apps access via QTEEConnector
    mkdir /data/vendor/qtee 0770 system system

    #Create folder of camera
    mkdir /data/vendor/camera 0770 camera camera

    #Create folder for mm-qcamera-daemon
    mkdir /data/misc/camera 0770 camera camera

    #Create directory for tftp
    mkdir /data/vendor/tombstones 0771 system system

    #Change ownership to system
    chown system system /data/vendor/tombstones

    mkdir /data/vendor/ramdump 0771 root system
    mkdir /data/misc/bluetooth 0770 bluetooth bluetooth
    mkdir /data/vendor/bluetooth 0770 bluetooth bluetooth
    mkdir /data/vendor/ramdump/bluetooth 0770 bluetooth bluetooth

    # Create directory for tftp
    chown system system /data/vendor/tombstones
    mkdir /data/vendor/tombstones/rfs 0771 system system
    mkdir /data/vendor/tombstones/rfs/modem 0771 system system
    mkdir /data/vendor/tombstones/rfs/lpass 0771 system system
    mkdir /data/vendor/tombstones/rfs/slpi 0771 system system

    # Create the directories used by the Wireless subsystem
    mkdir /data/vendor/wifi 0771 wifi wifi
    mkdir /data/vendor/wifi/wpa 0770 wifi wifi
    mkdir /data/vendor/wifi/wpa/sockets 0770 wifi wifi
    mkdir /data/vendor/wifi/sockets 0770 wifi wifi
    mkdir /data/vendor/wifi/hostapd 0770 wifi wifi
    mkdir /data/vendor/wifi/hostapd/ctrl 0770 wifi wifi
    mkdir /data/vendor/wifi/wpa_supplicant 0770 wifi wifi

    #create netmgr log dir
    mkdir /data/vendor/netmgr 0770 radio radio
    chmod 0770 /data/vendor/netmgr

    #create ipacm log dir
    mkdir /data/vendor/ipa 0770 radio radio
    chmod 0770 /data/vendor/ipa

    #Create QTI dir for logs
    mkdir /data/vendor/dataqti 0770 radio radio
    chmod 0770 /data/vendor/dataqti

    # Create the directories used by CnE subsystem
    mkdir /data/vendor/connectivity 0771 radio radio
    chown radio radio /data/vendor/connectivity

    # Create directory used by audio subsystem
    mkdir /data/vendor/audio 0770 audio audio

    # Create directory for audio delta files
    mkdir /data/vendor/audio/acdbdata 0770 media audio
    mkdir /data/vendor/audio/acdbdata/delta 0770 media audio

    # Create directory for radio
    mkdir /data/vendor/radio 0770 system radio

    # Create directory for modem_config
    mkdir /data/vendor/modem_config 0570 radio root

    # Mounting of persist is moved to 'on emmc-fs' and 'on fs' sections
    # We chown/chmod /persist again so because mount is run as root + defaults
    chown root system /persist
    chmod 0771 /persist
    chown system system /persist/WCNSS_qcom_wlan_nv.bin
    chmod 0664 /sys/devices/platform/msm_sdcc.1/polling
    chmod 0664 /sys/devices/platform/msm_sdcc.2/polling
    chmod 0664 /sys/devices/platform/msm_sdcc.3/polling
    chmod 0664 /sys/devices/platform/msm_sdcc.4/polling

    # Chown polling nodes as needed from UI running on system server
    chown system system /sys/devices/platform/msm_sdcc.1/polling
    chown system system /sys/devices/platform/msm_sdcc.2/polling
    chown system system /sys/devices/platform/msm_sdcc.3/polling
    chown system system /sys/devices/platform/msm_sdcc.4/polling

    #Create the symlink to qcn wpa_supplicant folder for ar6000 wpa_supplicant
    #symlink /data/misc/wifi/wpa_supplicant /data/system/wpa_supplicant

    #Create directories for Location services
    mkdir /data/vendor/location 0770 gps gps
    mkdir /data/vendor/location/mq 0770 gps gps
    mkdir /data/vendor/location/xtwifi 0770 gps gps
    mkdir /dev/socket/location 0770 gps gps
    mkdir /dev/socket/location/mq 0770 gps gps
    mkdir /dev/socket/location/xtra 0770 gps gps
    mkdir /data/vendor/location-partner 0770 gps gps
    mkdir /data/vendor/location-partner/dre 0770 gps gps
    mkdir /data/vendor/location-partner/ppe 0770 gps gps
    mkdir /dev/socket/location 0770 gps gps
    mkdir /dev/socket/location/ehub 0770 gps gps

    #Create directories for wifihal services
    mkdir /dev/socket/wifihal 0770 wifi wifi
    chmod 2770 /dev/socket/wifihal

    # Create /data/time folder for time-services
    mkdir /data/vendor/time/ 0700 system system

    setprop vold.post_fs_data_done 1

    #Create FM dir for patchdownloader
    mkdir /data/vendor/fm 0770 system system
    chmod 0770 /data/vendor/fm

    #Create PERFD deamon related dirs
    mkdir /data/vendor/perfd 0770 root system
    chmod 2770 /data/vendor/perfd
    rm /data/vendor/perfd/default_values

    #Create IOP  deamon related dirs
    mkdir /data/vendor/iop 0700 root system

    # Mark the copy complete flag to not completed
    write /data/vendor/radio/copy_complete 0
    chown radio radio /data/vendor/radio/copy_complete
    chmod 0660 /data/vendor/radio/copy_complete

    # copy prebuilt qcril.db files always
    copy /vendor/radio/qcril_database/qcril.db /data/vendor/radio/qcril_prebuilt.db
    chown radio radio /data/vendor/radio/qcril_prebuilt.db
    chmod 0660 /data/vendor/radio/qcril_prebuilt.db
    # File flags for prebuilt ril db file
    write /data/vendor/radio/prebuilt_db_support 1
    chown radio radio /data/vendor/radio/prebuilt_db_support
    chmod 0400 /data/vendor/radio/prebuilt_db_support
    write /data/vendor/radio/db_check_done 0
    chown radio radio /data/vendor/radio/db_check_done
    chmod 0660 /data/vendor/radio/db_check_done

    # qti-logkit data
    mkdir /data/vendor/qti-logkit/ 0771 system system
    mkdir /data/vendor/qti-logkit/shared-privileged/ 2770 system system
    mkdir /data/vendor/qti-logkit/shared-public/ 2770 system diag
    mkdir /data/vendor/qti-logkit/socket-privileged/ 2770 system system
    mkdir /data/vendor/qti-logkit/socket-public/ 2750 system diag
    mkdir /data/vendor/qti-logkit/logdata/ 2750 system shell

    #Create SWAP related dirs
    mkdir /data/vendor/swap 0770 root system
    chmod 2770 /data/vendor/swap

    # Processgroup
    chown system system /acct/uid_*
    chmod 0777 /acct/uid_*

    # Sensors
    chmod 0775 /persist/sensors
    chmod 0664 /persist/sensors/sensors_settings
    chown system root /persist/sensors/sensors_settings
    mkdir /persist/sensors/registry/registry
    mkdir /data/misc/sensors
    chmod 0775 /data/misc/sensors

    # set aggressive read ahead for dm-0 and dm-1 during boot up
    write /sys/block/dm-0/queue/read_ahead_kb 2048
    write /sys/block/dm-1/queue/read_ahead_kb 2048
    write /sys/block/dm-2/queue/read_ahead_kb 2048

    #Create dir for TUI
    mkdir /data/vendor/tui 0700 system system

    #Start move time data to /data/vendor once post-fs-data done
    start vendor.move_time_data

service iop /system/vendor/bin/iop
    class main
    user root
    group root
    disabled
    socket iop seqpacket 0666 root system
    writepid /dev/cpuset/system-background/tasks

on property:sys.boot_completed=1
    write /dev/kmsg "Boot completed "
    #Reset read ahead for dm-0 and dm-1 to 512kb
    write /sys/block/dm-0/queue/read_ahead_kb 512
    write /sys/block/dm-1/queue/read_ahead_kb 512
    #WDSP FW boot sysfs node used by STHAL
    chown media audio /sys/kernel/wdsp0/boot
    chown media audio /sys/kernel/wcd_cpe0/fw_name
    chown system system /sys/class/power_supply/battery/battery_charging_enabled
    chmod 0666 /sys/class/power_supply/battery/battery_charging_enabled

on property:persist.vendor.radio.atfwd.start=false
    stop vendor.atfwd

on property:vendor.radio.atfwd.start=false
    stop vendor.atfwd

on property:vold.decrypt=trigger_restart_framework
    start config_bt_addr
    restart vendor.camera-provider-2-4
    restart vendor.audio-hal-2-0

on property:persist.env.fastdorm.enabled=true
    setprop persist.radio.data_no_toggle 1

on property:ro.vendor.iocgrp.config=1
    mkdir /dev/blkio
    mount cgroup none /dev/blkio blkio
    chown system system /dev/blkio
    chown system system /dev/blkio/tasks
    chmod 0664 /dev/blkio/tasks
    mkdir /dev/blkio/bg 0755 system system
    chown system system /dev/blkio/bg/tasks
    chmod 0664 /dev/blkio/bg/tasks
    write /dev/blkio/blkio.weight 1000
    write /dev/blkio/bg/blkio.weight 100

service vendor.qrtr-ns /vendor/bin/qrtr-ns -f
    class core
    user vendor_qrtr
    group vendor_qrtr
    capabilities NET_BIND_SERVICE

service irsc_util /vendor/bin/irsc_util "/vendor/etc/sec_config"
    class core
    user root
    oneshot

service vendor.rmt_storage /vendor/bin/rmt_storage
    class core
    user root
    shutdown critical
    ioprio rt 0
    writepid /dev/cpuset/system-background/tasks

service vendor.tftp_server /vendor/bin/tftp_server
   class core
   user root
   writepid /dev/cpuset/system-background/tasks

service vendor.fm /vendor/bin/init.qti.fm.sh
    class late_start
    user system
    group system
    disabled
    oneshot

on property:vendor.wc_transport.start_hci=true
    start vendor.start_hci_filter

on property:vendor.wc_transport.start_hci=false
    stop vendor.start_hci_filter

service vendor.start_hci_filter /system/vendor/bin/wcnss_filter
    class late_start
    user bluetooth
    group bluetooth diag system wakelock
    seclabel u:r:bluetooth:s0
    disabled

on property:bluetooth.hciattach=true
    setprop bluetooth.status on

on property:bluetooth.hciattach=false
    setprop bluetooth.status off

service atfwd /vendor/bin/ATFWD-daemon
    class late_start
    user system
    group system radio
    writepid /dev/cpuset/system-background/tasks

service vendor.port-bridge /system/vendor/bin/port-bridge
    class main
    user radio
    group radio system inet
    disabled
    oneshot

service vendor.sensors /vendor/bin/sscrpcd
    class core
    user system
    group system
    writepid /dev/cpuset/system-background/tasks

service vendor.sensors.qti /vendor/bin/sensors.qti
    class core
    user system
    group system
    writepid /dev/cpuset/system-background/tasks

on property:ro.vendor.use_data_netmgrd=false
    # netmgr not supported on specific target
    stop vendor.netmgrd

# Adjust socket buffer to enlarge TCP receive window for high bandwidth
# but only if ro.data.large_tcp_window_size property is set.
on property:ro.data.large_tcp_window_size=true
    write /proc/sys/net/ipv4/tcp_adv_win_scale  2

on property:sys.sysctl.tcp_adv_win_scale=*
    write /proc/sys/net/ipv4/tcp_adv_win_scale ${sys.sysctl.tcp_adv_win_scale}

service wpa_supplicant /vendor/bin/hw/wpa_supplicant \
    -O/data/vendor/wifi/wpa/sockets -puse_p2p_group_interface=1 -dd \
    -g@android:vendor_wpa_wlan0
#   we will start as root and wpa_supplicant will switch to user wifi
#   after setting up the capabilities required for WEXT
#   user wifi
#   group wifi inet keystore
    interface android.hardware.wifi.supplicant@1.0::ISupplicant default
    interface android.hardware.wifi.supplicant@1.1::ISupplicant default
    interface android.hardware.wifi.supplicant@1.2::ISupplicant default
    class main
    socket vendor_wpa_wlan0 dgram 660 wifi wifi
    disabled
    oneshot

# Data Migration
service vendor.move_wifi_data /system/bin/move_wifi_data.sh
    class main
    user  wifi
    group wifi
    disabled
    oneshot

service loc_launcher /system/vendor/bin/loc_launcher
    class late_start
    user gps
    group gps
    writepid /dev/cpuset/system-background/tasks

service qcom-sh /vendor/bin/init.qcom.sh
    class late_start
    user root
    group root system radio
    oneshot

on property:ro.vendor.ril.mbn_copy_completed=1
    write /data/vendor/radio/copy_complete 1

service qcom-post-boot /vendor/bin/init.qcom.post_boot.sh
    class late_start
    user root
    group root system wakelock graphics
    disabled
    oneshot

on property:sys.boot_completed=1
    start qcom-post-boot

on property:init.svc.qcom-post-boot=stopped
    # Set min gpu freq as 320mhz
    write /sys/class/kgsl/kgsl-3d0/devfreq/min_freq 320000000

on property:ro.data.large_tcp_window_size=true
    # Adjust socket buffer to enlarge TCP receive window for high bandwidth (e.g. DO-RevB)
    write /proc/sys/net/ipv4/tcp_adv_win_scale  2

service vendor.ril-daemon2 /vendor/bin/hw/rild -c 2
    class main
    user radio
    group radio cache inet misc audio sdcard_r sdcard_rw diag log
    capabilities BLOCK_SUSPEND NET_ADMIN NET_RAW

service charger /sbin/chargeonlymode
    class charger
    group system graphics
    seclabel u:r:healthd:s0

service vendor.msm_irqbalance /vendor/bin/msm_irqbalance -f /system/vendor/etc/msm_irqbalance.conf
    class core
    user root
    group root
    disabled

on charger
    setprop persist.sys.usb.config mass_storage
    load_system_props
    start qcom-post-boot

service vendor.move_time_data /system/bin/move_time_data.sh
    class main
    user system
    group system
    disabled
    oneshot

service vendor.audio-hal-2-0 /vendor/bin/hw/android.hardware.audio@2.0-service
    override
    class hal
    user audioserver
    # media gid needed for /dev/fm (radio) and for /data/misc/media (tee)
    group audio camera drmrpc inet media mediadrm net_bt net_bt_admin net_bw_acct oem_2901 wakelock system
    capabilities BLOCK_SUSPEND
    ioprio rt 4
    writepid /dev/cpuset/foreground/tasks /dev/stune/foreground/tasks
    # audioflinger restarts itself when it loses connection with the hal
    # and its .rc file has an "onrestart restart audio-hal" rule, thus
    # an additional auto-restart from the init process isn't needed.
    oneshot
    interface android.hardware.audio@5.0::IDevicesFactory default
    interface android.hardware.audio@4.0::IDevicesFactory default
    interface android.hardware.audio@2.0::IDevicesFactory default

service vendor.power_off_alarm /vendor/bin/power_off_alarm
    class core
    group system
    disabled
    oneshot

on property:dev.bootcomplete=1
    setprop sys.io.scheduler "bfq"

on property:apexd.status=ready
    mount none /system/etc/swcodec/ld.config.txt /apex/com.android.media.swcodec/etc/ld.config.txt bind

# Vibrator
    chown root system /sys/devices/virtual/timed_output/vibrator/vtg_level
    chmod 0660 /sys/devices/virtual/timed_output/vibrator/vtg_level
    chown system system /sys/module/hall/parameters/hall_toggle
    chmod 0660 /sys/module/hall/parameters/hall_toggle

# KCAL permissions
    chown system system /sys/devices/platform/kcal_ctrl.0/kcal
    chown system system /sys/devices/platform/kcal_ctrl.0/kcal_enable
    chown system system /sys/devices/platform/kcal_ctrl.0/kcal_cont
    chown system system /sys/devices/platform/kcal_ctrl.0/kcal_sat
    chown system system /sys/devices/platform/kcal_ctrl.0/kcal_hue
    chown system system /sys/devices/platform/kcal_ctrl.0/kcal_min
    chown system system /sys/devices/platform/kcal_ctrl.0/kcal_val
    chmod 0660 /sys/devices/platform/kcal_ctrl.0/kcal
    chmod 0660 /sys/devices/platform/kcal_ctrl.0/kcal_enable
    chmod 0660 /sys/devices/platform/kcal_ctrl.0/kcal_cont
    chmod 0660 /sys/devices/platform/kcal_ctrl.0/kcal_sat
    chmod 0660 /sys/devices/platform/kcal_ctrl.0/kcal_hue
    chmod 0660 /sys/devices/platform/kcal_ctrl.0/kcal_min
    chmod 0660 /sys/devices/platform/kcal_ctrl.0/kcal_val

 # USB Fastcharge
    chown system system /sys/kernel/fast_charge/force_fast_charge
    chmod 0664 /sys/kernel/fast_charge/force_fast_charge   

# Audio gain permissions
    chown system system /sys/kernel/sound_control/headphone_gain
    chown system system /sys/kernel/sound_control/mic_gain
    chown system system /sys/kernel/sound_control/earpiece_gain
    chown system system /sys/kernel/sound_control/speaker_gain
    chmod 0664 /sys/kernel/sound_control/headphone_gain
    chmod 0664 /sys/kernel/sound_control/mic_gain
    chmod 0664 /sys/kernel/sound_control/earpiece_gain
    chmod 0664 /sys/kernel/sound_control/speaker_gain
    
