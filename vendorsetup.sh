
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
