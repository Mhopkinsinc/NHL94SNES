; Unidentified routine.
CODE_9FF4D8:
	sep #$20
	stz.w CGADD
	lda.b #$FF
	sta.w CGDATA
	sta.w CGDATA
	rep #$20
	lda.w #DATA8_9AEE1C
	sta.b $0C
	lda.w #$009A
	sta.b $0E
	ldy.w #$0030
	ldx.w #$0010
	jsl.l DMAToCGRAM
	ldy.w #$00B0
	ldx.w #$0010
	jsl.l DMAToCGRAM
	lda.w #DATA8_9AEE3C
	sta.b $0C
	lda.w #$009A
	sta.b $0E
	ldy.w #$0040
	ldx.w #$0010
	jsl.l DMAToCGRAM
	ldy.w #$00C0
	ldx.w #$0010
	jsl.l DMAToCGRAM
	lda.w #$FFFF
	ldx.w #$000F
	ldy.w #$0020
	jsl.l CODE_9FF9F5
	lda.w #$FFFF
	ldx.w #$000F
	ldy.w #$0010
	jsl.l CODE_9FF9F5
	ldx.w #$0000
	lda.w #$0000
.loop:
	sta.l $7F4000,x
	inx
	inx
	cpx.w #$4000
	bcc .loop
	lda.w #DATA8_949A00
	sta.b $0C
	lda.w #$0094
	sta.b $0E
	lda.w #$8010
	sta.b $10
	lda.w #$007F
	sta.b $12
	jsl.l Decompress
	lda.w #DATA8_9ADC8D
	sta.b $0C
	lda.w #$009A
	sta.b $0E
	lda.w #$4000
	sta.b $10
	lda.w #$007F
	sta.b $12
	jsl.l Decompress
	stz.w VMADDL
	sep #$20
	lda.b #$80
	sta.w VMAIN
	ldy.w #$4000
	ldx.w #$0000
.loop2:
	lda.l $7F4006,x
	sta.w VMDATAL
	lda.l $7F8010,x
	sta.w VMDATAH
	inx
	dey
	bne .loop2
	rep #$20
	ldx.w #$1C00
	ldy.w #$0000
	sep #$20
.loop3:
	lda.l $7F4000,x
	phx
	tyx
	sta.l $7F4040,x
	plx
	iny
	lda.l $7F8010,x
	phx
	tyx
	sta.l $7F4040,x
	plx
	inx
	iny
	cpy.w #$0A00
	bmi .loop3
	rep #$20
	lda.w #DATA8_94F8EC
	sta.b $0C
	lda.w #$0094
	sta.b $0E
	lda.w #$4A40
	sta.b $10
	lda.w #$007F
	sta.b $12
	jsl.l Decompress
	rts
