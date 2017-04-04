#!/system/bin/sh

#while [ `getprop sys.boot_completed` = 0 ]
while [ `getprop init.svc.bootanim` != "stopped" ]
do
sleep 2
done
cp -f `dumpsys package me.piebridge.brevent | grep legacyNativeLibraryDir | cut -b 28-`/*/libbrevent.so /data/local/tmp/brevent
if [ -f /system/bin/app_process64 ]
then
ln -sf /system/bin/app_process64 /data/local/tmp/app_process
else
ln -sf /system/bin/app_process32 /data/local/tmp/app_process
fi
export PATH=/data/local/tmp:$PATH
exec /data/local/tmp/brevent
