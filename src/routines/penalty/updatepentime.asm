; Once a second, count down the penalty box times. The clock-stopped flag chooses the path.
updatepentime:
	lda.w #$0020
	trb.w sflags3
	lda.w gmclock
	beq CODE_9EBF52
	jmp.w CODE_80BFDD
