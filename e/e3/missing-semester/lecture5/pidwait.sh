  pidwait() {
    if [ -z "$1" ]; then
        echo "用法: pidwait <pid>" >&2
        return 1
    fi

    local pid="$1"

    while kill -0 "$pid" 2>/dev/null; do
        sleep 1
    done
}
