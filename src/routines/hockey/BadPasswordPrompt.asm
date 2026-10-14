; Bad password: wait for a button, then offer retry or exit
BadPasswordPrompt:
	jsl.l DecodePW
	lda.l $7E34D0
	bpl CODE_9BCAF7
.loop:
	lda.w JoyPad
	bit.w #$4000
	bne .loop
	bit.w #$8080
	bne .loop
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #BadPassword
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
	jsl.l QueueTextDMA
.loop2:
	jsl.l ReadPads
	jsl.l Readjoy1
	lda.b d3
	beq .loop2
	bit.w #$4000
	bne .t1
	bit.w #$8080
	beq .loop2
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
	jsr.w PrintPasswordHelp
	jsl.l QueueTextDMA
	jsl.l WaitNoButtons
	jmp.w CODE_9BC946

.t1:
	lda.w #$0002
	sta.l $7E34BC
	jml.l Restart
