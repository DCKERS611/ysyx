#!/usr/bin/ebv bash

marco() {
	save_curr_dir="$PWD"
}

polo() {
    if [ "$save_curr_dir" ]; then
        cd "$save_curr_dir" || return
    else
        echo "marco hasnt been excute , return error" >&2
    fi
}
