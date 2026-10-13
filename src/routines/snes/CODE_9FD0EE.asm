; Unidentified routine.
CODE_9FD0EE:
	pla
	eor.w #$000F
	clc
	adc.w #$000F
	lsr a
	sta.w $1343,x
CODE_9FD0FA:
	ldy.w #$0003
	lda.b [$89],y
	and.w #$0007
	sta.b $00
	asl a
	asl a
	adc.b $00
	lsr a
	ldy.w #$0004
	jsl.l CODE_9FD22B
	sta.w $1363,x
	ldy.w #$0004
	lda.b [$89],y
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$0007
	sta.b $00
	asl a
	asl a
	adc.b $00
	lsr a
	clc
	adc.w $0CE5
	ldy.w #$0005
	jsl.l CODE_9FD22B
	sta.w $1483,x
	lda.w attribute,x
	and.w #$F7FF
	sta.w attribute,x
	ldy.w #$0004
	lda.b [$89],y
	and.w #$0001
	eor.w #$0001
	sta.w $14A3,x
	bne CODE_9FD156
	lda.w attribute,x
	ora.w #$0800
	sta.w attribute,x
CODE_9FD156:
	lda.b [$89],y
	and.w #$000E
	sta.w $1463,x
	ldy.w #$0005
	lda.b [$89],y
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$0007
	sta.b $00
	asl a
	asl a
	adc.b $00
	lsr a
	clc
	adc.w PPBonus
	clc
	adc.w PKBonus
	clc
	adc.w HmAwBonus
	ldy.w #$0006
	jsl.l CODE_9FD22B
	sta.w $1403,x
	ldy.w #$0005
	lda.b [$89],y
	and.w #$0007
	sta.b $00
	asl a
	asl a
	adc.b $00
	lsr a
	clc
	adc.w PPBonus
	clc
	adc.w PKBonus
	clc
	adc.w HmAwBonus
	ldy.w #$0007
	jsl.l CODE_9FD22B
	sta.w $1383,x
	ldy.w #$0006
	lda.b [$89],y
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$0007
	sta.b $00
	asl a
	asl a
	adc.b $00
	lsr a
	ldy.w #$0008
	jsl.l CODE_9FD22B
	sta.w $1423,x
	ldy.w #$0006
	lda.b [$89],y
	and.w #$0007
	sta.b $00
	asl a
	asl a
	adc.b $00
	lsr a
	clc
	adc.w $0CE5
	clc
	adc.w $0CE5
	ldy.w #$0009
	jsl.l CODE_9FD22B
	sta.w $13E3,x
	ldy.w #$0007
	lda.b [$89],y
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$0007
	sta.b $00
	asl a
	asl a
	adc.b $00
	lsr a
	clc
	adc.w PPBonus
	clc
	adc.w HmAwBonus
	ldy.w #$000A
	jsl.l CODE_9FD22B
	sta.w $13A3,x
	ldy.w #$0007
	lda.b [$89],y
	and.w #$0007
	sta.b $00
	asl a
	asl a
	adc.b $00
	lsr a
	ldy.w #$000B
	jsl.l CODE_9FD22B
	sta.w $1443,x
	ply
	plx
	rtl
