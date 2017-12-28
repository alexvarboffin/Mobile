#!/system/xbin/busybox sh

bb="/system/xbin/busybox"

dir="/sdcard/backup/`$bb date +%Y-%m-%d.%H.%M.%S`"

$bb mkdir -p $dir
cd $dir

$bb dd if=/proc/mtd of=firmware.info
$bb grep "ro.build.*" /system/build.prop | $bb grep -v "# *" > config.info
$bb cat /proc/cmdline > cmdline.info
$bb cat /proc/cpuinfo > cpu.info
$bb df > rom.info
$bb free > ram.info

$bb grep ^mtd firmware.info | \
    while read M L S N; do
        MTD=${M%:}
        N1=${N#\"}
        NAME=${N1%\"}
        echo $MTD $NAME

        case $NAME in
            userdata)
                /mkyaffs2image /data $MTD.$NAME.yaffs2.img
                ;;
            fixnv|backupfixnv|runtimenv|system|cache|productinfo)
                /mkyaffs2image /$NAME $MTD.$NAME.yaffs2.img
                ;;
            *)
                $bb dd if=/dev/mtd/$MTD of=$MTD.$NAME.img
                ;;
        esac
    done

$bb md5sum * > nandroid.md5
