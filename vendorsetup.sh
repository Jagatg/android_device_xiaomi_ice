# Automatically apply the netbpfload patch for Xiaomi ice.
(
    TOP="$(gettop)"
    PATCH="$TOP/device/xiaomi/ice/patches/0001-netbpfload-Skip-BPF-array-map-write-test.patch"
    TARGET="$TOP/packages/modules/Connectivity"

    if [ ! -f "$PATCH" ]; then
        echo "[ice-patches] ERROR: netbpfload patch not found."
    elif [ ! -d "$TARGET/.git" ] && [ ! -f "$TARGET/.git" ]; then
        echo "[ice-patches] ERROR: Connectivity repository not found."
    elif git -C "$TARGET" apply --reverse --check "$PATCH" >/dev/null 2>&1; then
        echo "[ice-patches] netbpfload patch already applied."
    elif git -C "$TARGET" apply --check "$PATCH" >/dev/null 2>&1; then
        if git -C "$TARGET" apply "$PATCH"; then
            echo "[ice-patches] Successfully applied netbpfload patch."
        else
            echo "[ice-patches] ERROR: Failed to apply netbpfload patch."
        fi
    else
        echo "[ice-patches] ERROR: Cannot apply netbpfload patch."
        echo "[ice-patches] Check for conflicting changes in NetBpfLoad.cpp."
    fi
)

# Automatically apply the Composer resources v34 patch for Xiaomi ice.
(
    TOP="$(gettop)"
    PATCH="$TOP/device/xiaomi/ice/patches/0002-composer-resources-v34.patch"
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
