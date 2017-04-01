#!/system/bin/sh

brevent=me.piebridge.brevent
lnld=`dumpsys package $brevent | grep legacyNativeLibraryDir`
if [ x"$lnld" == x"" ]; then
    echo "please install $brevent" >&2
    exit 1
else
    lib=`echo $lnld | dd bs=1 skip=23 2>/dev/null`
    path=`ls $lib/*/libbrevent.so`
    if [ ! -f "$path" ]; then
        echo "please install latest $brevent" >&2
        exit 1
    else
        echo "exec $path"
        exec $path
        exit 0
    fi
fi
