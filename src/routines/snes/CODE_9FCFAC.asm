; Unidentified routine.
CODE_9FCFAC:
	ldy.w #$0001
	lda.b [$89],y
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$000F
	eor.w #$FFFF
	inc a
	sta.w PKBonus
CODE_9FCFBF:
	ldy.w #$0002
	lda.b [$89],y
	and.w #$000F
	eor.w #$FFFF
	inc a
	sta.b $A5
	lda.w pfteam,x
	bne CODE_9FCFDD
	lda.b [$89],y
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$000F
	sta.b $A5
CODE_9FCFDD:
	lda.b $A5
	sta.w HmAwBonus
	lda.w gsp
	sec
	sbc.w #$0002
	bmi CODE_9FD01F
	bne CODE_9FCFFD
	jsl.l GetPeriodTime
	lsr.b $A5
	lda.b $A5
	sec
	sbc.w gameclock
	beq CODE_9FCFFD
	bpl CODE_9FD01F
CODE_9FCFFD:
	lda.w tmscore
org $9FD000
	sec
	sbc.w $1790
	sta.b $C5
	beq CODE_9FD019
	lda.w pfteam,x
	beq CODE_9FD015
	lda.w #$0000
	sec
	sbc.b $C5
	sta.b $C5
CODE_9FD015:
	lda.b $C5
	bpl CODE_9FD01F
CODE_9FD019:
	lda.w #$0002
	sta.w $0CE5
CODE_9FD01F:
	pla
	sta.b $8B
	pla
	sta.b $89
	ldy.w #$0000
	lda.b [$89],y
	clc
	adc.b $89
	sta.b $89
CODE_9FD02F:
	lda.b [$89]
	clc
	adc.b $89
	adc.w #$0008
	sta.b $89
	dec.b $B1
	bpl CODE_9FD02F
	lda.b $89
	sec
	sbc.w #$0008
	sta.b $89
	lda.b [$89]
	and.w #$00FF
	sta.w $13C3,x
	ldy.w #$0001
	lda.b [$89],y
	and.w #$00F0
	lsr a
	sta.w $12C3,x
	lda.b [$89],y
	and.w #$0007
	sta.b $00
	asl a
	asl a
	adc.b $00
	lsr a
	ldy.w #$0000
	jsl.l CODE_9FD22B
	sta.w $12E3,x
	ldy.w #$0002
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
	ldy.w #$0001
	jsl.l CODE_9FD22B
	sta.w $1303,x
	ldy.w #$0002
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
	clc
	adc.w $0CE5
	ldy.w #$0002
	jsl.l CODE_9FD22B
	eor.w #$000F
	clc
	adc.w #$000F
	lsr a
	sta.w aioff,x
	ldy.w #$0003
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
	adc.w HmAwBonus
	ldy.w #$0003
	jsl.l CODE_9FD22B
	pha
	lda.w position,x
	beq CODE_9FD0EE
	pla
	eor.w #$000F
	clc
	adc.w #$0007
	sta.w aidef,x
	bra CODE_9FD0FA
