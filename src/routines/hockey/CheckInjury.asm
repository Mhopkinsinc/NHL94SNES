; Once a second, count down to the next injury and show it when the count reaches zero
CheckInjury:
	dec.w InjCntDown
	bne .t1
	jmp.w ShowInjuryBox

.t1:
	rtl
