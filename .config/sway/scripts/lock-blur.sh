#!/bin/bash

# Tüm outputları al ve her biri için screenshot + blur
for output in $(swaymsg -t get_outputs | jq -r '.[].name'); do
    grim -o "$output" "/tmp/lock_${output}.png"
    magick "/tmp/lock_${output}.png" -blur 0x19 "/tmp/lock_${output}_blur.png"
done

# Swaylock komutunu oluştur
CMD="swaylock"
for output in $(swaymsg -t get_outputs | jq -r '.[].name'); do
    CMD="$CMD -i ${output}:/tmp/lock_${output}_blur.png"
done

# Çalıştır
$CMD
