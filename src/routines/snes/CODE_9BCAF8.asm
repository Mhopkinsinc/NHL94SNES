; Unidentified routine.
CODE_9BCAF8:
	jsl.l CODE_9BCD28
	lda.l $7E34D0
	bpl CODE_9BCAF7
CODE_9BCB02:
	lda.w JoyPad
	bit.w #$4000
	bne CODE_9BCB02
	bit.w #$8080
	bne CODE_9BCB02
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF236
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF24A
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF25E
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF272
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l CODE_9FBF75
CODE_9BCB7B:
	jsl.l CODE_9B8017
	jsl.l CODE_9B84F5
	lda.b d3
	beq CODE_9BCB7B
	bit.w #$4000
	bne CODE_9BCBCD
	bit.w #$8080
	beq CODE_9BCB7B
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF282
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$000F
	sta.b d0
	lda.w #$0003
	sta.b d1
	lda.l $7E35D0
	sta.b d2
	jsl.l eraser
	jsr.w CODE_9BCBD8
	jsl.l CODE_9FBF75
	jsl.l CODE_8085FF
	jmp.w CODE_9BC946
