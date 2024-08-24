#!/bin/bash

fg=c0caf5ff
bg=1f2335ff
dark3=545c7e66
green1=73dacaff
red=f7768eff
font="JetBrainsMono Nerd Font Mono"
fontSize=16

i3lock -c $bg \
	--screen=1 \
	--force-clock \
	--radius 70 \
	--ring-width 6 \
	--inside-color $bg \
	--ring-color $dark3 \
	--insidever-color $bg \
	--ringver-color $green1 \
	--insidewrong-color $bg \
	--ringwrong-color $red \
	--line-color $bg \
	--keyhl-color $green1 \
	--bshl-color $red \
	--separator-color $bg \
	--verif-color $green1 \
	--wrong-color $red \
	--modif-color $green1 \
	--verif-text '' \
	--wrong-text '' \
	--noinput-text '' \
	--lock-text '' \
	--lockfailed-text '' \
	--greeter-text  \
	--greeter-font "$font" \
	--greeter-size 64 \
	--greeter-color $dark3 \
	--greeter-pos="ix:iy+19" \
	--date-color $dark3 \
	--date-font $font \
	--date-size $fontSize \
	--date-pos="tx:ty+26" \
	--date-str="%A, %B %d" \
	--time-color $dark3 \
	--time-font $font \
	--time-size $fontSize \
	--time-pos="ix:iy*1.75" \
	--time-str="%H:%M"
