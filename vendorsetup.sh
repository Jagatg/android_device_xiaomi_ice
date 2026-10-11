# Automatically apply the netbpfload patch for Xiaomi ice.
(
    TOP="$(gettop)"
    PATCH="$TOP/device/xiaomi/ice/patches/packages/modules/Connectivity/netbpfload/0001-netbpfload-Skip-BPF-array-map-write-test.patch"
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
