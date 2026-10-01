#!/bin/sh
set -eu

game=${1:-./ex19}
test_dir=$(mktemp -d)
trap 'rm -f "$test_dir/input" "$test_dir/output"; rmdir "$test_dir"' 0 HUP INT TERM

expect()
{
    if ! grep -Fq "$2" "$test_dir/output"; then
        printf 'FAIL %s: expected "%s"\n' "$1" "$2" >&2
        sed -n '1,120p' "$test_dir/output" >&2
        exit 1
    fi
}

"$game" < /dev/null > "$test_dir/output"
expect eof "The great hall."

printf 'n\nw\na\nq\n' | "$game" > "$test_dir/output"
expect pipe "The throne room."
expect pipe "The arena."
expect pipe "You attack The evil minotaur!"
expect pipe "Giving up?"

printf 'l\ne\nx\nq\n' > "$test_dir/input"
"$game" < "$test_dir/input" > "$test_dir/output"
expect file "You can go:"
expect file "NORTH"
expect file "You can't go that direction."
expect file "What?: 120"

printf 'q' | "$game" > "$test_dir/output"
expect no_newline "Giving up?"

printf 'ex19 tests passed\n'
