; Unidentified routine.
CODE_9BA342:
	sta.l $7E3420,x
CODE_9BA346:
	ldy.w $0ADB
	beq CODE_9BA352
CODE_9BA34B:
	jsl.l CODE_9BA355
	dey
	bne CODE_9BA34B
CODE_9BA352:
	jmp.w CODE_9BA293
