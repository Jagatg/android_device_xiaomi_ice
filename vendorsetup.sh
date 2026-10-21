
# Automatically apply the Composer resources v34 patch for Xiaomi ice.
(
    TOP="$(gettop)"
    PATCH="$TOP/device/xiaomi/ice/patches/0001-composer-resources-v34.patch"
    TARGET="$TOP/hardware/interfaces"

    if [ ! -f "$PATCH" ]; then
        echo "[ice-patches] ERROR: Composer patch not found."
    elif [ ! -d "$TARGET/.git" ] && [ ! -f "$TARGET/.git" ]; then
        echo "[ice-patches] ERROR: hardware/interfaces repository not found."
    elif git -C "$TARGET" apply --reverse --check "$PATCH" >/dev/null 2>&1; then
        echo "[ice-patches] Composer resources v34 patch already applied."
    elif git -C "$TARGET" apply --check "$PATCH" >/dev/null 2>&1; then
        if git -C "$TARGET" apply "$PATCH"; then
            echo "[ice-patches] Successfully applied Composer resources v34 patch."
        else
            echo "[ice-patches] ERROR: Failed to apply Composer patch."
        fi
    else
        echo "[ice-patches] ERROR: Cannot apply Composer patch."
        echo "[ice-patches] Check for conflicting changes in Composer Android.bp files."
    fi
)

# Automatically apply the GNSS AIDL default Android.bp patch for Xiaomi ice.
(
    TOP="$(gettop)"
    PATCH="$TOP/device/xiaomi/ice/patches/0002-GNSS-aidl-Remove-default-Android.bp.patch"
    TARGET="$TOP/hardware/interfaces"

    if [ ! -f "$PATCH" ]; then
        echo "[ice-patches] ERROR: GNSS patch not found."
    elif [ ! -d "$TARGET/.git" ] && [ ! -f "$TARGET/.git" ]; then
        echo "[ice-patches] ERROR: hardware/interfaces repository not found."
    elif git -C "$TARGET" apply --reverse --check "$PATCH" >/dev/null 2>&1; then
        echo "[ice-patches] GNSS AIDL patch already applied."
    elif git -C "$TARGET" apply --check "$PATCH" >/dev/null 2>&1; then
        if git -C "$TARGET" apply "$PATCH"; then
            echo "[ice-patches] Successfully applied GNSS AIDL patch."
        else
            echo "[ice-patches] ERROR: Failed to apply GNSS AIDL patch."
        fi
    else
        echo "[ice-patches] ERROR: Cannot apply GNSS AIDL patch."
        echo "[ice-patches] Check for conflicting changes in GNSS AIDL Android.bp."
    fi
)

# Automatically apply the Wi-Fi VINTF duplicate definitions patch for Xiaomi ice.
(
    TOP="$(gettop)"
    PATCH="$TOP/device/xiaomi/ice/patches/0003-wpa_hotpad-Remove-duplicate-WiFi-VINTF-fragments.patch"
    TARGET="$TOP/external/wpa_supplicant_8"

    if [ ! -f "$PATCH" ]; then
        echo "[ice-patches] ERROR: Wi-Fi VINTF patch not found."
    elif [ ! -d "$TARGET/.git" ] && [ ! -f "$TARGET/.git" ]; then
        echo "[ice-patches] ERROR: wpa_supplicant_8 repository not found."
    elif git -C "$TARGET" apply --reverse --check "$PATCH" >/dev/null 2>&1; then
        echo "[ice-patches] Wi-Fi VINTF patch already applied."
    elif git -C "$TARGET" apply --check "$PATCH" >/dev/null 2>&1; then
        if git -C "$TARGET" apply "$PATCH"; then
            echo "[ice-patches] Successfully applied Wi-Fi VINTF patch."
        else
            echo "[ice-patches] ERROR: Failed to apply Wi-Fi VINTF patch."
        fi
    else
        echo "[ice-patches] ERROR: Cannot apply Wi-Fi VINTF patch."
        echo "[ice-patches] Check for conflicting Android.bp changes."
    fi
)

# Automatically apply the Wi-Fi supplicant VINTF duplicate definition patch for Xiaomi ice.
(
    TOP="$(gettop)"
    PATCH="$TOP/device/xiaomi/ice/patches/0004-wpa_supplicant-Remove-duplicate-Supplicant-VINTF-fragment.patch"
    TARGET="$TOP/external/wpa_supplicant_8"

    if [ ! -f "$PATCH" ]; then
        echo "[ice-patches] ERROR: Wi-Fi supplicant VINTF patch not found."
    elif [ ! -d "$TARGET/.git" ] && [ ! -f "$TARGET/.git" ]; then
        echo "[ice-patches] ERROR: wpa_supplicant_8 repository not found."
    elif git -C "$TARGET" apply --reverse --check "$PATCH" >/dev/null 2>&1; then
        echo "[ice-patches] Wi-Fi supplicant VINTF patch already applied."
    elif git -C "$TARGET" apply --check "$PATCH" >/dev/null 2>&1; then
        if git -C "$TARGET" apply "$PATCH"; then
            echo "[ice-patches] Successfully applied Wi-Fi supplicant VINTF patch."
        else
            echo "[ice-patches] ERROR: Failed to apply Wi-Fi supplicant VINTF patch."
        fi
    else
        echo "[ice-patches] ERROR: Cannot apply Wi-Fi supplicant VINTF patch."
        echo "[ice-patches] Check for conflicting wpa_supplicant/aidl/vendor/Android.bp changes."
    fi
)

# Automatically apply the clean_headers sched_param patch for Xiaomi ice.
(
    TOP="$(gettop)"
    PATCH="$TOP/device/xiaomi/ice/patches/0005-clean-headers-sched-types.patch"
    TARGET="$TOP/vendor/lineage"

    if [ ! -f "$PATCH" ]; then
        echo "[ice-patches] ERROR: Clean headers patch not found."
    elif [ ! -d "$TARGET/.git" ] && [ ! -f "$TARGET/.git" ]; then
        echo "[ice-patches] ERROR: vendor/lineage repository not found."
    elif git -C "$TARGET" apply --reverse --check "$PATCH" >/dev/null 2>&1; then
        echo "[ice-patches] Clean headers patch already applied."
    elif git -C "$TARGET" apply --check "$PATCH" >/dev/null 2>&1; then
        if git -C "$TARGET" apply "$PATCH"; then
            echo "[ice-patches] Successfully applied clean headers patch."
        else
            echo "[ice-patches] ERROR: Failed to apply clean headers patch."
        fi
    else
        echo "[ice-patches] ERROR: Cannot apply clean headers patch."
        echo "[ice-patches] Check for conflicting tools/clean_headers.sh changes."
    fi
)
