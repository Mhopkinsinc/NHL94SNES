; Bank $9E, sixth 4 KB: more game code with auto labels for now. DATA8_9EDBF4 holds animations in SPAList;
; DATA8_9EDC94 is a list of small signed steps.

org $9ED002
	bne CODE_9ED008
	jml.l SetSPA
CODE_9ED008:
	rtl
CODE_9ED009:
	cpx.w $0AD9
	beq CODE_9ED050
	lda.w $0B7D,x
	cmp.w #$000C
	beq CODE_9ED050
	lda.w Ypos,x
	bit.w #$8000
	beq CODE_9ED022
	eor.w #$FFFF
	inc a
CODE_9ED022:
	cmp.w #$0098
	bcc CODE_9ED050
	ldy.w $19D4,x
	bmi CODE_9ED039
	lda.w SPA,x
	cmp.w #DATA8_9DE4B6
	bcc CODE_9ED039
	cmp.w #DATA8_9DF90E
	bcc CODE_9ED04D
CODE_9ED039:
	lda.b $A5
	cmp.w $1163,x
	beq CODE_9ED07A
	sta.b $AD
	lda.w #DATA8_9DE0FE
	jsl.l CODE_9EA3F1
	jml.l CODE_9EA719
CODE_9ED04D:
	jmp.w $A539
CODE_9ED050:
	lda.w $0BCB,x
	bne CODE_9ED07A
	lda.b $A5
	sec
	sbc.w $1163,x
	sta.b $A5
	beq CODE_9ED07A
	eor.w #$FFFF
	inc a
	and.w #$0004
	lsr a
	dec a
	clc
	adc.w $1163,x
	and.w #$0007
	sta.b $A5
	sta.w $1163,x
	lda.w #$0006
	sta.w $0BCB,x
CODE_9ED07A:
	lda.w $0BCB,x
	beq CODE_9ED08B
	sec
	sbc.w $0ADB
	bpl CODE_9ED088
	lda.w #$0000
CODE_9ED088:
	sta.w $0BCB,x
CODE_9ED08B:
	lda.w $0B05,x
	bit.w #$0002
	bne CODE_9ED098
	lda.w #DATA8_9DE0FE
	bra CODE_9ED09B
CODE_9ED098:
	lda.w #DATA8_9DE3C0
CODE_9ED09B:
	jsl.l CODE_9EA3F1
	lda.w $1163,x
	sta.b $AD
	jml.l CODE_9EA719
CODE_9ED0A8:
	lda.w $15D6
	bne CODE_9ED0FC
	stz.b $91
	lda.w #$0002
	sta.b $8D
	jsl.l CODE_9ED0BF
	stz.b $8D
	lda.w #$0002
	sta.b $91
CODE_9ED0BF:
	ldy.b $91
	lda.w tmgoalie,y
	bmi CODE_9ED0FC
	ldx.w tmsort,y
	ldy.w $0AD9
	bmi CODE_9ED0FC
	lda.w pfteam,y
	cmp.w pfteam,x
	bne CODE_9ED0FC
	ldy.b $91
	lda.w gmode
	bit.w #$0008
	bne CODE_9ED0EF
	lda.w $19D0,y
	bne CODE_9ED0FC
	lda.w pucky
	sta.b $A9
	jsl.l CODE_9ED130
	rtl
CODE_9ED0EF:
	lda.w tmgoalie,y
	ora.w #$FF00
	sta.w tmgoalie,y
	jsl.l setpersonel
CODE_9ED0FC:
	rtl
CODE_9ED0FD:
	stz.b $91
	lda.w #$0002
	sta.b $8D
	jsl.l CODE_9ED10F
	stz.b $8D
	lda.w #$0002
	sta.b $91
CODE_9ED10F:
	ldy.b $91
	lda.w tmgoalie,y
	bpl CODE_9ED12F
CODE_9ED116:
	and.w #$00FF
	cmp.w #$000A
	bcs CODE_9ED12F
	sta.w tmgoalie,y
	lda.w $19D0,y
	bne CODE_9ED12F
	lda.l $7E3138
	sta.b $A9
	jmp.w $D130
CODE_9ED12F:
	rtl
CODE_9ED130:
	lda.w gsp
	cmp.w #$0002
	bne CODE_9ED178
	ldy.b $8D
	lda.w $178E,y
	ldy.b $91
	sec
	sbc.w $178E,y
	bmi CODE_9ED178
	beq CODE_9ED178
	cmp.w #$0003
	bcs CODE_9ED178
	lda.w gameclock
	cmp.w #$003D
	bcs CODE_9ED178
	lda.w tmsort,y
	tay
	lda.w pfgoal,y
	bne CODE_9ED165
	lda.w #$0000
	sec
	sbc.b $A9
	sta.b $A9
CODE_9ED165:
	lda.b $A9
	bmi CODE_9ED178
	ldy.b $91
	lda.w tmgoalie,y
	ora.w #$FF00
	sta.w tmgoalie,y
	jml.l setpersonel
CODE_9ED178:
	rtl
CODE_9ED179:
	lda.w #$0006
	ora.w $0B05,x
	sta.w $0B05,x
	lda.w Xpos,x
	cmp.w #$FFD8
	bmi CODE_9ED1B0
	cmp.w #$0029
	bpl CODE_9ED1B0
	lda.w Ypos,x
	bit.w #$8000
	beq CODE_9ED19B
	eor.w #$FFFF
	inc a
CODE_9ED19B:
	sta.b $00
	cmp.w #$00E4
	bmi CODE_9ED1B0
	cmp.w #$0104
	bpl CODE_9ED1B0
	lda.w #$FFFB
	and.w $0B05,x
	sta.w $0B05,x
CODE_9ED1B0:
	lda.w Xpos,x
	cmp.w #$FFD0
	bmi CODE_9ED1D7
	cmp.w #$0031
	bpl CODE_9ED1D7
	lda.w Ypos,x
	bit.w #$8000
	beq CODE_9ED1C9
	eor.w #$FFFF
	inc a
CODE_9ED1C9:
	cmp.w #$00E4
	bmi CODE_9ED1D7
	lda.w #$FFFD
	and.w $0B05,x
	sta.w $0B05,x
CODE_9ED1D7:
	lda.w $19D4,x
	bpl CODE_9ED214
	lda.w $15D6
	bne CODE_9ED214
	jsl.l CODE_9FDC4C
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9ED1F9
	and.w #$FFFD
	sta.w pflags,x
	stz.w $1003,x
	stz.w $0BC9
CODE_9ED1F9:
	lda.w $1003,x
	sec
	sbc.b $C1
	sta.w $1003,x
	bpl CODE_9ED24D
	lda.w $1343,x
	lsr a
	lsr a
	clc
	adc.w $1003,x
	bpl CODE_9ED217
	lda.w #$0000
	bra CODE_9ED217
CODE_9ED214:
	jmp.w $8BE6
CODE_9ED217:
	sta.w $1003,x
	lda.w $0AD9
	bpl CODE_9ED214
	lda.w puckvy
	ldy.w pfgoal,x
	beq CODE_9ED22B
	eor.w #$FFFF
	inc a
CODE_9ED22B:
	cmp.w #$F800
	bmi CODE_9ED214
	stz.b $8D
	lda.w #$0002
	sta.b $91
	lda.w pfteam,x
	beq CODE_9ED243
	stz.b $91
	lda.w #$0002
	sta.b $8D
CODE_9ED243:
	ldy.b $91
	lda.w $17AE,y
	cmp.w #$0096
	bcc CODE_9ED214
CODE_9ED24D:
	jsr.w $DC44
	jsl.l vtoa
	jsl.l CODE_9EDC06
	asl.w $12E3,x
	jsl.l CODE_9ED263
	lsr.w $12E3,x
	rtl
CODE_9ED263:
	lda.w $1023,x
	sec
	sbc.b $C1
	sta.w $1023,x
	bmi CODE_9ED271
	jmp.w $D2F7
CODE_9ED271:
	adc.w #$0005
	sta.w $1023,x
	lda.w puckvx
	xba
	and.w #$00FF
	bit.w #$0080
	beq CODE_9ED286
	ora.w #$FF00
CODE_9ED286:
	clc
	adc.w $0D71
	sta.b $A5
	lda.w puckvy
	xba
	and.w #$00FF
	bit.w #$0080
	beq CODE_9ED29B
	ora.w #$FF00
CODE_9ED29B:
	clc
	adc.w pucky
	sta.b $A9
	jsl.l CODE_9EAB74
	lda.b $A9
	pha
	lda.b $A5
	pha
	txa
	jsl.l CODE_9BC002
	lda.b $A5
	eor.w #$FFFF
	inc a
	sec
	sbc.w $0EC4,x
	and.w #$00FF
	bit.w #$0080
	beq CODE_9ED2C5
	ora.w #$FF00
CODE_9ED2C5:
	clc
	adc.b $01,s
	sec
	sbc.w Xpos,x
	sta.b $A5
	lda.b $A9
	eor.w #$FFFF
	inc a
	sec
	sbc.w $0EE4,x
	and.w #$00FF
	bit.w #$0080
	beq CODE_9ED2E3
	ora.w #$FF00
CODE_9ED2E3:
	clc
	adc.b $03,s
	sec
	sbc.w Ypos,x
	sta.b $A9
	pla
	pla
	jsl.l vtoa
	lda.b $A5
	sta.w $10A3,x
CODE_9ED2F7:
	lda.w $10A3,x
	sta.b $A5
	jml.l CODE_9EA8A9
GoalieCount:
	lda.b $91
	tay
	lda.w #$009C
	sta.b $C7
	lda.w tmdata,y
	sta.b $C5
	ldy.w #$000A
	clc
	adc.b [$C5],y
	sta.b $C5
	stz.b $A5
	lda.b [$C5]
	xba
CODE_9ED31A:
	inc.b $A5
	asl a
	asl a
	asl a
	asl a
	bne CODE_9ED31A
	rtl
AdvanceStringPtr:
	bra CODE_9ED32C
CODE_9ED325:
	lda.b $8D
	clc
	adc.b [$8D]
	sta.b $8D
CODE_9ED32C:
	dec.b $A5
	bpl CODE_9ED325
	rtl
CODE_9ED331:
	lda.w #$0006
	ora.w $0B05,x
	sta.w $0B05,x
	lda.w Xpos,x
	cmp.w #$FFD8
	bmi CODE_9ED368
	cmp.w #$0029
	bpl CODE_9ED368
	lda.w Ypos,x
	bit.w #$8000
	beq CODE_9ED353
	eor.w #$FFFF
	inc a
CODE_9ED353:
	sta.b $00
	cmp.w #$00E4
	bmi CODE_9ED368
	cmp.w #$0104
	bpl CODE_9ED368
	lda.w #$FFFB
	and.w $0B05,x
	sta.w $0B05,x
CODE_9ED368:
	lda.w Xpos,x
	cmp.w #$FFD0
	bmi CODE_9ED391
	cmp.w #$0031
	bpl CODE_9ED391
	lda.w Ypos,x
	bit.w #$8000
	beq CODE_9ED381
	eor.w #$FFFF
	inc a
CODE_9ED381:
	sta.b $00
	cmp.w #$00E4
	bmi CODE_9ED391
	lda.w #$FFFD
	and.w $0B05,x
	sta.w $0B05,x
CODE_9ED391:
	jsl.l CODE_9FDC4C
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9ED3B5
	and.w #$FFFD
	sta.w pflags,x
	stz.w $1003,x
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
	lda.w #$FFFF
	sta.w $1063,x
CODE_9ED3B5:
	ldy.w $19D4,x
	bpl CODE_9ED408
	lda.w Xpos,x
	cmp.w #$FFCB
	bmi CODE_9ED3DD
	cmp.w #$0035
	bpl CODE_9ED3DD
	lda.w Ypos,x
	bit.w #$8000
	beq CODE_9ED3D3
	eor.w #$FFFF
	inc a
CODE_9ED3D3:
	cmp.w #$010F
	bcs CODE_9ED3DD
	cmp.w #$00D3
	bcs CODE_9ED41E
CODE_9ED3DD:
	lda.w #$009E
	sta.b $8B
	lda.w #CODE_9ED0FC
	sta.b $89
	ldy.w #$0004
	lda.w Xpos,x
	bpl CODE_9ED3F2
	ldy.w #$FFFC
CODE_9ED3F2:
	sty.b $A5
	lda.w #$00F4
	sta.b $A9
	lda.w pfgoal,x
	beq CODE_9ED403
	lda.w #$FF0C
	sta.b $A9
CODE_9ED403:
	jml.l CODE_9EA5A4
CODE_9ED407:
	rtl
CODE_9ED408:
	lda.w $15D6
	bne CODE_9ED415
	cpx.w $0AD9
	beq CODE_9ED415
	jmp.w $D44E
CODE_9ED415:
	lda.w $0B05,x
	ora.w #$0001
	sta.w $0B05,x
CODE_9ED41E:
	jmp.w $D46A
CODE_9ED421:
	lda.w #$009E
	sta.b $8B
	lda.w #CODE_9ED0FC
	sta.b $89
	ldy.w #$0004
	lda.w Xpos,x
	bpl CODE_9ED436
	ldy.w #$FFFC
CODE_9ED436:
	sty.b $A5
	lda.w #$00F9
	sta.b $A9
	lda.w pfgoal,x
	beq CODE_9ED447
	lda.w #$FF07
	sta.b $A9
CODE_9ED447:
	stz.w $1023,x
	jml.l CODE_9EA5A4
CODE_9ED44E:
	lda.w $0B05,x
	bit.w #$0001
	bne CODE_9ED41E
	bit.w #$0002
	bne CODE_9ED421
	ldy.w $19D4,x
	lda.w $0AA4,y
	cmp.w #$0008
	bne CODE_9ED46A
	jsl.l CODE_9EA539
CODE_9ED46A:
	lda.w $1543,x
	bne CODE_9ED476
	lda.w #DATA8_9DE0FE
	jsl.l CODE_9EA3F1
CODE_9ED476:
	lda.w $15D6
	bne CODE_9ED49F
	lda.w $1083,x
	bmi CODE_9ED4B4
	cpx.w $0AD9
	bne CODE_9ED497
	lda.w Ypos,x
	cmp.w #$00BB
	bpl CODE_9ED4A0
	cmp.w #$FF45
	bmi CODE_9ED4A0
	stz.w $1083,x
	bra CODE_9ED4A0
CODE_9ED497:
	lda.w #$FFFF
	sta.w $1083,x
	bra CODE_9ED4B4
CODE_9ED49F:
	rtl
CODE_9ED4A0:
	lda.w $1083,x
	sec
	sbc.b $C1
	sta.w $1083,x
	bpl CODE_9ED4B4
	lda.w #$0008
	sta.b $A5
	jsl.l CODE_9EB88A
CODE_9ED4B4:
	lda.w $1543,x
	beq CODE_9ED4BC
	jmp.w $D49F
CODE_9ED4BC:
	lda.w $1003,x
	sec
	sbc.b $C1
	sta.w $1003,x
	bmi CODE_9ED4CA
	jmp.w $DB21
CODE_9ED4CA:
	lda.w $1343,x
	lsr a
	clc
	adc.w $1003,x
	cmp.w #$0000
	bpl CODE_9ED4DA
	lda.w #$0000
CODE_9ED4DA:
	sta.w $1003,x
	lda.w $19D4,x
	bpl CODE_9ED514
	lda.w pucky
	sta.b $A5
	lda.w Ypos,x
	eor.b $A5
	sta.b $A9
	bpl CODE_9ED504
	stz.b $A5
	lda.w #$00F4
	sta.b $AD
	lda.w pfgoal,x
	beq CODE_9ED501
	lda.w #$FF0C
	sta.b $AD
CODE_9ED501:
	jmp.w $DA51
CODE_9ED504:
	dec.w $1063,x
	bpl CODE_9ED50F
	lda.w #$FFFF
	sta.w $1063,x
CODE_9ED50F:
	cpx.w $0AD9
	beq CODE_9ED517
CODE_9ED514:
	jmp.w $D5A7
CODE_9ED517:
	lda.w $1083,x
	bpl CODE_9ED522
	lda.w #$005A
	sta.w $1083,x
CODE_9ED522:
	lda.w #$FFFF
	sta.w $1063,x
	lda.w $1083,x
	sec
	sbc.w #$005A
	bpl CODE_9ED574
	jsl.l RandomWord
	cmp.w #$C000
	bcc CODE_9ED574
	lda.w #$0005
	sta.b $A5
	stz.b $89
	lda.w pfteam,x
	bne CODE_9ED54B
	lda.w #$000C
	sta.b $89
CODE_9ED54B:
	ldy.b $89
	lda.w pflags,y
	bit.w #$1000
	bne CODE_9ED55D
	lda.w $0B1D,y
	cmp.w #$0023
	bcc CODE_9ED577
CODE_9ED55D:
	inc.b $89
	inc.b $89
	dec.b $A5
	bpl CODE_9ED54B
	lda.w #$0001
	sta.w $0D2D
	jsl.l CODE_9EE89F
	lda.w $0AD9
	bmi CODE_9ED58C
CODE_9ED574:
	jmp.w $D6AE
CODE_9ED577:
	ldy.w #$0000
	cmp.w #$0014
	bcs CODE_9ED574
	lda.w #$005A
	sta.w $1543,x
	lda.w #DATA8_9DE66C
	jsl.l CODE_9EA3F1
CODE_9ED58C:
	rtl
CODE_9ED58D:
	jsl.l vtoa
	lda.b $A5
CODE_9ED593:
	sta.w $1163,x
	sta.w $14E3,x
	lda.w #DATA8_9DE528
	jsl.l CODE_9EA3F1
	lda.w #$00F0
	sta.w $0BEB,x
	rtl
CODE_9ED5A7:
	ldy.w $19D4,x
	bmi CODE_9ED5F9
	lda.w $0ADD,y
	cmp.w #$0001
	bne CODE_9ED5F9
	cpx.w $0AD9
	beq CODE_9ED574
	lda.w $0D71
	sec
	sbc.w Xpos,x
	sta.b $A5
	lda.w pucky
	sec
	sbc.w Ypos,x
	sta.b $A9
	lda.w $0776,y
	bit.w #$4000
	bne CODE_9ED5E8
	lda.w $0AB8,y
	bit.w #$0040
	beq CODE_9ED574
	lda.w $0AA4,y
	cmp.w #$0008
	beq CODE_9ED58D
	and.w #$0007
	bra CODE_9ED593
CODE_9ED5E8:
	lda.w $0AA4,y
	cmp.w #$0008
	bne CODE_9ED5F3
	jmp.w $D676
CODE_9ED5F3:
	and.w #$0007
	jmp.w $D67C
CODE_9ED5F9:
	lda.w $0D71
	sec
	sbc.w Xpos,x
	sta.b $A5
	lda.w pucky
	sec
	sbc.w Ypos,x
	sta.b $A9
	lda.w $0AD9
	bmi CODE_9ED640
	lsr a
	tay
	lda.w pfteam,y
	cmp.w pfteam,x
	beq CODE_9ED673
	lda.w $0BEB,x
	bne CODE_9ED673
	jsl.l RandomWord
	cmp.w #$0A00
	bcs CODE_9ED673
	lda.w $0B1D,x
	cmp.w #$0023
	bcs CODE_9ED6AE
	lda.w pucky
	cmp.w #$FEF7
	bmi CODE_9ED6AE
	cmp.w #$0109
	bpl CODE_9ED6AE
	jmp.w $D58D
CODE_9ED640:
	lda.w $1063,x
	bne CODE_9ED673
	lda.w $0B1D,x
	cmp.w #$002D
	bcs CODE_9ED6AE
	lda.w pucky
	cmp.w #$FEF7
	bmi CODE_9ED6AE
	cmp.w #$0109
	bpl CODE_9ED6AE
	lda.b $91
	eor.w #$0002
	tay
	lda.w $17AE,y
	cmp.w #$003C
	bcs CODE_9ED6AE
	jsl.l RandomWord
	cmp.w #$0800
	bcs CODE_9ED6AE
	bra CODE_9ED676
CODE_9ED673:
	jmp.w $D6AE
CODE_9ED676:
	jsl.l vtoa
	lda.b $A5
CODE_9ED67C:
	sta.w $1163,x
	ldy.w #DATA8_9DE4B6
	tya
	jsl.l CODE_9EA3F1
	lda.w #$0168
	sta.w $0BEB,x
	lda.w $19BE
	clc
	adc.w #$000A
	bmi CODE_9ED699
	sta.w $19BE
CODE_9ED699:
	lda.w #$0096
	sta.w $14E3,x
	clc
	adc.l $7E35E0
	sta.l $7E35E0
	lda.w #$001E
	sta.b $81
	rtl
CODE_9ED6AE:
	lda.w pfgoal,x
	bne CODE_9ED6C9
	lda.w #$0000
	sta.b $8B
	lda.w #$0D17
	sta.b $89
	lda.w #$0104
	sta.b $B1
	lda.w #$0108
	sta.b $B5
	bra CODE_9ED6D8
CODE_9ED6C9:
	lda.w #$0D1B
	sta.b $89
	lda.w #$FEFC
	sta.b $B1
	lda.w #$FEF8
	sta.b $B5
CODE_9ED6D8:
	cpx.w $0AD9
	beq CODE_9ED6EA
	jsr.w $DC44
	jsl.l vtoa
	jsl.l CODE_9EDC06
	bra CODE_9ED6FD
CODE_9ED6EA:
	lda.w $19D4,x
	bpl CODE_9ED6FD
	lda.w pfgoal,x
	eor.w #$0001
	asl a
	asl a
	sta.b $A5
	jsl.l CODE_9EDC06
CODE_9ED6FD:
	lda.w Ypos,x
	cmp.w #$FEFB
	bmi CODE_9ED72D
	cmp.w #$0105
	bpl CODE_9ED72D
CODE_9ED70A:
	lda.w $0D71
	sta.b $A5
	lda.w pucky
	sta.b $A9
	jsl.l CODE_9EDBC0
	lda.b $A9
	cmp.w #$FFD2
	bmi CODE_9ED755
	cmp.w #$002E
	bpl CODE_9ED755
	lda.b $A9
	pha
	lda.b $A5
	pha
	jmp.w $D7F1
CODE_9ED72D:
	lda.w $19D4,x
	bpl CODE_9ED70A
	stz.b $AD
	stz.b $A5
	lda.w Xpos,x
	cmp.w #$FFD3
	bmi CODE_9ED752
	cmp.w #$002D
	bpl CODE_9ED752
	lda.w #$0088
	sta.b $A5
	lda.w Xpos,x
	bpl CODE_9ED752
	lda.w #$FF78
	sta.b $A5
CODE_9ED752:
	jmp.w $DA51
CODE_9ED755:
	lda.w puckvy
	xba
	lsr a
	and.w #$007F
	bit.w #$0040
	beq CODE_9ED765
	ora.w #$FF80
CODE_9ED765:
	sta.b $14
	cmp.w #$8000
	ror a
	adc.b $14
	clc
	adc.w pucky
	sta.b $A9
	lda.b $A9
	cmp.w #$00E0
	bpl CODE_9ED781
	lda.b $A9
	cmp.w #$FF20
	bpl CODE_9ED7CA
CODE_9ED781:
	lda.w $0D07
	bpl CODE_9ED7B2
	lda.w $0AD9
	bmi CODE_9ED7B2
	lda.w $0792
	and.w #$0180
	beq CODE_9ED7D2
CODE_9ED793:
	lda.w puckvx
	xba
	and.w #$00FF
	bit.w #$0080
	beq CODE_9ED7A2
	ora.w #$FF00
CODE_9ED7A2:
	sta.b $14
	cmp.w #$8000
	ror a
	adc.b $14
	clc
	adc.w $0D71
	sta.b $A5
	bra CODE_9ED7E7
CODE_9ED7B2:
	lda.w puckvx
	xba
	lsr a
	and.w #$007F
	bit.w #$0040
	beq CODE_9ED7C2
	ora.w #$FF80
CODE_9ED7C2:
	clc
	adc.w $0D71
	sta.b $A5
	bra CODE_9ED7E7
CODE_9ED7CA:
	lda.w $0792
	and.w #$0380
	beq CODE_9ED793
CODE_9ED7D2:
	lda.w puckvx
	xba
	and.w #$00FF
	bit.w #$0080
	beq CODE_9ED7E1
	ora.w #$FF00
CODE_9ED7E1:
	clc
	adc.w $0D71
	sta.b $A5
CODE_9ED7E7:
	jsl.l CODE_9EDBC0
	lda.b $A9
	pha
	lda.b $A5
	pha
CODE_9ED7F1:
	lda.b $A5
	ldy.b $A9
	jsl.l CODE_9CA554
	sta.b $A5
	cmp.w #$001E
	bcs CODE_9ED808
	pla
	sta.b $A5
	pla
	sta.b $A9
	bra CODE_9ED853
CODE_9ED808:
	lda.b $A5
	inc a
	sta.b $AD
	lda.w #$0014
	sta.b $B5
	lda.w sflags
	bit.w #$0008
	beq CODE_9ED81F
	lda.w #$001C
	sta.b $B5
CODE_9ED81F:
	pla
	sta.b $A5
	pla
	sta.b $A9
	tax
	lda.b $B5
	jsl.l CODE_808FC9
	lda.b $AD
	sta.b $04
	jsl.l Div32S
	lda.b $00
	sta.b $A9
	lda.b $B5
	adc.w #$0006
	sta.b $B5
	ldx.b $A5
	jsl.l CODE_808FC9
	lda.b $AD
	sta.b $04
	jsl.l Div32S
	lda.b $00
	sta.b $A5
	ldx.b $E4
CODE_9ED853:
	lda.b $A9
	clc
	adc.b $B1
	sta.b $A9
	sta.b $AD
	ldy.w $19D4,x
	bmi CODE_9ED871
	cpx.w $0AD9
	beq CODE_9ED86E
	lda.w $0776,y
	bit.w #$0080
	bne CODE_9ED8A4
CODE_9ED86E:
	jmp.w $DA2C
CODE_9ED871:
	ldy.w #$0002
	lda.b [$89],y
	cmp.w #$0023
	bcc CODE_9ED87E
	jmp.w $DA51
CODE_9ED87E:
	lda.b [$89]
	cmp.w #$FFE7
	bmi CODE_9ED8A1
	cmp.w #$0019
	bpl CODE_9ED8A1
	lda.b [$89],y
	cmp.w #$0013
	bcs CODE_9ED89E
	lda.w pucky
	cmp.w #$FEF7
	bmi CODE_9ED89E
	cmp.w #$0109
	bmi CODE_9ED8A4
CODE_9ED89E:
	jmp.w $DA2C
CODE_9ED8A1:
	jmp.w $DB3E
CODE_9ED8A4:
	lda.w $0EC3,x
	cmp.w #$8000
	ror a
	sta.w $0EC3,x
	lda.w $0EE3,x
	cmp.w #$8000
	ror a
	sta.w $0EE3,x
	lda.w $0B05,x
	bit.w #$0002
	beq CODE_9ED8C3
	jmp.w $D992
CODE_9ED8C3:
	lda.w puckvx
	xba
	lsr a
	lsr a
	and.w #$003F
	bit.w #$0020
	beq CODE_9ED8D4
	ora.w #$FFC0
CODE_9ED8D4:
	clc
	adc.w $0D71
	sec
	sbc.w Xpos,x
	sta.b $A5
	sta.b $02
	bit.w #$8000
	beq CODE_9ED8E9
	eor.w #$FFFF
	inc a
CODE_9ED8E9:
	sta.b $00
	lda.w puckvy
	xba
	lsr a
	lsr a
	and.w #$003F
	bit.w #$0020
	beq CODE_9ED8FC
	ora.w #$FFC0
CODE_9ED8FC:
	clc
	adc.w pucky
	sec
	sbc.w Ypos,x
	sta.b $A9
	bit.w #$8000
	beq CODE_9ED90F
	eor.w #$FFFF
	inc a
CODE_9ED90F:
	sta.b $04
	jsl.l vtoa
	lda.b $A5
	cmp.w #$0008
	beq CODE_9ED93F
	sec
	sbc.w $1163,x
	and.w #$0007
	sta.b $B1
	beq CODE_9ED93F
	jmp.w $D9A0
CODE_9ED92A:
	lda.w puckvy
	cmp.w #$0800
	bpl CODE_9ED93F
	cmp.w #$F800
	bmi CODE_9ED93F
	lda.w #$0008
	sta.b $A5
	jmp.w $DA04
CODE_9ED93F:
	lda.w $1163,x
	beq CODE_9ED965
	cmp.w #$0004
	beq CODE_9ED96E
	cmp.w #$0001
	beq CODE_9ED977
	cmp.w #$0005
	beq CODE_9ED977
	cmp.w #$0007
	beq CODE_9ED97F
	cmp.w #$0003
	beq CODE_9ED97F
	lda.w $0792
	and.w #$0001
	bra CODE_9ED9A0
CODE_9ED965:
	lda.b $02
	bpl CODE_9ED972
CODE_9ED969:
	lda.w #$0007
	bra CODE_9ED9A0
CODE_9ED96E:
	lda.b $02
	bpl CODE_9ED969
CODE_9ED972:
	lda.w #$0001
	bra CODE_9ED9A0
CODE_9ED977:
	lda.b $00
	cmp.b $04
	bpl CODE_9ED972
	bra CODE_9ED969
CODE_9ED97F:
	lda.b $04
	cmp.b $00
	bpl CODE_9ED972
	bra CODE_9ED969
CODE_9ED987:
	lda.b $A5
	clc
	adc.w #$0006
	sta.b $A5
	jmp.w $DA04
CODE_9ED992:
	lda.w $0B5D,x
	sec
	sbc.w $1163,x
	and.w #$0007
	sta.b $B1
	beq CODE_9ED93F
CODE_9ED9A0:
	cmp.w #$0004
	beq CODE_9ED92A
	lsr a
	lsr a
	sta.b $A5
	lda.w attribute,x
	bit.w #$0800
	beq CODE_9ED9B8
	lda.b $A5
	eor.w #$0001
	sta.b $A5
CODE_9ED9B8:
	lda.b $B1
	cmp.w #$0004
	bcc CODE_9ED9C5
	eor.w #$FFFF
	adc.w #$0008
CODE_9ED9C5:
	cmp.w #$0002
	bcs CODE_9ED987
	lda.w $0DF9
	sec
	sbc.w #$0008
	bpl CODE_9EDA04
	lda.w $0E01
	sec
	sbc.w #$0800
	bpl CODE_9EDA04
	lda.b $A5
	clc
	adc.w #$0004
	sta.b $A5
	ldy.w #$0002
	lda.b [$89],y
	cmp.w #$0009
	bcc CODE_9EDA04
	lda.w $1163,x
	cmp.w #$0002
	beq CODE_9EDA04
	cmp.w #$0006
	beq CODE_9EDA04
	lda.w $0AD9
	bmi CODE_9EDA04
	dec.b $A5
	dec.b $A5
CODE_9EDA04:
	asl.b $A5
	lda.w #$009E
	sta.b $8F
	lda.w #DATA8_9EDBF4
	sta.b $8D
	ldy.b $A5
	lda.b [$8D],y
	sta.w $14E3,x
	jsl.l CODE_9EA3F1
	lda.l $7E35E0
	clc
	adc.w #$0096
	sta.l $7E35E0
	lda.w #$001E
	sta.b $81
CODE_9EDA2C:
	lda.b [$89]
	sta.b $A5
	lda.w pucky
	sec
	sbc.w #$00FC
	bpl CODE_9EDA42
	lda.w pucky
	sec
	sbc.w #$FF04
	bpl CODE_9EDA51
CODE_9EDA42:
	lda.w #$0018
	sta.b $A5
	lda.w $0D71
	bpl CODE_9EDA51
	lda.w #$FFE8
	sta.b $A5
CODE_9EDA51:
	lda.w $19D4,x
	bmi CODE_9EDA59
	jmp.w $DBF3
CODE_9EDA59:
	ldy.w $0AD9
	bmi CODE_9EDAA4
	lda.w pfteam,x
	cmp.w pfteam,y
	beq CODE_9EDAA4
	lda.w SPA,y
	cmp.w #DATA8_9DED4A
	bcc CODE_9EDAA1
	cmp.w #DATA8_9DF020+1
	bcs CODE_9EDAA1
	lda.w $0EE3,y
	bit.w #$8000
	beq CODE_9EDA7F
	eor.w #$FFFF
	inc a
CODE_9EDA7F:
	sta.b $00
	lda.w $0EC3,y
	bit.w #$8000
	beq CODE_9EDA8D
	eor.w #$FFFF
	inc a
CODE_9EDA8D:
	lsr a
	cmp.b $00
	bcs CODE_9EDAA1
	lda.w $0BA1
	bne CODE_9EDAA4
	stz.w $0EC3,x
	stz.w $0EE3,x
	inc.w $0BA1
	rtl
CODE_9EDAA1:
	stz.w $0BA1
CODE_9EDAA4:
	lda.b $AD
	sta.b $A9
	pha
	lda.b $A5
	pha
	lda.w $0EC3,x
	xba
	and.w #$00FF
	bit.w #$0080
	beq CODE_9EDABB
	ora.w #$FF00
CODE_9EDABB:
	eor.w #$FFFF
	inc a
	sta.b $A5
	pla
	clc
	adc.b $A5
	sec
	sbc.w Xpos,x
	sta.b $A5
	lda.w $0EE3,x
	xba
	and.w #$00FF
	bit.w #$0080
	beq CODE_9EDADA
	ora.w #$FF00
CODE_9EDADA:
	eor.w #$FFFF
	inc a
	sta.b $A9
	pla
	clc
	adc.b $A9
	sec
	sbc.w Ypos,x
	sta.b $A9
	lda.w #$0005
	sta.b $C5
	cpx.w $0AD9
	bne CODE_9EDAF6
	asl.b $C5
CODE_9EDAF6:
	lda.b $A5
	bit.w #$8000
	beq CODE_9EDB01
	eor.w #$FFFF
	inc a
CODE_9EDB01:
	cmp.b $C5
	bcs CODE_9EDB18
	lda.b $A9
	bit.w #$8000
	beq CODE_9EDB10
	eor.w #$FFFF
	inc a
CODE_9EDB10:
	cmp.b $C5
	bcs CODE_9EDB18
	stz.b $A5
	stz.b $A9
CODE_9EDB18:
	jsl.l vtoa
	lda.b $A5
	sta.w $10A3,x
CODE_9EDB21:
	ldy.w $19D4,x
	bpl CODE_9EDB3D
	lda.w $10A3,x
	sta.b $AD
	sec
	sbc.w #$0007
	beq CODE_9EDB36
	bmi CODE_9EDB36
	jmp.w $A539
CODE_9EDB36:
	jml.l CODE_9EA719
CODE_9EDB3A:
	jmp.w $DA51
CODE_9EDB3D:
	rtl
CODE_9EDB3E:
	lda.w $0AD9
	bpl CODE_9EDB3A
	lda.w iflags
	bit.w #$0004
	bne CODE_9EDB3A
	lda.w $0D71
	bit.w #$8000
	beq CODE_9EDB57
	eor.w #$FFFF
	inc a
CODE_9EDB57:
	cmp.w #$0068
	bmi CODE_9EDB3A
	lda.w puckvy
	bit.w #$8000
	beq CODE_9EDB68
	eor.w #$FFFF
	inc a
CODE_9EDB68:
	cmp.w #$3800
	bmi CODE_9EDB3A
	lda.w pucky
	cmp.w #$00B8
	bpl CODE_9EDB7D
	lda.w pucky
	cmp.w #$FF48
	bpl CODE_9EDB3A
CODE_9EDB7D:
	lda.w puckvy
	ldy.w pfgoal,x
	beq CODE_9EDB89
	eor.w #$FFFF
	inc a
CODE_9EDB89:
	cmp.w #$FC00
	bmi CODE_9EDB3A
	stz.b $8D
	lda.w #$0002
	sta.b $91
	lda.w pfteam,x
	beq CODE_9EDBA1
	stz.b $91
	lda.w #$0002
	sta.b $8D
CODE_9EDBA1:
	ldy.b $8D
	lda.w $17AE,y
	cmp.w #$0132
	bcc CODE_9EDBBD
	ldy.b $91
	lda.w $17AE,y
	cmp.w #$0132
	bcc CODE_9EDBBD
	lda.w #$000F
	sta.b $A5
	jmp.w $8C0E
CODE_9EDBBD:
	jmp.w $DA51
CODE_9EDBC0:
	lda.w Ypos,x
	cmp.w #$0108
	bpl CODE_9EDBEC
	cmp.w #$FEF8
	bmi CODE_9EDBEC
	cpx.w $0AD9
	bne CODE_9EDBD4
	stz.b $A5
CODE_9EDBD4:
	lda.b $A9
	cmp.w #$0103
	bmi CODE_9EDBE0
	lda.w #$0103
	sta.b $A9
CODE_9EDBE0:
	lda.b $A9
	cmp.w #$FEFD
	bpl CODE_9EDBEC
	lda.w #$FEFD
	sta.b $A9
CODE_9EDBEC:
	lda.b $A9
	sec
	sbc.b $B1
	sta.b $A9
CODE_9EDBF3:
	rtl
DATA8_9EDBF4:		; animations in SPAList, read by index and passed to CODE_9EA3F1
	dw DATA8_9DE1E2&$FFFF,DATA8_9DE214&$FFFF,DATA8_9DE2AA&$FFFF,DATA8_9DE2FC&$FFFF
	dw DATA8_9DE246&$FFFF,DATA8_9DE278&$FFFF,DATA8_9DE862&$FFFF,DATA8_9DE7D0&$FFFF
	dw DATA8_9DE73E&$FFFF
CODE_9EDC06:
	lda.w $1163,x
	sta.b $14
	lda.w $0BCB,x
	bne CODE_9EDC32
	lda.b $A5
	sec
	sbc.b $14
	beq CODE_9EDC32
	eor.w #$FFFF
	inc a
	and.w #$0004
	lsr a
	dec a
	sta.b $A5
	clc
	adc.b $14
	and.w #$0007
	sta.w $1163,x
	lda.w #$0006
	sta.w $0BCB,x
	rtl
CODE_9EDC32:
	lda.w $0BCB,x
	beq CODE_9EDC43
	sec
	sbc.w $0ADB
	bpl CODE_9EDC40
	lda.w #$0000
CODE_9EDC40:
	sta.w $0BCB,x
CODE_9EDC43:
	rtl
CODE_9EDC44:
	phk
	plb
	lda.w $0D71
	sec
	sbc.w Xpos,x
	sta.b $A5
	lda.w pucky
	sec
	sbc.w Ypos,x
	sta.b $A9
	bra CODE_9EDC67
CODE_9EDC5A:
	lda.w $0D71
	sta.b $A5
	lda.w pucky
	sec
	sbc.b $B5
	sta.b $A9
CODE_9EDC67:
	lda.w Ypos,x
	bpl CODE_9EDC86
	cmp.w #$FEF8
	bmi CODE_9EDC85
	lda.w pucky
	cmp.w #$FEF8
	bmi CODE_9EDC7A
	rts
CODE_9EDC7A:
	lda.w #$0001
	sta.b $A9
	rts
CODE_9EDC80:
	lda.w #$FFFF
	sta.b $A9
CODE_9EDC85:
	rts
CODE_9EDC86:
	cmp.w #$0108
	bpl CODE_9EDC85
	lda.w pucky
	cmp.w #$0108
	bpl CODE_9EDC80
	rts
DATA8_9EDC94:
	dw 0,-7,-10,-7,0,7,10,7,0,-7
	lda.w #$0002
	trb.w $129F
	beq CODE_9EDCC3
	stz.w $101F
	stz.w $103F
	lda.w #$0078
	sta.w $10BF
	lda.w #$0000
	sta.l $7E3450
CODE_9EDCC3:
	lda.w $0D19
	sec
	sbc.b $C1
	sta.w $0D19
	lda.w $0D1D
	sec
	sbc.b $C1
	sta.w $0D1D
	lda.w $101F
	sec
	sbc.b $C1
	sta.w $101F
	bpl CODE_9EDCEA
	adc.w #$0005
	sta.w $101F
	jsl.l CODE_9EDDD2
CODE_9EDCEA:
	lda.w $0AD9
	bmi CODE_9EDD3F
	sta.b $91
	jsl.l a2touchpuck
	lda.b $91
	jsl.l CODE_9BC002
	ldy.b $91
	lda.b $A5
	clc
	adc.w Xpos,y
	sec
	sbc.w $0D71
	lsr a
	lsr a
	bit.w #$2000
	beq CODE_9EDD11
	ora.w #$C000
CODE_9EDD11:
	clc
	adc.w $0D71
	sta.w $0D71
	lda.b $A9
	clc
	adc.w Ypos,y
	sec
	sbc.w pucky
	lsr a
	lsr a
	bit.w #$2000
	beq CODE_9EDD2C
	ora.w #$C000
CODE_9EDD2C:
	clc
	adc.w pucky
	sta.w pucky
	lda.w $0EC3,y
	sta.w puckvx
	lda.w $0EE3,y
	sta.w puckvy
CODE_9EDD3F:
	jsl.l CODE_9EF751
	jsl.l CODE_9EF78A
	lda.w $15D6
	bne CODE_9EDDBD
	lda.w $0AD9
	bpl CODE_9EDDB0
	lda.w $163A
	beq CODE_9EDD89
	lda.w gmode
	bit.w #$0002
	bne CODE_9EDD65
	lda.w $1E91
	beq CODE_9EDD71
CODE_9EDD63:
	bra CODE_9EDD6A
CODE_9EDD65:
	lda.w $1E91
	bne CODE_9EDD71
CODE_9EDD6A:
	lda.w puckvy
	bmi CODE_9EDD89
	bra CODE_9EDD77
CODE_9EDD71:
	lda.w puckvy
	dec a
	bpl CODE_9EDD89
CODE_9EDD77:
	lda.l $7E3450
	inc a
	sta.l $7E3450
	cmp.w #$0030
	bcc CODE_9EDD90
	jsl.l CODE_9EC791
CODE_9EDD89:
	lda.w #$0000
	sta.l $7E3450
CODE_9EDD90:
	lda.w $0D71
	cmp.w $0E5F
	bne CODE_9EDDB7
	lda.w pucky
	cmp.w $0E9F
	bne CODE_9EDDB7
	lda.w #$0006
	sta.b $A5
	dec.w $10BF
	bpl CODE_9EDDBD
CODE_9EDDAA:
	jsl.l CODE_9EB88A
	bra CODE_9EDDBD
CODE_9EDDB0:
	lda.w #$0000
	sta.l $7E3450
CODE_9EDDB7:
	lda.w #$0078
	sta.w $10BF
CODE_9EDDBD:
	lda.w $0E01
	and.w #$FF00
	ora.w $0DF9
	beq CODE_9EDDCB
	jmp.w $9788
CODE_9EDDCB:
	jsl.l pucknothing
	jmp.w $9788
CODE_9EDDD2:
	phx
	lda.w #$0108
	sta.b $B5
	ldy.w #$0000
	jsl.l CODE_9EDDF0
	lda.w #$FEF8
	sta.b $B5
	ldy.w #$0004
	jsl.l CODE_9EDDF0
	plx
	rtl
CODE_9EDDED:
	jmp.w $DE57
CODE_9EDDF0:
	lda.b $B5
	sec
	sbc.w pucky
	sta.b $A5
	lda.w puckvy
	beq CODE_9EDDED
	eor.b $A5
	bmi CODE_9EDDED
	lda.b $A5
	stz.b $08
	lsr a
	ror.b $08
	lsr a
	ror.b $08
	lsr a
	ror.b $08
	lsr a
	ror.b $08
	bit.w #$0800
	beq CODE_9EDE19
	ora.w #$F000
CODE_9EDE19:
	sta.b $0A
	lda.w puckvy
	sta.b $04
	jsl.l Div32S
	lda.b $00
	sta.w $0D19,y
	lda.b $00
	asl a
	asl a
	asl a
	asl a
	ldx.w puckvx
	jsl.l Mul16XS
	adc.w $0D71
	sta.b $A5
	cmp.w #$0088
	bmi CODE_9EDE45
	lda.w #$0088
	sta.b $A5
CODE_9EDE45:
	lda.b $A5
	cmp.w #$FF78
	bpl CODE_9EDE51
	lda.w #$FF78
	sta.b $A5
CODE_9EDE51:
	lda.b $A5
	sta.w $0D17,y
	rtl
CODE_9EDE57:
	lda.w #$FFFF
	sta.w $0D19,y
	rtl
CODE_9EDE5E:
	lda.b $A5
	and.w #$0001
	sta.b $A5
	eor.w $117F
	and.w #$0003
	sta.w $117F
	lda.w #$FFFF
	sta.w $11FF
	phx
	ldx.w #$001C
	lda.w #DATA8_9DE978
	jsl.l CODE_9EA3F1
	plx
	rtl
pucknothing:
	lda.w $11DF
	cmp.w #$0008
	bcc CODE_9EDE97
	cmp.w #$0018
	bcs CODE_9EDE97
	lda.w $117F
	eor.w #$0002
	sta.w $117F
CODE_9EDE97:
	lda.w #$0004
	tsb.w $117F
	stz.w $11DF
	lda.w #$FFFF
	sta.w $11FF
	rtl
skatetopuckinit:
	lda.w puckvx
	xba
	lsr a
	and.w #$007F
	bit.w #$0040
	beq CODE_9EDEB7
	ora.w #$FF80
CODE_9EDEB7:
	clc
	adc.w $0D71
	sta.b $A5
	lda.w puckvy
	xba
	lsr a
	and.w #$007F
	bit.w #$0040
	beq CODE_9EDECD
	ora.w #$FF80
CODE_9EDECD:
	clc
	adc.w pucky
	sta.b $A9
	rtl
CODE_9EDED4:
	lda.w $15D6
	bne CODE_9EDEE4
	lda.w gameclock
	cmp.w #$0005
	bcs CODE_9EDEE4
	jmp.w $E10B
CODE_9EDEE4:
	lda.w $163A
	bne CODE_9EDF0C
	jsl.l CODE_9E8272
	bne CODE_9EDF0C
	lda.w $0D2D
	beq CODE_9EDF0C
	lda.w Ypos,x
	cmp.w #$FF13
	bmi CODE_9EDF0C
	cmp.w #$00ED
	bpl CODE_9EDF0C
	lda.w $0792
	and.w #$0003
	bne CODE_9EDF0C
	jmp.w $ED85
CODE_9EDF0C:
	lda.w #$0020
	sec
	sbc.w $13E3,x
	asl a
	asl a
	asl a
	asl a
	sta.b $B5
	ldy.w #$0108
	lda.w pfgoal,x
	bne CODE_9EDF24
	ldy.w #$FEF8
CODE_9EDF24:
	sty.b $A9
	tya
	sec
	sbc.w pucky
	sta.b $A9
	cmp.w #$0064
	bpl CODE_9EDF9B
	cmp.w #$FF9C
	bmi CODE_9EDF9B
	lda.w $0D71
	cmp.w #$0064
	bpl CODE_9EDF9B
	cmp.w #$FF9C
	bmi CODE_9EDFAF
	eor.w #$FFFF
	inc a
	pha
	tax
	jsl.l CODE_808F7D
	sta.b $A5
	lda.b $A9
	tax
	jsl.l CODE_808F7D
	ldx.b $E4
	clc
	adc.b $A5
	sta.b $C5
	pla
	sta.b $A5
	lda.b $C5
	cmp.w #$2711
	lsr.b $B5
	lsr.b $B5
	lsr.b $B5
	lsr.b $B5
	jsl.l vtoa
	sta.b $B9
	lda.w #$0005
	sta.b $B1
	ldy.w #$0000
	cpx.w #$000C
	bcs CODE_9EDF84
	ldy.w #$000C
CODE_9EDF84:
	lda.w position,y
	beq CODE_9EDF9D
	lda.w $0B5D,y
	sec
	sbc.w #$0004
	and.w #$0007
	cmp.b $B9
	bne CODE_9EDFA9
	asl.b $B5
	bra CODE_9EDFA9
CODE_9EDF9B:
	bra CODE_9EDFAF
CODE_9EDF9D:
	lda.w $1543,y
	beq CODE_9EDFA9
	stz.b $B1
	lda.w #$0001
	sta.b $B5
CODE_9EDFA9:
	iny
	iny
	dec.b $B1
	bpl CODE_9EDF84
CODE_9EDFAF:
	lda.b $B5
	jsl.l CODE_9BB370
	cmp.w #$0009
	bcs CODE_9EDFF6
	lda.w pucky
	sta.b $A5
	lda.w pfgoal,x
	bne CODE_9EDFCC
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
CODE_9EDFCC:
	lda.b $A5
	bmi CODE_9EDFF6
	lda.w #$0108
	sec
	sbc.b $A5
	bmi CODE_9EDFF6
	lda.w $163A
	beq CODE_9EDFEB
	lda.w #$00B0
	lsr a
	lsr a
	clc
	adc.w #$0058
	sec
	sbc.b $A5
	bpl CODE_9EDFF6
CODE_9EDFEB:
	lda.w sflags
	bit.w #$8000
	bne CODE_9EDFF6
	jmp.w $E10B
CODE_9EDFF6:
	rtl
CODE_9EDFF7:
	lda.w $19D4,x
	bmi CODE_9EDFFF
	jmp.w $E0CC
CODE_9EDFFF:
	lda.w #$0008
