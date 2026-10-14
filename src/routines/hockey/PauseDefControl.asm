; Pause menu: toggle defensive control
PauseDefControl:
	lda.b d1
	bit.w #$8380
	beq CODE_9FE42E
	jsl.l CODE_9FC76C
	ldy.b a2
	lda.w $1C94,y
	eor.w #$0001
	sta.w $1C94,y
CODE_9FE42E:
	jmp.w CODE_9FE19E
