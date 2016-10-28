#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 8157184 90683d46df1d886c9427f27363b1213b2e1736d1 5584896 7d430d21cd569a514f41883dabacd4ef8def7a4b
fi

if ! applypatch -c EMMC:/dev/block/platform/dw_mmc/by-name/RECOVERY:8157184:90683d46df1d886c9427f27363b1213b2e1736d1; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/dw_mmc/by-name/BOOT:5584896:7d430d21cd569a514f41883dabacd4ef8def7a4b EMMC:/dev/block/platform/dw_mmc/by-name/RECOVERY 90683d46df1d886c9427f27363b1213b2e1736d1 8157184 7d430d21cd569a514f41883dabacd4ef8def7a4b:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
