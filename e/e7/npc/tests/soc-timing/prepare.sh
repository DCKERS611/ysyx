#!/bin/bash
set -euo pipefail
export AM_HOME=/home/ysyx/ysyx-workbench/abstract-machine
export BENCH_HOME=/home/ysyx/ysyx-workbench/archbench
root=/home/ysyx/ysyx-workbench
out="$root/npc/build/verification/current-csr-k12-20261105"
for entry in "1 25" "12 300"; do
 read -r ratio freq <<< "$entry"
 touch "$AM_HOME/am/src/riscv/npc/timer.c"
 for app in hello rtc blockchain; do
  case "$app" in
   hello) dir="$root/am-kernels/kernels/hello"; name=hello; args=K12_VALIDATE ;;
   rtc) dir="$root/npc/tests/soc-timing"; name=soc-uptime; args= ;;
   blockchain) dir="$BENCH_HOME/bench/100.blockchain"; name=blockchain; args=train ;;
  esac
  make -s -C "$dir" ARCH=minirv-ysyxsoc NPC_CPU_FREQ_MHZ="$freq" mainargs="$args" insert-arg > "$out/build-$app-k$ratio.log" 2>&1
  cp "$dir/build/$name-minirv-ysyxsoc.bin" "$out/$app-k$ratio.bin"
  printf 'Prepared %s k=%s frequency=%s MHz\n' "$app" "$ratio" "$freq"
 done
done
