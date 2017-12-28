adb shell "su -c 'cat /proc/partitions'" > partitions.txt
adb shell "su -c 'mount'"  > mount.txt
adb shell "su -c 'mount | grep /dev/block'"  > mount_dev_block.txt
adb shell "su -c 'mount | grep /dev/block/platform/sdio_emmc/by-name'"  > mount_dev_block_bn.txt



rem Для прошивки...
adb shell "cat /proc/mounts"  > proc_mounts_no_su.txt
adb shell "su -c 'cat /proc/mounts'"  > proc_mounts.txt
adb shell "su -c 'cat /proc/mounts | grep /dev/block/platform/sdio_emmc/by-name'"  > proc_mounts_bn.txt


pause