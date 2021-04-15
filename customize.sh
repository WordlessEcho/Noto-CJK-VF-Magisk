# Fork from https://github.com/simonsmh/notocjk/blob/master/customize.sh
[ -x "$(which magisk)" ] && MIRRORPATH=$(magisk --path)/.magisk/mirror || unset MIRRORPATH
FILES="fonts.xml fonts_base.xml"
FILEPATH=/system/etc/
FONTPATH=/system/fonts/
SANSNAME=NotoSansCJK-VF-Android.ttc
SERIFNAME=NotoSerifCJK-Android.ttc
CHECKSUM=$SERIFNAME.sha256
REALSUM=$SERIFNAME.caculated.sha256
TIMES=0

for FILE in $FILES
do
    if [ "$API" -ge "26" ] && [ -f $MIRRORPATH$FILEPATH$FILE ]; then
        TIMES=$((TIMES+1))
        if [ "$API" -ge "28" ]; then
            if [ ! -f $MODPATH$FONTPATH$SERIFNAME ]; then
                ui_print "- Merging $SERIFNAME"
                cat $MODPATH$FONTPATH$SERIFNAME.part* > $MODPATH$FONTPATH$SERIFNAME
                sha256sum $MODPATH$FONTPATH$SERIFNAME | awk '{print $1}' > $MODPATH$FONTPATH$REALSUM

                if ! cmp -s $MODPATH$FONTPATH$CHECKSUM $MODPATH$FONTPATH$REALSUM; then
                    abort "! File corrupted. Please re-download this module"
                else
                    ui_print "- cleaning caches"
                    rm $MODPATH$FONTPATH$SERIFNAME.* 2> /dev/null
                fi
            fi

            ui_print "- Migrating $FILE"
            mkdir -p $MODPATH$FILEPATH
            cp -af $MIRRORPATH$FILEPATH$FILE $MODPATH$FILEPATH$FILE

            sed -i '
            /<family lang=\"zh-Hans\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
            s/<family lang=\"zh-Hans\">.*Noto.*CJK.*<\/family>/<family lang="zh-Hans">\n        <font weight="100" style="normal" index="3">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="100.0" \/>\n        <\/font>\n        <font weight="300" style="normal" index="3">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="300.0" \/>\n        <\/font>\n        <font weight="350" style="normal" index="3">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="350.0" \/>\n        <\/font>\n        <font weight="400" style="normal" index="3">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="400.0" \/>\n        <\/font>\n        <font weight="500" style="normal" index="3">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="500.0" \/>\n        <\/font>\n        <font weight="700" style="normal" index="3">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="700.0" \/>\n        <\/font>\n        <font weight="900" style="normal" index="3">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="900.0" \/>\n        <\/font>\n\n        <font weight="200" style="normal" index="2" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="300" style="normal" index="6" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="400" style="normal" index="10" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="500" style="normal" index="14" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="600" style="normal" index="18" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="700" style="normal" index="22" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="900" style="normal" index="26" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n    <\/family>/};
            ' $MODPATH$FILEPATH$FILE

            sed -i '
            /<family lang=\"zh-Hant\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
            s/<family lang=\"zh-Hant\">.*Noto.*CJK.*<\/family>/<family lang="zh-Hant">\n        <font weight="100" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="100.0" \/>\n        <\/font>\n        <font weight="300" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="300.0" \/>\n        <\/font>\n        <font weight="350" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="350.0" \/>\n        <\/font>\n        <font weight="400" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="400.0" \/>\n        <\/font>\n        <font weight="500" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="500.0" \/>\n        <\/font>\n        <font weight="700" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="700.0" \/>\n        <\/font>\n        <font weight="900" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="900.0" \/>\n        <\/font>\n\n        <font weight="200" style="normal" index="3" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="300" style="normal" index="7" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="400" style="normal" index="11" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="500" style="normal" index="15" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="600" style="normal" index="19" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="700" style="normal" index="23" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="900" style="normal" index="27" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n    <\/family>/};
            ' $MODPATH$FILEPATH$FILE

            sed -i '
            /<family lang=\"zh-Bopo\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
            s/<family lang=\"zh-Bopo\">.*Noto.*CJK.*<\/family>/<family lang="zh-Bopo">\n        <font weight="100" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="100.0" \/>\n        <\/font>\n        <font weight="300" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="300.0" \/>\n        <\/font>\n        <font weight="350" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="350.0" \/>\n        <\/font>\n        <font weight="400" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="400.0" \/>\n        <\/font>\n        <font weight="500" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="500.0" \/>\n        <\/font>\n        <font weight="700" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="700.0" \/>\n        <\/font>\n        <font weight="900" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="900.0" \/>\n        <\/font>\n\n        <font weight="200" style="normal" index="3" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="300" style="normal" index="7" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="400" style="normal" index="11" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="500" style="normal" index="15" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="600" style="normal" index="19" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="700" style="normal" index="23" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="900" style="normal" index="27" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n    <\/family>/};
            ' $MODPATH$FILEPATH$FILE

            sed -i '
            /<family lang=\"zh-Hant zh-Bopo\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
            s/<family lang=\"zh-Hant zh-Bopo\">.*Noto.*CJK.*<\/family>/<family lang="zh-Hant zh-Bopo">\n        <font weight="100" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="100.0" \/>\n        <\/font>\n        <font weight="300" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="300.0" \/>\n        <\/font>\n        <font weight="350" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="350.0" \/>\n        <\/font>\n        <font weight="400" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="400.0" \/>\n        <\/font>\n        <font weight="500" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="500.0" \/>\n        <\/font>\n        <font weight="700" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="700.0" \/>\n        <\/font>\n        <font weight="900" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="900.0" \/>\n        <\/font>\n\n        <font weight="200" style="normal" index="3" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="300" style="normal" index="7" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="400" style="normal" index="11" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="500" style="normal" index="15" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="600" style="normal" index="19" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="700" style="normal" index="23" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="900" style="normal" index="27" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n    <\/family>/};
            ' $MODPATH$FILEPATH$FILE

            sed -i '
            /<family lang=\"zh-Hant,zh-Bopo\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
            s/<family lang=\"zh-Hant,zh-Bopo\">.*Noto.*CJK.*<\/family>/<family lang="zh-Hant,zh-Bopo">\n        <font weight="100" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="100.0" \/>\n        <\/font>\n        <font weight="300" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="300.0" \/>\n        <\/font>\n        <font weight="350" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="350.0" \/>\n        <\/font>\n        <font weight="400" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="400.0" \/>\n        <\/font>\n        <font weight="500" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="500.0" \/>\n        <\/font>\n        <font weight="700" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="700.0" \/>\n        <\/font>\n        <font weight="900" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="900.0" \/>\n        <\/font>\n\n        <font weight="200" style="normal" index="3" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="300" style="normal" index="7" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="400" style="normal" index="11" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="500" style="normal" index="15" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="600" style="normal" index="19" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="700" style="normal" index="23" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="900" style="normal" index="27" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n    <\/family>/};
            ' $MODPATH$FILEPATH$FILE

            sed -i '
            /<family lang=\"ja\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
            s/<family lang=\"ja\">.*Noto.*CJK.*<\/family>/<family lang="ja">\n        <font weight="100" style="normal" index="1">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="100.0" \/>\n        <\/font>\n        <font weight="300" style="normal" index="1">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="300.0" \/>\n        <\/font>\n        <font weight="350" style="normal" index="1">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="350.0" \/>\n        <\/font>\n        <font weight="400" style="normal" index="1">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="400.0" \/>\n        <\/font>\n        <font weight="500" style="normal" index="1">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="500.0" \/>\n        <\/font>\n        <font weight="700" style="normal" index="1">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="700.0" \/>\n        <\/font>\n        <font weight="900" style="normal" index="1">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="900.0" \/>\n        <\/font>\n\n        <font weight="200" style="normal" index="0" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="300" style="normal" index="4" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="400" style="normal" index="8" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="500" style="normal" index="12" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="600" style="normal" index="16" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="700" style="normal" index="20" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="900" style="normal" index="24" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n    <\/family>/};
            ' $MODPATH$FILEPATH$FILE

            sed -i '
            /<family lang=\"ko\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
            s/<family lang=\"ko\">.*Noto.*CJK.*<\/family>/<family lang="ko">\n        <font weight="100" style="normal" index="2">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="100.0" \/>\n        <\/font>\n        <font weight="300" style="normal" index="2">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="300.0" \/>\n        <\/font>\n        <font weight="350" style="normal" index="2">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="350.0" \/>\n        <\/font>\n        <font weight="400" style="normal" index="2">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="400.0" \/>\n        <\/font>\n        <font weight="500" style="normal" index="2">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="500.0" \/>\n        <\/font>\n        <font weight="700" style="normal" index="2">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="700.0" \/>\n        <\/font>\n        <font weight="900" style="normal" index="2">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="900.0" \/>\n        <\/font>\n\n        <font weight="200" style="normal" index="1" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="300" style="normal" index="5" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="400" style="normal" index="9" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="500" style="normal" index="13" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="600" style="normal" index="17" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="700" style="normal" index="21" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n        <font weight="900" style="normal" index="25" fallbackFor="serif">NotoSerifCJK-Android.ttc<\/font>\n    <\/family>/};
            ' $MODPATH$FILEPATH$FILE
        else
            if [ -f $MODPATH$FONTPATH$CHECKSUM ]; then
                ui_print "- Your Android is lower than 9.0(Pie) that doesn't support fallbackFor. Install $SANSNAME only."
                rm $MODPATH$FONTPATH$SERIFNAME.*
            fi

            ui_print "- Migrating $FILE"
            mkdir -p $MODPATH$FILEPATH
            cp -af $MIRRORPATH$FILEPATH$FILE $MODPATH$FILEPATH$FILE

            sed -i '
            /<family lang=\"zh-Hans\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
            s/<family lang=\"zh-Hans\">.*Noto.*CJK.*<\/family>/<family lang="zh-Hans">\n        <font weight="100" style="normal" index="3">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="100.0" \/>\n        <\/font>\n        <font weight="300" style="normal" index="3">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="300.0" \/>\n        <\/font>\n        <font weight="350" style="normal" index="3">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="350.0" \/>\n        <\/font>\n        <font weight="400" style="normal" index="3">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="400.0" \/>\n        <\/font>\n        <font weight="500" style="normal" index="3">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="500.0" \/>\n        <\/font>\n        <font weight="700" style="normal" index="3">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="700.0" \/>\n        <\/font>\n        <font weight="900" style="normal" index="3">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="900.0" \/>\n        <\/font>\n    <\/family>/};
            ' $MODPATH$FILEPATH$FILE

            sed -i '
            /<family lang=\"zh-Hant\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
            s/<family lang=\"zh-Hant\">.*Noto.*CJK.*<\/family>/<family lang="zh-Hant">\n        <font weight="100" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="100.0" \/>\n        <\/font>\n        <font weight="300" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="300.0" \/>\n        <\/font>\n        <font weight="350" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="350.0" \/>\n        <\/font>\n        <font weight="400" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="400.0" \/>\n        <\/font>\n        <font weight="500" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="500.0" \/>\n        <\/font>\n        <font weight="700" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="700.0" \/>\n        <\/font>\n        <font weight="900" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="900.0" \/>\n        <\/font>\n    <\/family>/};
            ' $MODPATH$FILEPATH$FILE

            sed -i '
            /<family lang=\"zh-Bopo\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
            s/<family lang=\"zh-Bopo\">.*Noto.*CJK.*<\/family>/<family lang="zh-Bopo">\n        <font weight="100" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="100.0" \/>\n        <\/font>\n        <font weight="300" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="300.0" \/>\n        <\/font>\n        <font weight="350" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="350.0" \/>\n        <\/font>\n        <font weight="400" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="400.0" \/>\n        <\/font>\n        <font weight="500" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="500.0" \/>\n        <\/font>\n        <font weight="700" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="700.0" \/>\n        <\/font>\n        <font weight="900" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="900.0" \/>\n        <\/font>\n    <\/family>/};
            ' $MODPATH$FILEPATH$FILE

            sed -i '
            /<family lang=\"zh-Hant zh-Bopo\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
            s/<family lang=\"zh-Hant zh-Bopo\">.*Noto.*CJK.*<\/family>/<family lang="zh-Hant zh-Bopo">\n        <font weight="100" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="100.0" \/>\n        <\/font>\n        <font weight="300" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="300.0" \/>\n        <\/font>\n        <font weight="350" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="350.0" \/>\n        <\/font>\n        <font weight="400" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="400.0" \/>\n        <\/font>\n        <font weight="500" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="500.0" \/>\n        <\/font>\n        <font weight="700" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="700.0" \/>\n        <\/font>\n        <font weight="900" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="900.0" \/>\n        <\/font>\n    <\/family>/};
            ' $MODPATH$FILEPATH$FILE

            sed -i '
            /<family lang=\"zh-Hant,zh-Bopo\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
            s/<family lang=\"zh-Hant,zh-Bopo\">.*Noto.*CJK.*<\/family>/<family lang="zh-Hant,zh-Bopo">\n        <font weight="100" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="100.0" \/>\n        <\/font>\n        <font weight="300" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="300.0" \/>\n        <\/font>\n        <font weight="350" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="350.0" \/>\n        <\/font>\n        <font weight="400" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="400.0" \/>\n        <\/font>\n        <font weight="500" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="500.0" \/>\n        <\/font>\n        <font weight="700" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="700.0" \/>\n        <\/font>\n        <font weight="900" style="normal" index="4">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="900.0" \/>\n        <\/font>\n    <\/family>/};
            ' $MODPATH$FILEPATH$FILE

            sed -i '
            /<family lang=\"ja\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
            s/<family lang=\"ja\">.*Noto.*CJK.*<\/family>/<family lang="ja">\n        <font weight="100" style="normal" index="1">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="100.0" \/>\n        <\/font>\n        <font weight="300" style="normal" index="1">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="300.0" \/>\n        <\/font>\n        <font weight="350" style="normal" index="1">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="350.0" \/>\n        <\/font>\n        <font weight="400" style="normal" index="1">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="400.0" \/>\n        <\/font>\n        <font weight="500" style="normal" index="1">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="500.0" \/>\n        <\/font>\n        <font weight="700" style="normal" index="1">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="700.0" \/>\n        <\/font>\n        <font weight="900" style="normal" index="1">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="900.0" \/>\n        <\/font>\n    <\/family>/};
            ' $MODPATH$FILEPATH$FILE

            sed -i '
            /<family lang=\"ko\">/,/<\/family>/ {:a;N;/<\/family>/!ba;
            s/<family lang=\"ko\">.*Noto.*CJK.*<\/family>/<family lang="ko">\n        <font weight="100" style="normal" index="2">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="100.0" \/>\n        <\/font>\n        <font weight="300" style="normal" index="2">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="300.0" \/>\n        <\/font>\n        <font weight="350" style="normal" index="2">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="350.0" \/>\n        <\/font>\n        <font weight="400" style="normal" index="2">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="400.0" \/>\n        <\/font>\n        <font weight="500" style="normal" index="2">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="500.0" \/>\n        <\/font>\n        <font weight="700" style="normal" index="2">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="700.0" \/>\n        <\/font>\n        <font weight="900" style="normal" index="2">NotoSansCJK-VF-Android.ttc\n            <axis tag="wght" stylevalue="900.0" \/>\n        <\/font>\n    <\/family>/};
            ' $MODPATH$FILEPATH$FILE
        fi
    fi
done

if [ "$TIMES" -lt "1" ]; then
    abort "! Migration FAILED. Or your Android version is lower than 8.0(Oreo). Nothing have done to your system."
fi
