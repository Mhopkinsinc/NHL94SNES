; Unidentified routine.
CODE_9FB901:
	jsl.l .t1
	lda.w #$007E
	sta.b $0E
	lda.w #$35F4
	sta.b $0C
	ldy.w #$0000
	ldx.w #$0100
	jsl.l DMAToCGRAM
	rtl

.t1:
	phx
	phy
	lda.w HomeTeam
	asl a
	asl a
	asl a
	asl a
	asl a
	clc
	adc.w #$CD4E
	sta.b $0C
	lda.w #$0096
	sta.b $0E
	lda.w #$007E
	sta.b $12
	lda.w #$3774
	sta.b $10
	ldx.w #$0020
	jsl.l MemCopy
	lda.w #$007E
	sta.b $12
	lda.w #$3634
	sta.b $10
	ldx.w #$0020
	jsl.l MemCopy
	lda.w VisTeam
	asl a
	asl a
	asl a
	asl a
	asl a
	clc
	adc.w #$C9CE
	sta.b $0C
	lda.w #$0096
	sta.b $0E
	lda.w #$007E
	sta.b $12
	lda.w #$3794
	sta.b $10
	ldx.w #$0020
	jsl.l MemCopy
	lda.w #$007E
	sta.b $12
	lda.w #$3654
	sta.b $10
	ldx.w #$0020
	jsl.l MemCopy
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9ACEB6
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$3734
	sta.b $10
	ldx.w #$0020
	jsl.l MemCopy
	ply
	plx
	rtl
