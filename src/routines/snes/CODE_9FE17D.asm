; Unidentified routine.
CODE_9FE17D:
	jsl.l SpriteFrameStart
	jsl.l CODE_9FBAAA
	jsl.l WaitFrame
	jsl.l SpriteFrameEnd
	lda.w #$0002
	sta.w $0ADB
	lda.w #$FFFF
	sta.l $7F76DE
	sta.l $7F76FE
CODE_9FE19E:
	jsl.l CODE_9FEA24
	jsl.l CODE_9FE618
	lda.b $B1
	bit.w #$1000
	beq CODE_9FE1B0
	jmp.w DATA8_80E73D
