#!/bin/sh
# Runner ⇒ TARGETS Runner ⇒ Build Settings ⇒ Packaging ⇒ Info.plist Files の
# Debug/Profile/Release 設定によりリソース切替
if [ ${INFOPLIST_FILE} = "Runner/ponsyukey_selectable_resources/Info-debug.plist" ]; then
    echo "DEBUG Resource copy"
    INFO_PLIST_FROM="${PROJECT_DIR}/Runner/ponsyukey_selectable_resources/Info-debug.plist"
    INFO_PLIST_TO="${PROJECT_DIR}/Runner/Info.plist"
    cp "${INFO_PLIST_FROM}" "${INFO_PLIST_TO}"
    echo "cp ${INFO_PLIST_FROM} ${INFO_PLIST_TO}"
fi
if [ ${INFOPLIST_FILE} = "Runner/ponsyukey_selectable_resources/Info-profile.plist" ]; then
    echo "PROFILE Resource copy"
    INFO_PLIST_FROM="${PROJECT_DIR}/Runner/ponsyukey_selectable_resources/Info-profile.plist"
    INFO_PLIST_TO="${PROJECT_DIR}/Runner/Info.plist"
    cp "${INFO_PLIST_FROM}" "${INFO_PLIST_TO}"
    echo "cp ${INFO_PLIST_FROM} ${INFO_PLIST_TO}"
fi
if [ ${INFOPLIST_FILE} = "Runner/ponsyukey_selectable_resources/Info-release.plist" ]; then
    echo "RELEASE Resource copy"
    INFO_PLIST_FROM="${PROJECT_DIR}/Runner/ponsyukey_selectable_resources/Info-release.plist"
    INFO_PLIST_TO="${PROJECT_DIR}/Runner/Info.plist"
    cp "${INFO_PLIST_FROM}" "${INFO_PLIST_TO}"
    echo "cp ${INFO_PLIST_FROM} ${INFO_PLIST_TO}"
fi
