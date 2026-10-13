; Bank $9E, first 4 KB: game code for the objects on the ice (their tables at $1043,x and up), with auto labels for now.
; DATA8_9E8553 and DATA8_9E8BB7 are word tables read through [$89] with an index from the object; several routines end by
; jumping to CODE_9EA5A4 with a pointer in $89.

org $9E8000
CODE_9E8000:
	lda.w $14E3,x
	bne CODE_9E800C
	lda.w #SPAglideback
	jsl.l CODE_9EA3F1
CODE_9E800C:
	rtl
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9E802A
	and.w #$FFFD
	sta.w pflags,x
	stz.w $1043,x
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
	stz.w $1003,x
CODE_9E802A:
	lda.w position,x
	beq CODE_9E8042
	cpx.w $0AD9
	bne CODE_9E8046
	lda.w #$0011
	sta.b $A5
	lda.w $19D4,x
	bpl CODE_9E8041
	jmp.w $8C0E
CODE_9E8041:
	rtl
CODE_9E8042:
	jml.l CODE_9ED331
CODE_9E8046:
	lda.w $1003,x
	sec
	sbc.b $C1
	sta.w $1003,x
	bmi CODE_9E8054
	jmp.w $814E
CODE_9E8054:
	adc.w $1323,x
	bpl CODE_9E805C
	lda.w #$0000
CODE_9E805C:
	sta.w $1003,x
	ldy.w $0AD9
	bmi CODE_9E8076
	lda.w position,y
	beq CODE_9E8076
	sty.b $8D
	lda.w pfteam,y
	eor.w pfteam,x
	bne CODE_9E8076
	jmp.w $8086
CODE_9E8076:
	ldy.b $91
	lda.w $17AE,y
	sta.b $AD
	lda.w $17B2,y
	sta.b $8D
	lda.b $AD
	bmi CODE_9E80BF
CODE_9E8086:
	cpx.b $8D
	beq CODE_9E80BF
	lda.w $15D6
	bne CODE_9E80BF
	ldy.b $8D
	lda.w pflags,y
	bit.w #$1000
	bne CODE_9E80BF
	lda.w position,y
	beq CODE_9E80BF
	lda.w $0B7D,y
	cmp.w #$0015
	beq CODE_9E80BF
	ldx.b $8D
	lda.w pflags,x
	and.w #$FFFE
	sta.w pflags,x
	lda.w #$0012
	sta.b $A5
	jsl.l assinsert
	ldx.b $E4
	jmp.w $8BE6
CODE_9E80BF:
	lda.w #$0002
	sta.b $A9
	lda.b $AD
	cmp.w #$00E2
	bcs CODE_9E80D2
	stz.b $A9
	lda.w position,x
	beq CODE_9E814E
CODE_9E80D2:
	lda.w sflags
	bit.w #$2000
	beq CODE_9E80EC
	dec.b $A9
	dec.b $A9
	jsl.l chkpk2
	bne CODE_9E80EC
	inc.b $A9
	inc.b $A9
	inc.b $A9
	inc.b $A9
CODE_9E80EC:
	lda.w #$0014
	sec
	sbc.w $1483,x
	sta.b $A5
	lda.b $A9
	sta.b $C5
CODE_9E80F9:
	dec.b $C5
	bmi CODE_9E813D
	asl.b $A5
	bra CODE_9E80F9
CODE_9E8101:
	rtl
CODE_9E8102:
	ldy.w $0AD9
	bmi CODE_9E8136
	lda.w position,y
	bne CODE_9E8136
	lda.w $0D71
	sta.b $A5
	lda.w #$0058
	ldy.w pfgoal,x
	bne CODE_9E811C
	lda.w #$FFA8
CODE_9E811C:
	sta.b $A9
	lda.w #$009E
	sta.b $8B
	lda.w #CODE_9ED0FC
	sta.b $89
	jsl.l CODE_9EA5A4
	jmp.w $A164
CODE_9E812F:
	jsl.l CODE_9E8000
	jmp.w $8BD7
CODE_9E8136:
	jsl.l CODE_9EAFB5
	jmp.w $A164
CODE_9E813D:
	jsl.l randomd0
	lda.b $A5
	cmp.w #$0002
	bcs CODE_9E814E
	lda.w #$00F0
	sta.w $1043,x
CODE_9E814E:
	lda.w $19D4,x
	bpl CODE_9E8101
	lda.w $15D6
	bne CODE_9E812F
	ldy.b $91
	lda.w tmflags,y
	bit.w #$0002
	bne CODE_9E8178
	lda.w $0AD9
	bmi CODE_9E8102
	lda.w $1043,x
	sec
	sbc.b $C1
	sta.w $1043,x
	cmp.w #$0000
	bpl CODE_9E8102
	stz.w $1043,x
CODE_9E8178:
	jsl.l skatetopuckinit
	lda.b $A9
	pha
	lda.b $A5
	pha
	eor.w #$FFFF
	inc a
	sta.b $A5
	lda.b $A9
	eor.w #$FFFF
	inc a
	clc
	adc.w #$00F4
	sta.b $A9
	lda.w pfgoal,x
	beq CODE_9E81A1
	lda.b $A9
	sec
	sbc.w #$01E8
	sta.b $A9
CODE_9E81A1:
	lda.b $A5
	pha
	asl a
	pla
	ror a
	sta.b $A5
	lda.b $A9
	pha
	asl a
	pla
	ror a
	sta.b $A9
	pla
	clc
	adc.b $A5
	sta.b $A5
	pla
	clc
	adc.b $A9
	sta.b $A9
	ldy.b $91
	lda.w tmflags,y
	bit.w #$0002
	beq CODE_9E81E8
CODE_9E81C7:
	lda.w pfgoal,x
	beq CODE_9E81DB
	lda.b $A9
	sec
	sbc.w #$0053
	bmi CODE_9E81E8
	lda.w #$0044
	sta.b $A9
	bra CODE_9E81E8
CODE_9E81DB:
	lda.b $A9
	sec
	sbc.w #$FFAD
	bpl CODE_9E81E8
	lda.w #$FFBC
	sta.b $A9
CODE_9E81E8:
	lda.w #$009E
	sta.b $8B
	lda.w #CODE_9ED0FC
	sta.b $89
	jsl.l CODE_9EA5A4
	jmp.w $A164
CODE_9E81F9:
	lda.w $14E3,x
	beq CODE_9E81FF
	rtl
CODE_9E81FF:
	jsl.l CODE_9FDCB2
	lda.l $7E34C6
	beq CODE_9E8223
	lda.b $A5
	sec
	sbc.w #$00CC
	sta.b $A5
	jsl.l setpde
	lda.l $7E34C6
	cmp.w #$0002
	bne CODE_9E8223
	lda.w #$1000
	sta.b $A5
CODE_9E8223:
	lda.b $A5
	ldx.w #$0233
	jsl.l Mul16U
	ldx.b $95
	lda.b $0A
	sta.b $D7
	lda.w $1163,x
	asl a
	asl a
	tay
	lda.w #$0080
	sta.b $8B
	lda.w #DATA8_80DA06
	sta.b $89
	lda.b [$89],y
	iny
	iny
	tax
	lda.b $D7
	jsl.l CODE_808F5D
	ldx.b $95
	clc
	adc.w $0EC3,x
	sta.w $0EC3,x
	lda.b [$89],y
	tax
	lda.b $D7
	jsl.l CODE_808F5D
	ldx.b $95
	clc
	adc.w $0EE3,x
	sta.w $0EE3,x
	lda.w #SPAburst
	sta.w $14E3,x
	jml.l CODE_9EA3F1
CODE_9E8272:
	lda.w sflags
	and.w #$2000
	bne chkpk2
	inc a
	rtl
chkpk2:
	lda.w pfteam,x
	bne CODE_9E828B
	lda.w sflags
	and.w #$4000
	eor.w #$4000
	rtl
CODE_9E828B:
	lda.w sflags
	and.w #$4000
	rtl
	cpx.w $0AD9
	bne CODE_9E829C
	lda.w $19D4,x
	bmi CODE_9E82A7
CODE_9E829C:
	jmp.w $8BE6
CODE_9E829F:
	rtl
CODE_9E82A0:
	jsl.l CODE_9E8000
	jmp.w $8BD7
CODE_9E82A7:
	lda.w $15D6
	bne CODE_9E82A0
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9E82CF
	and.w #$FFFD
	sta.w pflags,x
	stz.w $1003,x
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3
	lda.w $0792
	and.w #$0003
	sta.w $1043,x
CODE_9E82CF:
	lda.w $1003,x
	sec
	sbc.b $C1
	sta.w $1003,x
	bpl CODE_9E8321
	adc.w $1323,x
	bpl CODE_9E82E2
CODE_9E82DF:
	lda.w #$0000
CODE_9E82E2:
	sta.w $1003,x
	jsl.l CODE_9EC417
	lda.w $1E8B
	beq CODE_9E830D
	lda.w Ypos,x
	sta.b $A5
	bpl CODE_9E82FD
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
CODE_9E82FD:
	cmp.w #$0090
	bpl CODE_9E830D
	lda.w #$0010
	sta.b $A5
	jsl.l CODE_9E8C18
	bra CODE_9E8373
CODE_9E830D:
	jsl.l CODE_9FDBD0
	jsl.l CODE_9EDED4
	lda.w $0B7D,x
	cmp.w #$0011
	bne CODE_9E8321
	jsl.l CODE_9EE89F
CODE_9E8321:
	lda.w #$0006
	clc
	adc.w $1043,x
	sta.b $A5
	lda.w #$0080
	sta.b $8B
	lda.w #$D398
	sta.b $89
	lda.w sflags
	bit.w #$8000
	beq CODE_9E8341
CODE_9E833C:
	lda.w position,x
	sta.b $A5
CODE_9E8341:
	lda.b $A5
	asl a
	asl a
	tay
	lda.b [$89],y
	sta.b $A5
	iny
	iny
	lda.b [$89],y
	sta.b $A9
	lda.w pfgoal,x
	bne CODE_9E8365
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
	lda.w #$0000
	sec
	sbc.b $A9
	sta.b $A9
CODE_9E8365:
	lda.w #$009E
	sta.b $8B
	lda.w #$8374
	sta.b $89
	jml.l CODE_9EA5A4
CODE_9E8373:
	rtl
	lda.b $A5
	and.w #$00FF
	bit.w #$0080
	beq CODE_9E8381
CODE_9E837E:
	ora.w #$FF00
CODE_9E8381:
	sta.b $A5
	lda.w $0EC4,x
	and.w #$00FF
	bit.w #$0080
	beq CODE_9E8391
	ora.w #$FF00
CODE_9E8391:
	clc
	adc.w $0D71
	sta.b $AD
	lda.w $0EE4,x
	and.w #$00FF
	bit.w #$0080
	beq CODE_9E83A5
	ora.w #$FF00
CODE_9E83A5:
	clc
	adc.w pucky
	sta.b $B1
	stz.w $0D2D
	lda.w #$0005
	sta.b $B5
	stz.b $89
	cpx.w #$000C
	bcs CODE_9E83BF
CODE_9E83BA:
	lda.w #$000C
	sta.b $89
CODE_9E83BF:
	ldy.b $89
	lda.w $0EC4,y
	and.w #$00FF
	bit.w #$0080
	beq CODE_9E83CF
	ora.w #$FF00
CODE_9E83CF:
	clc
	adc.w Xpos,y
	sec
	sbc.b $AD
	cmp.w #$FFEB
	bmi CODE_9E8430
	cmp.w #$0015
	bpl CODE_9E8430
	lda.w $0EE4,y
	and.w #$00FF
	bit.w #$0080
	beq CODE_9E83EE
	ora.w #$FF00
CODE_9E83EE:
	clc
	adc.w Ypos,y
	sec
	sbc.b $B1
	cmp.w #$FFEB
	bmi CODE_9E8430
	cmp.w #$0015
	bpl CODE_9E8430
	inc.w $0D2D
	lda.w Xpos,x
	sec
	sbc.w Xpos,y
	sta.b $A5
	lda.w Ypos,x
	sec
	sbc.w Ypos,y
	sta.b $A9
	jsl.l vtoa
	lda.w $1163,x
	eor.w #$0004
	cmp.b $A5
	bne CODE_9E8430
	lda.w $0794
	and.w #$0001
	clc
	adc.b $A5
	and.w #$0007
	sta.b $A5
CODE_9E8430:
	inc.b $89
	inc.b $89
	dec.b $B5
	bmi CODE_9E843B
	jmp.w $83BF
CODE_9E843B:
	rtl
	cpx.w $0AD9
	beq CODE_9E845A
	ldy.w $0AD9
	bmi CODE_9E8462
	lda.w pfteam,x
	cmp.w pfteam,y
	beq CODE_9E8462
	lda.w #$0005
	sta.b $A5
	jmp.w $8C18
CODE_9E8456:
	rtl
CODE_9E8457:
	jmp.w $8BD7
CODE_9E845A:
	lda.w #$0011
	sta.b $A5
	jmp.w $8C0E
CODE_9E8462:
	lda.w $15D6
	bne CODE_9E8457
	jsl.l CODE_9FDC4C
	lda.w $19D4,x
	bpl CODE_9E8456
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9E8490
	and.w #$FFFD
	sta.w pflags,x
	lda.w #$FFFF
	sta.w $1083,x
	stz.w $1003,x
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
CODE_9E8490:
	lda.w $1003,x
	sec
	sbc.b $C1
	sta.w $1003,x
	bmi CODE_9E849E
	jmp.w $852D
CODE_9E849E:
	clc
	adc.w $1343,x
	bpl CODE_9E84A7
CODE_9E84A4:
	lda.w #$0000
CODE_9E84A7:
	sta.w $1003,x
	lda.w pucky
	sta.b $A5
	lda.w pfgoal,x
	bne CODE_9E84BC
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
CODE_9E84BC:
	stz.b $AD
	lda.b $A5
	sec
	sbc.w #$FFA8
	bmi CODE_9E84EC
	lda.w #$0008
	sta.b $AD
	lda.b $A5
	sec
	sbc.w #$0058
	bmi CODE_9E84EC
	ldy.b $91
	lda.w tmflags,y
	bit.w #$0010
	bne CODE_9E84EC
	asl.b $AD
	lda.b $A5
	sec
	sbc.w #$0108
	bmi CODE_9E84EC
	lda.w #$0018
	sta.b $AD
CODE_9E84EC:
	lda.b $AD
	cmp.w $1083,x
	bne CODE_9E84FB
	lda.w $0794
	cmp.w #$0200
	bcs CODE_9E852D
CODE_9E84FB:
	lda.b $AD
	sta.w $1083,x
	tay
	lda.w #$009E
	sta.b $8B
	lda.w #DATA8_9E8553
	sta.b $89
	iny
	iny
	lda.b [$89],y
	dey
	dey
	jsl.l CODE_9BB3A4
	adc.b [$89],y
	sta.w $1043,x
	tya
	clc
	adc.w #$0006
	tay
	lda.b [$89],y
	dey
	dey
	jsl.l CODE_9BB3A4
	adc.b [$89],y
	sta.w $1063,x
CODE_9E852D:
	lda.w $1043,x
	sta.b $A5
	lda.w $1063,x
	sta.b $A9
	lda.w pfgoal,x
	bne CODE_9E8544
	lda.w #$0000
	sec
	sbc.b $A9
	sta.b $A9
CODE_9E8544:
	lda.w #$009E
	sta.b $8B
	lda.w #$8904
	sta.b $89
	jml.l CODE_9EA5A4
CODE_9E8552:
	rtl
DATA8_9E8553:
	dw $0000,$003C,$FFBA,$000A
	dw $0000,$003C,$003C,$000A
	dw $0000,$0028,$00AA,$001E
	dw $0000,$0050,$00AA,$0014
	ldy.w $0AD9
	bmi CODE_9E858C
	lda.w pfteam,x
	cmp.w pfteam,y
	bne CODE_9E858C
	lda.w #$0006
	sta.b $A5
	jmp.w $8C18
CODE_9E8588:
	rtl
CODE_9E8589:
	jmp.w $8BD7
CODE_9E858C:
	lda.w $15D6
	bne CODE_9E8589
	jsl.l CODE_9FDC4C
	lda.w $19D4,x
	bpl CODE_9E8588
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9E85B4
	and.w #$FFFD
	sta.w pflags,x
	stz.w $1003,x
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
CODE_9E85B4:
	lda.w $1003,x
	sec
	sbc.b $C1
	sta.w $1003,x
	bpl CODE_9E85C5
	lda.w $1343,x
	sta.w $1003,x
CODE_9E85C5:
	lda.w $0D71
	pha
	asl a
	pla
	ror a
	sta.b $A5
	lda.w #$0080
	sta.b $A9
	lda.w pfgoal,x
	beq CODE_9E85F6
	lda.w #$FF80
	sta.b $A9
	lda.w #$FFA8
	sec
	sbc.w pucky
	bpl CODE_9E860B
	lda.w #$FF80
	clc
	adc.w pucky
	pha
	asl a
	pla
	ror a
	sta.b $A9
	bra CODE_9E860B
CODE_9E85F5:
	rtl
CODE_9E85F6:
	lda.w #$0058
	sec
	sbc.w pucky
	bmi CODE_9E860B
	lda.b $A9
	clc
	adc.w pucky
	pha
	asl a
	pla
	ror a
	sta.b $A9
CODE_9E860B:
	lda.w #$009E
	sta.b $8B
	lda.w #CODE_9ED0FC
	sta.b $89
	jmp.w $A5A4
	ldy.w $0AD9
	bmi CODE_9E8631
	lda.w pfteam,x
	cmp.w pfteam,y
	bne CODE_9E8631
	lda.w #$0001
	sta.b $A5
	jmp.w $8C18
CODE_9E862D:
	rtl
CODE_9E862E:
	jmp.w $8BD7
CODE_9E8631:
	lda.w $15D6
	bne CODE_9E862E
	jsl.l CODE_9FDC4C
	lda.w $19D4,x
	bpl CODE_9E862D
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9E8659
	and.w #$FFFD
	sta.w pflags,x
	stz.w $1003,x
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
CODE_9E8659:
	lda.w $1003,x
	sec
	sbc.b $C1
	sta.w $1003,x
	bmi CODE_9E8667
	jmp.w $87E9
CODE_9E8667:
	clc
	adc.w $1343,x
	bpl CODE_9E8670
CODE_9E866D:
	lda.w #$0000
CODE_9E8670:
	sta.w $1003,x
	lda.w pucky
	sta.b $A9
	lda.w puckvy
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0200
	beq CODE_9E8689
	ora.w #$FC00
CODE_9E8689:
	sta.b $B1
	lda.w pfgoal,x
	bne CODE_9E86A0
	lda.w #$0000
	sec
	sbc.b $A9
	sta.b $A9
	lda.w #$0000
	sec
	sbc.b $B1
	sta.b $B1
CODE_9E86A0:
	lda.b $B1
	bpl CODE_9E86A6
	stz.b $B1
CODE_9E86A6:
	lda.b $B1
	clc
	adc.b $A9
	sta.b $B1
	sec
	sbc.w #$0058
	bmi CODE_9E86E1
	ldy.b $91
	lda.w tmflags,y
	bit.w #$0010
	bne CODE_9E86E1
	lda.w $0AD9
	bmi CODE_9E86C3
	lsr a
CODE_9E86C3:
	sta.b $A9
	bmi CODE_9E86E1
	jsl.l CODE_9E8272
	beq CODE_9E86E1
	lda.b $A9
	sec
	sbc.w #$0006
	sta.b $A9
	txa
	lsr a
	sec
	sbc.w #$0006
	sta.b $AD
	eor.b $A9
	sta.b $A9
CODE_9E86E1:
	lda.w #$0041
	sta.w $1043,x
	lda.w position,x
	cmp.w #$0002
	beq CODE_9E86F5
	lda.w #$FFBF
	sta.w $1043,x
CODE_9E86F5:
	ldy.w #$0000
	cpx.w #$000C
	bcs CODE_9E8700
	ldy.w #$000C
CODE_9E8700:
	lda.w #$0006
	sta.b $AD
	lda.w #$FC18
	sta.b $A5
	lda.w pfgoal,x
	beq CODE_9E877B
	lda.w #$03E8
	sta.b $A5
CODE_9E8714:
	sty.b $89
	lda.w pflags,y
	bit.w #$1000
	bne CODE_9E8747
	lda.w position,y
	bmi CODE_9E8747
	lda.w $0EE3,y
	bmi CODE_9E872B
	lda.w #$0000
CODE_9E872B:
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0400
	beq CODE_9E8738
	ora.w #$F800
CODE_9E8738:
	clc
	adc.w Ypos,y
	sta.b $A9
	sec
	sbc.b $A5
	bpl CODE_9E8747
	lda.b $A9
	sta.b $A5
CODE_9E8747:
	ldy.b $89
	iny
	iny
	dec.b $AD
	bne CODE_9E8714
	lda.b $A5
	sec
	sbc.w #$0028
	sta.b $A5
	sec
	sbc.w #$FF42
	bpl CODE_9E8762
	lda.w #$FF24
	sta.b $A5
CODE_9E8762:
	lda.b $A5
	sta.w $1063,x
	lda.w $0D71
	sta.b $A5
	lda.w $1043,x
	eor.b $A5
	sta.b $A9
	bpl CODE_9E87E9
	stz.w $1043,x
	bra CODE_9E87E9
CODE_9E877A:
	rtl
CODE_9E877B:
	sty.b $89
	lda.w pflags,y
	bit.w #$1000
	bne CODE_9E87AE
	lda.w position,y
	bmi CODE_9E87AE
	lda.w $0EE3,y
	bpl CODE_9E8792
	lda.w #$0000
CODE_9E8792:
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0400
	beq CODE_9E879F
CODE_9E879C:
	ora.w #$F800
CODE_9E879F:
	clc
	adc.w Ypos,y
	sta.b $A9
	sec
	sbc.b $A5
	bmi CODE_9E87AE
	lda.b $A9
	sta.b $A5
CODE_9E87AE:
	ldy.b $89
	iny
	iny
	dec.b $AD
	bne CODE_9E877B
	lda.b $A5
	clc
	adc.w #$0028
	sta.b $A5
	sec
	sbc.w #$00BE
	bmi CODE_9E87C9
	lda.w #$00DC
	sta.b $A5
CODE_9E87C9:
	lda.b $A5
	sta.w $1063,x
	lda.w #$0000
	sec
	sbc.w $1043,x
	sta.w $1043,x
	lda.w $0D71
	sta.b $A5
	lda.w $1043,x
	eor.b $A5
	sta.b $A9
	bpl CODE_9E87E9
	stz.w $1043,x
CODE_9E87E9:
	lda.w $1043,x
	sta.b $A5
	lda.w $1063,x
	sta.b $A9
	lda.w #$009E
	sta.b $8B
	lda.w #CODE_9ED0FC
	sta.b $89
	jsl.l CODE_9EA5A4
	jmp.w $A164
	cpx.w $0AD9
	beq CODE_9E8822
	ldy.w $0AD9
	bmi CODE_9E882A
	lda.w pfteam,x
	cmp.w pfteam,y
	beq CODE_9E882A
	lda.w #$0002
	sta.b $A5
	jmp.w $8C18
CODE_9E881E:
	rtl
CODE_9E881F:
	jmp.w $8BD7
CODE_9E8822:
	lda.w #$0011
	sta.b $A5
	jmp.w $8C0E
CODE_9E882A:
	lda.w $15D6
	beq CODE_9E8832
	jmp.w $8BD7
CODE_9E8832:
	jsl.l CODE_9FDC4C
	lda.w $19D4,x
	bpl CODE_9E881E
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9E8855
	and.w #$FFFD
	sta.w pflags,x
	stz.w $1003,x
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
CODE_9E8855:
	lda.w $1003,x
	sec
	sbc.b $C1
	sta.w $1003,x
	bpl CODE_9E886C
	clc
	adc.w $1323,x
	bpl CODE_9E8869
CODE_9E8866:
	lda.w #$0000
CODE_9E8869:
	sta.w $1003,x
CODE_9E886C:
	lda.w #$009E
	sta.b $8B
	lda.w #$8904
	sta.b $89
	ldy.w #$0050
	lda.w position,x
	cmp.w #$0002
	beq CODE_9E8884
	ldy.w #$FFB0
CODE_9E8884:
	lda.w pfgoal,x
	bne CODE_9E888F
	tya
	eor.w #$FFFF
	inc a
	tay
CODE_9E888F:
	sty.b $A5
	lda.w $0D71
	eor.b $A5
	bmi CODE_9E889E
	lda.w $0D71
	bra CODE_9E88A8
CODE_9E889D:
	rtl
CODE_9E889E:
	lda.w $0D71
	pha
	asl a
	pla
	ror a
	clc
	adc.b $A5
CODE_9E88A8:
	sta.b $A5
	ldy.b $91
	lda.w tmflags,y
	bit.w #$0010
	bne CODE_9E88F5
	lda.w pucky
	sta.b $AD
	lda.w pfgoal,x
	bne CODE_9E88C6
	lda.w #$0000
	sec
	sbc.b $AD
	sta.b $AD
CODE_9E88C6:
	lda.b $AD
	cmp.w #$FFA8
	bmi CODE_9E88E0
	cmp.w #$0058
	bmi CODE_9E88D9
	lda.w #$0062
	sta.b $A9
	bra CODE_9E88E5
CODE_9E88D9:
	lda.w #$FFB2
	sta.b $A9
	bra CODE_9E88E5
CODE_9E88E0:
	lda.w #$FF28
	sta.b $A9
CODE_9E88E5:
	lda.w pfgoal,x
	bne CODE_9E88F2
	lda.w #$0000
	sec
	sbc.b $A9
	sta.b $A9
CODE_9E88F2:
	jmp.w $A5A4
CODE_9E88F5:
	ldy.w #$0062
	lda.w pfgoal,x
	beq CODE_9E8900
	ldy.w #$FF9E
CODE_9E8900:
	sty.b $A9
	bra CODE_9E88F2
	lda.w $0AD9
	bmi CODE_9E8967
	lda.w $0EC4,x
	sec
	sbc.w $0EE0
	and.w #$00FF
	bit.w #$0080
	beq CODE_9E891B
	ora.w #$FF00
CODE_9E891B:
	clc
	adc.w Xpos,x
	sec
	sbc.w $0D71
	cmp.w #$FFD7
	bmi CODE_9E8967
	cmp.w #$0029
	bpl CODE_9E8967
	lda.w $0EE4,x
	sec
	sbc.w $0F00
	and.w #$00FF
	bit.w #$0080
	beq CODE_9E893F
	ora.w #$FF00
CODE_9E893F:
	clc
	adc.w Ypos,x
	sec
	sbc.w pucky
	cmp.w #$FFD7
	bmi CODE_9E8967
	cmp.w #$0029
	bpl CODE_9E8967
	lda.w Xpos,x
	sec
	sbc.w $0D71
	sta.b $A5
	lda.w Ypos,x
	sec
	sbc.w pucky
	sta.b $A9
	jml.l vtoa
CODE_9E8967:
	rtl
	ldy.w $0AD9
	bmi CODE_9E8981
	lda.w pfteam,x
	cmp.w pfteam,y
	bne CODE_9E8981
	lda.w #$0004
	sta.b $A5
	jmp.w $8C18
CODE_9E897D:
	rtl
CODE_9E897E:
	jmp.w $8BD7
CODE_9E8981:
	lda.w $15D6
	bne CODE_9E897E
	jsl.l CODE_9FDC4C
	lda.w $19D4,x
	bpl CODE_9E897D
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9E89A9
	and.w #$FFFD
	sta.w pflags,x
	stz.w $1003,x
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
CODE_9E89A9:
	lda.w $1003,x
	sec
	sbc.b $C1
	sta.w $1003,x
	bpl CODE_9E89C0
	clc
	adc.w $1343,x
	bpl CODE_9E89BD
CODE_9E89BA:
	lda.w #$0000
CODE_9E89BD:
	sta.w $1003,x
CODE_9E89C0:
	lda.w #$0064
	sta.b $A5
	lda.w position,x
	cmp.w #$0005
	bne CODE_9E89D2
	lda.w #$FF9C
	sta.b $A5
CODE_9E89D2:
	ldy.w $0AD9
	lda.w pfgoal,x
	beq CODE_9E8A18
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
	lda.w #$FF62
	sta.b $A9
	lda.w #$FFB2
	sta.b $AD
	lda.w position,y
	beq CODE_9E8A4B
	ldy.b $91
	lda.w tmflags,y
	bit.w #$0010
	bne CODE_9E8A4B
	lda.b $AD
	sec
	sbc.w pucky
	bpl CODE_9E8A0B
	lda.w pucky
	sta.b $A9
	bra CODE_9E8A4F
CODE_9E8A0A:
	rtl
CODE_9E8A0B:
	lda.w #$FEF8
	sta.b $AD
	sec
	sbc.w pucky
	bmi CODE_9E8A4F
	bra CODE_9E8A4B
CODE_9E8A18:
	lda.w #$009E
	sta.b $A9
	lda.w #$004E
	sta.b $AD
	lda.w position,y
	beq CODE_9E8A4B
	ldy.b $91
	lda.w tmflags,y
	bit.w #$0010
	bne CODE_9E8A4B
	lda.b $AD
	sec
	sbc.w pucky
	bmi CODE_9E8A40
	lda.w pucky
	sta.b $A9
	bra CODE_9E8A4F
CODE_9E8A40:
	lda.w #$0108
	sta.b $AD
	sec
	sbc.w pucky
	bpl CODE_9E8A4F
CODE_9E8A4B:
	lda.b $AD
	sta.b $A9
CODE_9E8A4F:
	lda.w #$009E
	sta.b $8B
	lda.w #CODE_9ED0FC
	sta.b $89
	lda.w $0D71
	eor.b $A5
	sta.b $AD
	bmi CODE_9E8A67
	lda.w $0D71
	sta.b $A5
CODE_9E8A67:
	jmp.w $A5A4
	cpx.w $0AD9
	beq CODE_9E8A88
	ldy.w $0AD9
	bmi CODE_9E8A90
	lda.w pfteam,x
	cmp.w pfteam,y
	beq CODE_9E8A90
	lda.w #$0003
	sta.b $A5
	jmp.w $8C18
CODE_9E8A84:
	rtl
CODE_9E8A85:
	jmp.w $8BD7
CODE_9E8A88:
	lda.w #$0011
	sta.b $A5
	jmp.w $8C0E
CODE_9E8A90:
	lda.w $15D6
	bne CODE_9E8A85
	jsl.l CODE_9FDC4C
	lda.w $19D4,x
	bpl CODE_9E8A84
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9E8ABE
	and.w #$FFFD
	sta.w pflags,x
	lda.w #$FFFF
	sta.w $1083,x
	stz.w $1003,x
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
CODE_9E8ABE:
	lda.w $1003,x
	sec
	sbc.b $C1
	sta.w $1003,x
	bmi CODE_9E8ACC
	jmp.w $8B79
CODE_9E8ACC:
	clc
	adc.w $1343,x
	bpl CODE_9E8AD5
CODE_9E8AD2:
	lda.w #$0000
CODE_9E8AD5:
	sta.w $1003,x
	lda.w pucky
	sta.b $A5
	lda.w puckvy
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0200
	beq CODE_9E8AEE
	ora.w #$FC00
CODE_9E8AEE:
	clc
	adc.b $A5
	sta.b $B1
	lda.w pfgoal,x
	bne CODE_9E8B08
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
	lda.w #$0000
	sec
	sbc.b $B1
	sta.b $B1
CODE_9E8B08:
	stz.b $AD
	lda.b $B1
	sec
	sbc.w #$FFA8
	bmi CODE_9E8B38
	lda.w #$0008
	sta.b $AD
	lda.b $A5
	sec
	sbc.w #$0058
	bmi CODE_9E8B38
	ldy.b $91
	lda.w tmflags,y
	bit.w #$0010
	bne CODE_9E8B38
	asl.b $AD
	lda.b $B1
	sec
	sbc.w #$0108
	bmi CODE_9E8B38
	lda.w #$0018
	sta.b $AD
CODE_9E8B38:
	lda.b $AD
	cmp.w $1083,x
	bne CODE_9E8B47
	lda.w $0792
	cmp.w #$0200
	bcs CODE_9E8B79
CODE_9E8B47:
	lda.b $AD
	sta.w $1083,x
	tay
	lda.w #$009E
	sta.b $8B
	lda.w #DATA8_9E8BB7
	sta.b $89
	iny
	iny
	lda.b [$89],y
	dey
	dey
	jsl.l CODE_9BB3A4
	adc.b [$89],y
	sta.w $1043,x
	tya
	clc
	adc.w #$0006
	tay
	lda.b [$89],y
	dey
	dey
	jsl.l CODE_9BB3A4
	adc.b [$89],y
	sta.w $1063,x
CODE_9E8B79:
	lda.w $1043,x
	sta.b $A5
	lda.w position,x
	cmp.w #$0005
	beq CODE_9E8B8E
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
CODE_9E8B8E:
	lda.w $1063,x
	sta.b $A9
	lda.w pfgoal,x
	bne CODE_9E8BA8
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
	lda.w #$0000
	sec
	sbc.b $A9
	sta.b $A9
CODE_9E8BA8:
	lda.w #$009E
	sta.b $8B
	lda.w #$8904
	sta.b $89
	jml.l CODE_9EA5A4
CODE_9E8BB6:
	rtl
DATA8_9E8BB7:
	dw $0050,$0014,$FFBA,$000A
	dw $0064,$0014,$003C,$000A
	dw $003C,$0032,$00E6,$0014
	dw $0050,$001E,$00FA,$0014
CODE_9E8BD7:
	lda.w $19D4,x
	bpl CODE_9E8BE5
	lda.w #$0008
	sta.b $A5
	jml.l CODE_9EA8A9
CODE_9E8BE5:
	rtl
CODE_9E8BE6:
	lda.w $0F63,x
	inc a
	and.w #$0007
	sta.w $0F63,x
	phx
	phy
	txa
	asl a
	asl a
	adc.w $0F63,x
	tay
	lda.w $0F83,y
	and.w #$00FF
	ply
	plx
	sta.w $0B7D,x
	lda.w pflags,x
	ora.w #$0002
	sta.w pflags,x
	rtl
assinsert:
	lda.w $0F63,x
	dec a
	and.w #$0007
	sta.w $0F63,x
CODE_9E8C18:
	lda.w pflags,x
	ora.w #$0002
	sta.w pflags,x
	txa
	asl a
	asl a
	adc.w $0F63,x
	tay
	sep #$20
	lda.b $A5
	sta.w $0F83,y
	rep #$30
	sta.w $0B7D,x
	rtl
CODE_9E8C35:
	stz.w $0CDB
	lda.w sfhormode
	beq CODE_9E8C45
	lda.b $AD
	ldy.b $B1
	sty.b $AD
	sta.b $B1
CODE_9E8C45:
	lda.w $1563,x
	bne CODE_9E8CA8
	lda.b $B1
	pha
	lda.b $AD
	pha
	lda.w Xpos,x
	sta.b $AD
	lda.w Ypos,x
	sta.b $B1
	lda.w $10C3,x
	sta.w $0D3B
	lda.w $10E3,x
	sta.w $0D3D
	jsl.l CODE_9E8D3E
	lda.w $1103,x
	ora.w $1123,x
	bne CODE_9E8C99
	cpx.w #$0018
	bcs CODE_9E8C99
	txa
	jsl.l CODE_9BC002
	lda.w Xpos,x
	clc
	adc.b $A5
	sta.b $AD
	lda.w Ypos,x
	clc
	adc.b $A9
	sta.b $B1
	lda.w #$0001
	sta.w $0D3B
	sta.w $0D3D
	jsl.l CODE_9E8D3E
CODE_9E8C99:
	pla
	sta.b $AD
	pla
	sta.b $B1
	lda.w position,x
	bmi CODE_9E8CA8
	jsl.l CODE_9E9484
CODE_9E8CA8:
	lda.w $0CDB
	beq CODE_9E8CB0
	jmp.w $8D29
CODE_9E8CB0:
	lda.w OOlistpos,x
	sta.b $A9
CODE_9E8CB5:
	ldy.b $A9
	cpy.w #$000F
	beq CODE_9E8CEC
	lda.w $15C4,y
	and.w #$00FF
	sta.b $B5
	tay
	lda.b $B1
	sec
	sbc.w Ylist,y
	beq CODE_9E8CEC
	bmi CODE_9E8CEC
	inc.w OOlistpos,x
	lda.w OOlistpos,y
	dec a
	sta.w OOlistpos,y
	sep #$30
	ldy.b $A9
	lda.b $B5
	sta.w OOlist,y
	txa
	sta.w $15C4,y
	rep #$30
	inc.b $A9
	bra CODE_9E8CB5
CODE_9E8CEC:
	lda.w OOlistpos,x
	beq CODE_9E8D23
	sta.b $A9
CODE_9E8CF3:
	ldy.b $A9
	lda.w $15C2,y
	and.w #$00FF
	sta.b $B5
	tay
	lda.b $B1
	sec
	sbc.w Ylist,y
	bpl CODE_9E8D23
	dec.w OOlistpos,x
	lda.w OOlistpos,y
	inc a
	sta.w OOlistpos,y
	sep #$30
	ldy.b $A9
	lda.b $B5
	sta.w OOlist,y
	txa
	sta.w $15C2,y
	rep #$30
	dec.b $A9
	bne CODE_9E8CF3
CODE_9E8D23:
	lda.b $B1
	sta.w Ylist,x
	rtl
CODE_9E8D29:
	lda.w SPA,x
	cmp.w #DATA8_9DFC76
	bcs CODE_9E8D3D
	lda.w $0E43,x
	sta.w Xpos,x
	lda.w $0E83,x
	sta.w Ypos,x
CODE_9E8D3D:
	rtl
CODE_9E8D3E:
	lda.w #$012A
	sec
	sbc.w $0D3D
	pha
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0040
	sta.b $B9
	lda.w #$0088
	sec
	sbc.w $0D3B
	pha
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0040
	sta.b $B5
	lda.b $B1
	pha
	ldy.b $AD
	phy
	dec a
	cmp.b $B9
	bpl CODE_9E8D8B
	lda.b $AD
	cmp.b $B5
	bmi CODE_9E8DB5
	lda.w #$0000
	sec
	sbc.b $B5
	sta.b $B5
	cmp.b $AD
	bmi CODE_9E8DB5
	lda.w #$001A
	sta.b $91
	jsl.l CODE_9E90AE
	jmp.w $8E3A
CODE_9E8D8B:
	lda.w #$0000
	sec
	sbc.b $B9
	sta.b $B9
	cmp.b $B1
	bpl CODE_9E8DB2
	lda.b $AD
	cmp.b $B5
	bmi CODE_9E8DB5
	lda.w #$0000
	sec
	sbc.b $B5
	sta.b $B5
	cmp.b $AD
	bmi CODE_9E8DB5
	lda.w #$0018
	sta.b $91
	jsl.l CODE_9E90AE
CODE_9E8DB2:
	jmp.w $8E3A
CODE_9E8DB5:
	lda.b $AD
	sec
	sbc.b $B5
	sta.b $AD
	eor.w #$FFFF
	inc a
	sta.b $A9
	bit.w #$8000
	beq CODE_9E8DCB
	eor.w #$FFFF
	inc a
CODE_9E8DCB:
	sta.b $CD
	lda.b $B1
	sec
	sbc.b $B9
	sta.b $A5
	bit.w #$8000
	beq CODE_9E8DDD
	eor.w #$FFFF
	inc a
CODE_9E8DDD:
	sta.b $D7
	cmp.b $CD
	bcc CODE_9E8DEB
	lda.b $CD
	lsr a
	lsr a
	adc.b $D7
	bra CODE_9E8DEF
CODE_9E8DEB:
	lsr a
	lsr a
	adc.b $CD
CODE_9E8DEF:
	cmp.w #$0041
	bcc CODE_9E8E3A
	sta.b $B1
	lda.b $A5
	xba
	and.w #$FF00
	tax
	lda.b $B1
	jsl.l DivX8S
	cmp.w #$FF01
	bpl CODE_9E8E0B
	lda.w #$FF01
CODE_9E8E0B:
	cmp.w #$00FF
	bmi CODE_9E8E13
	lda.w #$00FF
CODE_9E8E13:
	sta.b $A5
	lda.b $A9
	xba
	and.w #$FF00
	tax
	lda.b $B1
	jsl.l DivX8S
	ldx.b $95
	cmp.w #$FF01
	bpl CODE_9E8E2C
	lda.w #$FF01
CODE_9E8E2C:
	cmp.w #$00FF
	bmi CODE_9E8E34
	lda.w #$00FF
CODE_9E8E34:
	sta.b $A9
	jsl.l CODE_9E8E91
CODE_9E8E3A:
	pla
	sta.b $AD
	pla
	sta.b $B1
	pla
	sta.b $B5
	pla
	sta.b $B9
	lda.w $1103,x
	ora.w $1123,x
	bne CODE_9E8E8A
	lda.w #$00FF
	sta.b $A5
	stz.b $A9
	lda.b $B1
	dec a
	cmp.b $B9
	bpl CODE_9E8E91
	lda.w #$FF01
	sta.b $A5
	lda.w #$0000
	sec
	sbc.b $B9
	dec a
	cmp.b $B1
	bpl CODE_9E8E91
	stz.b $A5
	lda.w #$FF01
	sta.b $A9
	lda.b $AD
	dec a
	cmp.b $B5
	bpl CODE_9E8E91
	lda.w #$00FF
	sta.b $A9
	lda.w #$0000
	sec
	sbc.b $B5
	dec a
	cmp.b $AD
	bpl CODE_9E8E91
CODE_9E8E8A:
	rtl
CODE_9E8E8B:
	jmp.w $8F42
CODE_9E8E8E:
	jmp.w $8F05
CODE_9E8E91:
	cpx.w #$001C
	bne CODE_9E8E8B
	lda.w $0DF9
	cmp.w #$0021
	bpl CODE_9E8E8E
	lda.w $0DF9
	cmp.w #$0016
	bcc CODE_9E8E8B
	lda.w pucky
	cmp.w #$0112
	bmi CODE_9E8E8E
	lda.w $0D71
	cmp.w #$000D
	bmi CODE_9E8E8B
	lda.w $0D71
	cmp.w #$0010
	bpl CODE_9E8E8B
	lda.w puckvy
	cmp.w #$0FA0
	bmi CODE_9E8E8B
	phx
	lda.w puckvy
	pha
	asl a
	pla
	ror a
	sta.w puckvy
	inx
	inx
	stx.b $95
	lda.w #DATA8_9DF8E8
	sta.b $A9
	jsl.l SetSPA
	plx
	stx.b $95
	lda.w #$0006
	jsl.l CODE_9C9A7F
	lda.l $7E35E0
	clc
	adc.w #$0258
	sta.l $7E35E0
	lda.w #$005A
	sta.b $81
	lda.w $19BE
	clc
	adc.w #$000F
	bmi CODE_9E8F05
	sta.w $19BE
CODE_9E8F05:
	lda.w #$0040
	tsb.w sflags
	sta.w $157F
	lda.w pucky
	bpl CODE_9E8F19
	lda.w #$8000
	tsb.w $0E1F
CODE_9E8F19:
	stz.w $0DB5
	lda.w $15D6
	bne CODE_9E8F37
	lda.l $7E30F6
	asl a
	sta.b $95
	tax
	lda.w #$0006
	sta.b $A5
	jsl.l ShootoutWonBy
	ldx.w #$001C
	stx.b $95
CODE_9E8F37:
	jsl.l CODE_9EC791
	stz.w $1E8B
	stz.w $1E89
	rtl
CODE_9E8F42:
	lda.b $A5
	sta.w $1103,x
	lda.b $A9
	sta.w $1123,x
	lda.b $AD
	pha
	lda.b $B1
	pha
	lda.b $A9
	pha
	lda.b $A5
	pha
	txy
	ldx.w $0EE3,y
	jsl.l CODE_808FEB
	lda.b $09
	sta.b $A5
	ldx.w $0EC3,y
	lda.b $A9
	jsl.l CODE_808FEB
	lda.b $A5
	sec
	sbc.b $09
	eor.w #$FFFF
	inc a
	sta.b $AD
	ldx.w $0EC3,y
	lda.b $01,s
	jsl.l CODE_808FEB
	lda.b $09
	sta.b $A5
	ldx.w $0EE3,y
	lda.b $A9
	jsl.l CODE_808FEB
	lda.b $09
	clc
	adc.b $A5
	sta.b $B1
	tyx
	cpx.w #$001C
	beq CODE_9E8F9E
	jmp.w $900A
CODE_9E8F9E:
	lda.w #$1000
	trb.w sflags
	lda.b $AD
	bmi CODE_9E8FAB
	jmp.w $9091
CODE_9E8FAB:
	lsr a
	lsr a
	bit.w #$2000
	beq CODE_9E8FB5
	ora.w #$C000
CODE_9E8FB5:
	sta.b $AD
	sec
	sbc.w #$FC00
	bpl CODE_9E8FE3
	jsl.l RandomWord
	and.w #$07FF
	eor.w #$FFFF
	inc a
	sta.w $0E01
	sta.b $A5
	jsl.l CODE_9EDE5E
	lda.w #$000A
	ldy.w $0DF9
	cpy.w #$000B
	bcs CODE_9E8FDF
	lda.w #$0004
CODE_9E8FDF:
	jsl.l CODE_9C9ABC
CODE_9E8FE3:
	lda.b $B1
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0200
	beq CODE_9E8FF3
	ora.w #$FC00
CODE_9E8FF3:
	sta.b $A5
	pha
	asl a
	pla
	ror a
	sta.b $A7
	lda.b $B1
	sec
	sbc.b $A5
