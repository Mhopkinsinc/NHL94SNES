; Bank $9E, third 4 KB: more game code for the objects on the ice, with auto labels for now. CODE_9EA5A4, which several
; routines jump to with a pointer in $89, moves an object's timer on and runs its next step. DATA8_9EAD34 and DATA8_9EAF1A
; are jump tables (jsr (table,x); $0000 = none); DATA8_9EA889 and DATA8_9EAAA3 hold x and y steps for eight directions.

org $9EA001
	pha
	jsl.l CODE_9EA021
	ldx.b $91
	ldy.b $95
	sty.b $91
	stx.b $95
	jsl.l CODE_9EA021
	pla
	sta.b $95
	pla
	sta.b $91
	pla
	sta.b $B5
	ldx.b $95
CODE_9EA01D:
	rtl
CODE_9EA01E:
	jmp.w $A2F1
CODE_9EA021:
	ldy.b $91
	lda.w $11A3,y
	cmp.w #$F374
	beq CODE_9EA01E
	cmp.w #$F864
	beq CODE_9EA01E
	cmp.w #$F208
	bne CODE_9EA038
	jmp.w $BC24
CODE_9EA038:
	lda.w $11A3,x
	cmp.w #$F342
	bne CODE_9EA01D
	lda.w $15D6
	beq CODE_9EA04E
	lda.w #$0100
	sta.w $0F23,x
	sta.w $0F23,y
CODE_9EA04E:
	lda.w $0D55,y
	sec
	sbc.w $0D55,x
	sta.b $A5
	lda.w $0DB7,y
	sec
	sbc.w $0DB7,x
	sta.b $A9
	jsl.l CODE_9BB445
	lda.b $A5
	sec
	sbc.w $1163,x
	and.w #$0007
	asl a
	tay
	lda.w #$009E
	sta.b $8B
	lda.w #DATA8_9EA154
	sta.b $89
	sta.w $1543,x
	cpy.w #$0000
	bne CODE_9EA0B1
	lda.w $0D55,x
	cmp.w #$0050
	bpl CODE_9EA0A5
	cmp.w #$A057
	bmi CODE_9EA0A5
	lda.w $0DB7,x
	cmp.w #$00F8
	bpl CODE_9EA0A5
	cmp.w #$FF08
	bpl CODE_9EA0A5
	lda.w $0792
	and.w #$00F0
	beq CODE_9EA0B1
	bra CODE_9EA0AD
CODE_9EA0A5:
	lda.w $0792
	and.w #$0030
	beq CODE_9EA0B1
CODE_9EA0AD:
	iny
	iny
	sty.b $A5
CODE_9EA0B1:
	lda.b [$89],y
	jsl.l CODE_9EA3F1
	ldy.b $91
	lda.w $0F43,y
	beq CODE_9EA10E
	lda.b $B5
	sec
	sbc.w #$0020
	bmi CODE_9EA10E
	lda.w #$0078
	sta.b $A5
	lda.b $A5
	sec
	sbc.w $12C3,x
	clc
	adc.w $12C3,y
	lsr a
	sec
	sbc.w $0F23,y
	beq CODE_9EA10F
	bmi CODE_9EA10F
	sta.b $A5
	jsl.l CODE_9BB39B
	lda.b $A5
	sec
	sbc.w $1483,x
	bmi CODE_9EA10F
	jsl.l $9EC124
	lda.b $A5
	cmp.w #$0001
	bcs CODE_9EA10E
	lda.w $15D4
	bit.w #$0010
	bne CODE_9EA10E
	lda.w $0793
	and.w #$0002
	clc
	adc.w #$0018
	sta.b $A5
	jmp.w $B85E
CODE_9EA10E:
	rtl
CODE_9EA10F:
	jsl.l $9EC124
	lda.b $A5
	cmp.w #$0001
	bcs CODE_9EA132
	lda.w $15D4
	bit.w #$0010
	bne CODE_9EA132
	lda.w $0793
	and.w #$0002
	clc
	adc.w #$001C
	sta.b $A5
	jsl.l $9EB85E
CODE_9EA132:
	jsl.l $9EC042
	beq CODE_9EA151
	lda.w $1E8D
	bpl CODE_9EA151
	ldy.b $91
	sty.w $1E8D
	lda.w $19D4,y
	sta.w $1E93
	lda.w #$0024
	sta.b $A5
	jsl.l $9EB85E
CODE_9EA151:
	jmp.w $9B52
DATA8_9EA154:		; word pointers into this bank, not identified yet
	dw $F196,$F2AC,$F310,$F310,$F310,$F2DE,$F2DE,$F27A
CODE_9EA164:
	lda.w #$0014
	sec
	sbc.w $1483,x
	sta.b $A5
	lda.l $7E34C4
	beq CODE_9EA175
	asl.b $A5
CODE_9EA175:
	lda.b $A5
	jsl.l CODE_9BB370
	cmp.w #$0004
	bcc CODE_9EA18B
	lda.b $A5
	jsl.l CODE_9BB370
	cmp.w #$0004
	bcs CODE_9EA1BC
CODE_9EA18B:
	lda.w #$0005
	sta.b $AD
	ldy.w #$0000
	cpx.w #$000C
	bcs CODE_9EA19B
	ldy.w #$000C
CODE_9EA19B:
	sty.b $89
	lda.w $0F43,y
	beq CODE_9EA1B4
	lda.w $11A3,y
	cmp.w #$F3A6
	bcc CODE_9EA1AF
	cmp.w #$F46B
	bcc CODE_9EA1BD
CODE_9EA1AF:
	lda.w $14E3,y
	beq CODE_9EA1BD
CODE_9EA1B4:
	ldy.b $89
	iny
	iny
	dec.b $AD
	bpl CODE_9EA19B
CODE_9EA1BC:
	rtl
CODE_9EA1BD:
	lda.w $0D55,y
	sec
	sbc.w $0D55,x
	sta.b $A5
	cmp.w #$FFDE
	bmi CODE_9EA1B4
	cmp.w #$0022
	bpl CODE_9EA1B4
	lda.w $0DB7,y
	sec
	sbc.w $0DB7,x
	sta.b $A9
	cmp.w #$FFDE
	bmi CODE_9EA1B4
	cmp.w #$0022
	bpl CODE_9EA1B4
	jsl.l CODE_9BB445
	lda.b $A5
	cmp.w $1163,x
	bne CODE_9EA1B4
	lda.w $0D55,x
	cmp.w #$004A
	bpl CODE_9EA233
	cmp.w #$FFB6
	bmi CODE_9EA233
	lda.w $14C3,x
	bne CODE_9EA226
	lda.w $0DB7,x
	cmp.w #$0058
	bmi CODE_9EA233
	cmp.w #$0108
	bpl CODE_9EA233
CODE_9EA20D:
	lda.w $11A3,y
	cmp.w #$F3A6
	bcc CODE_9EA21A
	cmp.w #$F46B
	bcc CODE_9EA23E
CODE_9EA21A:
	lda.w $0793
	and.w #$0007
	beq CODE_9EA23E
CODE_9EA222:
	jml.l CODE_9EA2CB
CODE_9EA226:
	lda.w $0DB7,x
	cmp.w #$FFA8
	bpl CODE_9EA233
	cmp.w #$FEF8
	bpl CODE_9EA20D
CODE_9EA233:
	lda.w $0793
	and.w #$0007
	bne CODE_9EA23E
	jmp.w $A222
CODE_9EA23E:
	jml.l CODE_9E81F9
CODE_9EA242:
	lda.w #$F208
	sta.w $1543,x
	jml.l CODE_9EA3F1
CODE_9EA24C:
	lda.w $0F43,x
	beq CODE_9EA25E
	lda.w $14E3,x
	beq CODE_9EA25F
	lda.w $11A3,x
	cmp.w #$F342
	bne CODE_9EA25F
CODE_9EA25E:
	rtl
CODE_9EA25F:
	lda.w #$FFFF
	sta.b $B1
	sta.b $89
	ldy.w #$0000
	cpx.w #$000C
	bcs CODE_9EA271
	ldy.w #$000C
CODE_9EA271:
	lda.w #$0006
	sta.b $AD
CODE_9EA276:
	sty.b $91
	lda.w $0F43,y
	beq CODE_9EA2B3
	bmi CODE_9EA2B3
	lda.w $0D55,y
	sec
	sbc.w $0D55,x
	sta.b $A5
	lda.w $0DB7,y
	sec
	sbc.w $0DB7,x
	sta.b $A9
	ldy.b $A9
	lda.b $A5
	jsl.l CODE_9CA554
	sta.b $B5
	jsl.l CODE_9BB445
	lda.b $A5
	sec
	sbc.w $1163,x
	and.w #$0007
	cmp.w #$0005
	bcc CODE_9EA2B3
	eor.w #$FFFF
	adc.w #$0008
CODE_9EA2B3:
	asl a
	asl a
	asl a
	asl a
	adc.b $B5
	cmp.b $B1
	bcs CODE_9EA2C3
	sta.b $B1
	lda.b $91
	sta.b $89
CODE_9EA2C3:
	ldy.b $91
	iny
	iny
	dec.b $AD
	bne CODE_9EA276
CODE_9EA2CB:
	lda.w #$F864
	sta.b $A9
	sta.w $14E3,x
	ldy.b $89
	bmi CODE_9EA2ED
	lda.w $1163,x
	sec
	sbc.w $1163,y
	inc a
	inc a
	and.w #$0007
	cmp.w #$0005
	bcc CODE_9EA2ED
	lda.w #$F374
	sta.b $A9
CODE_9EA2ED:
	jml.l CODE_9EA3DD
CODE_9EA2F1:
	lda.w $0F43,x
	beq CODE_9EA333
	lda.w $14E3,x
	bne CODE_9EA333
	ldy.b $91
	lda.w $0D55,x
	sec
	sbc.w $0D55,y
	sta.b $A5
	lda.w $0DB7,x
	sec
	sbc.w $0DB7,y
	sta.b $A9
	jsl.l CODE_9BB445
	ldy.b $91
	lda.b $A5
	sec
	sbc.w $1163,y
	inc a
	and.w #$0007
	cmp.w #$0003
	bcs CODE_9EA333
	lda.w $0AD9
	cmp.b $95
	bne CODE_9EA334
	lda.w #$0008
	trb.w $15D8
	bra CODE_9EA334
CODE_9EA333:
	rtl
CODE_9EA334:
	lda.b $A5
	sta.w $1163,y
	ldy.b $91
	lda.w $0EC3,x
	clc
	adc.w $0EC3,y
	pha
	asl a
	pla
	ror a
	sta.w $0EC3,x
	sta.w $0EC3,y
	lda.w $0EE3,x
	clc
	adc.w $0EE3,y
	pha
	asl a
	pla
	ror a
	sta.w $0EE3,x
	sta.w $0EE3,y
	tya
	sta.w $0F03,x
	lda.w #$F46A
	sta.w $14E3,x
	jsl.l CODE_9EA3F1
	ldx.b $91
	ldy.b $95
	sty.b $91
	stx.b $95
	tya
	sta.w $0F03,x
	lda.w #$F3A6
	sta.w $14E3,x
	ldy.w $11A3,x
	cpy.w #$F374
	beq CODE_9EA388
	lda.w #$F3D8
CODE_9EA388:
	jsl.l CODE_9EA3F1
	jsl.l $9EC042
	beq CODE_9EA3AD
	lda.w $1E8D
	bpl CODE_9EA3AD
	ldy.b $91
	sty.w $1E8D
	lda.w $19D4,y
	sta.w $1E93
	lda.w #$0024
	sta.b $A5
	jsl.l $9EB85E
	bra CODE_9EA3CE
CODE_9EA3AD:
	jsl.l $9EC124
	lda.b $A5
	cmp.w #$0001
	bcs CODE_9EA3CE
	lda.w #$0028
	sta.b $A5
	lda.w $11A3,x
	cmp.w #$F3A6
	beq CODE_9EA3CA
	lda.w #$0020
	sta.b $A5
CODE_9EA3CA:
	jsl.l $9EB85E
CODE_9EA3CE:
	ldx.b $91
	ldy.b $95
	sty.b $91
	stx.b $95
	lda.w #$FFFF
	sta.w $0CDB
	rtl
CODE_9EA3DD:
	lda.b $A9
	cmp.w $11A3,x
	beq CODE_9EA3F0
	sta.w $11A3,x
	stz.w $11C3,x
	lda.w #$FFFF
	sta.w $11E3,x
CODE_9EA3F0:
	rtl
CODE_9EA3F1:
	cmp.w $11A3,x
	beq CODE_9EA402
	sta.w $11A3,x
	stz.w $11C3,x
	lda.w #$FFFF
	sta.w $11E3,x
CODE_9EA402:
	rtl
CODE_9EA403:
	cmp.w $11A3,x
	beq CODE_9EA418
	sta.w $11A3,x
	stz.w $11C3,x
	lda.w #$FFFF
	sta.w $11E3,x
	jsl.l CODE_9EA419
CODE_9EA418:
	rtl
CODE_9EA419:
	lda.w $11A3,x
	bne CODE_9EA442
	stz.w $1543,x
	stz.w $14E3,x
	rtl
CODE_9EA425:
	cpx.w #$0018
	bcs CODE_9EA456
	lda.w $0E03,x
	bit.w #$0800
	beq CODE_9EA43B
	lda.w #$0002
	sec
	sbc.w $1163,x
	bra CODE_9EA472
CODE_9EA43B:
	lda.w $1163,x
	dec a
	dec a
	bra CODE_9EA472
CODE_9EA442:
	phy
	sta.b $89
	lda.w #$009D
	sta.b $8B
	ldy.w #$0010
	lda.b [$89],y
	sta.b $A9
	lda.w $15DA
	bne CODE_9EA425
CODE_9EA456:
	lda.w $11A3,x
	cmp.w #$FDFE
	bcs CODE_9EA46F
	lda.w $0E03,x
	bit.w #$0800
	beq CODE_9EA46F
	lda.w #$0000
	sec
	sbc.w $1163,x
	bra CODE_9EA472
CODE_9EA46F:
	lda.w $1163,x
CODE_9EA472:
	and.w #$0007
	asl a
	tay
	lda.b [$89],y
	sta.b $89
	ldy.w $11C3,x
	sty.b $A5
	lda.b [$89],y
	sta.b $AD
	lda.w $11E3,x
	bmi CODE_9EA4C6
	sec
	sbc.w $0ADB
	sta.w $11E3,x
	bpl CODE_9EA4D8
	lda.w $11C3,x
	clc
	adc.w #$0004
	sta.w $11C3,x
	sta.b $A5
	iny
	iny
	lda.b [$89],y
	cmp.w #$0000
	bpl CODE_9EA4C6
	stz.b $A5
	stz.w $11C3,x
	stz.w $1543,x
	stz.w $14E3,x
	lda.w $11A3,x
	cmp.w #$FEC2
	bcs CODE_9EA4BF
	cmp.w #$FDFE
	bcs CODE_9EA4DF
CODE_9EA4BF:
	lda.b $A9
	bne CODE_9EA4C6
	stz.w $11A3,x
CODE_9EA4C6:
	ldy.b $A5
	iny
	iny
	lda.b [$89],y
	bit.w #$8000
	beq CODE_9EA4D5
	eor.w #$FFFF
	inc a
CODE_9EA4D5:
	sta.w $11E3,x
CODE_9EA4D8:
	lda.b $AD
	sta.w $0D97,x
CODE_9EA4DD:
	ply
	rtl
CODE_9EA4DF:
	lda.w #$FF78
	sta.w $0D55,x
	lda.w #$0002
	sta.w $1163,x
	sta.w $14E3,x
	lda.w #$E8F4
	jsl.l CODE_9EA403
	bra CODE_9EA4DD
CODE_9EA4F7:
	lda.w $0EC3,x
	cmp.w #$EFFF
	bmi CODE_9EA511
	cmp.w #$1001
	bpl CODE_9EA511
	lda.w $0EE3,x
	cmp.w #$EFFF
	bmi CODE_9EA511
	cmp.w #$1001
	bmi CODE_9EA539
CODE_9EA511:
	lda.w #$EA1A
	ldy.w $1523,x
	bne CODE_9EA535
	cpx.w $0AD9
	bne CODE_9EA52F
	lda.w $0EC3,x
	sta.b $0C
	lda.w $0EE3,x
	sta.b $0E
	lda.w #$0011
	jsl.l CODE_9C9AD0
CODE_9EA52F:
	lda.w #$EC14
	sta.w $1543,x
CODE_9EA535:
	jsl.l CODE_9EA3F1
CODE_9EA539:
	lda.w $0F43,x
	bne CODE_9EA55D
	lda.w $19D4,x
	bmi CODE_9EA55D
	cpx.w $0AD9
	beq CODE_9EA55D
	lda.w $0EC3,x
	cmp.w #$8000
	ror a
	sta.w $0EC3,x
	lda.w $0EE3,x
	cmp.w #$8000
	ror a
	sta.w $0EE3,x
	rtl
CODE_9EA55D:
	phx
	lda.w #$0070
	clc
	adc.w $12E3,x
	ldx.w $0ADB
	jsl.l CODE_808F4C
	sta.b $08
	plx
	lda.w $0EC3,x
	bpl CODE_9EA57E
	clc
	adc.b $08
	sta.w $0EC3,x
	bmi CODE_9EA589
	bra CODE_9EA586
CODE_9EA57E:
	sec
	sbc.b $08
	sta.w $0EC3,x
	bpl CODE_9EA589
CODE_9EA586:
	stz.w $0EC3,x
CODE_9EA589:
	lda.w $0EE3,x
	bpl CODE_9EA598
	clc
	adc.b $08
	sta.w $0EE3,x
	bmi CODE_9EA5A3
	bra CODE_9EA5A0
CODE_9EA598:
	sec
	sbc.b $08
	sta.w $0EE3,x
	bpl CODE_9EA5A3
CODE_9EA5A0:
	stz.w $0EE3,x
CODE_9EA5A3:
	rtl
CODE_9EA5A4:
	lda.w $1023,x
	sec
	sbc.w $0ADB
	sta.w $1023,x
	bmi CODE_9EA5B3
	jmp.w $A694
CODE_9EA5B3:
	adc.w #$000C
	sta.w $1023,x
	lda.b $A5
	sta.b $A7
	lda.b $A9
	sta.b $AB
	jsl.l CODE_9EAB74
	lda.w $0EC3,x
	xba
	and.w #$00FF
	bit.w #$0080
	beq CODE_9EA5D4
	ora.w #$FF00
CODE_9EA5D4:
	eor.w #$FFFF
	inc a
	sta.b $14
	clc
	adc.b $A5
	sec
	sbc.w $0D55,x
	sta.b $A5
	lda.w $0EE3,x
	xba
	and.w #$00FF
	bit.w #$0080
	beq CODE_9EA5F2
	ora.w #$FF00
CODE_9EA5F2:
	eor.w #$FFFF
	inc a
	sta.b $16
	clc
	adc.b $A9
	sec
	sbc.w $0DB7,x
	sta.b $A9
	lda.w $0F43,x
	bne CODE_9EA60E
	lda.w $0B05,x
	bit.w #$0002
	beq CODE_9EA65A
CODE_9EA60E:
	lda.b $A5
	pha
	lda.b $A9
	pha
	ldy.w $0EC3,x
	lda.w $0EE3,x
	jsl.l CODE_9CA554
	pha
	lda.b $14
	clc
	adc.b $A7
	sec
	sbc.w $0D55,x
	tay
	lda.b $16
	clc
	adc.b $AB
	sec
	sbc.w $0DB7,x
	jsl.l CODE_9CA554
	tay
	pla
	sta.b $14
	pla
	sta.b $A9
	pla
	sta.b $A5
	lda.b $14
	cmp.w #$1000
	bcs CODE_9EA64E
	cpy.w #$0005
	bpl CODE_9EA65A
	bra CODE_9EA653
CODE_9EA64E:
	cpy.w #$000C
	bpl CODE_9EA65A
CODE_9EA653:
	lda.w #$0009
	sta.b $A5
	bra CODE_9EA65E
CODE_9EA65A:
	jsl.l CODE_9BB445
CODE_9EA65E:
	lda.b $89
	sta.w $1D5A
	lda.b $8A
	sta.w $1D5B
	jsl.l $001D59
	lda.b $A5
	sta.w $10A3,x
	cmp.w #$0008
	bcc CODE_9EA694
	lda.w $0EC3,x
	ora.w $0EE3,x
	bne CODE_9EA694
	lda.w $0D71
	sec
	sbc.w $0D55,x
	sta.b $A5
	lda.w $0DD3
	sec
	sbc.w $0DB7,x
	sta.b $A9
	jsl.l CODE_9BB445
CODE_9EA694:
	lda.w $10A3,x
	sta.b $A5
	jml.l CODE_9EA8A9
CODE_9EA69D:
	lda.w $1283,x
	bit.w #$0002
	beq CODE_9EA6CC
	and.w #$FFFD
	sta.w $1283,x
	lda.w #$005A
	sta.w $1043,x
	lda.w $0CEB
	bpl CODE_9EA6BC
	lda.w #$FFA6
	sta.w $1043,x
CODE_9EA6BC:
	lda.w $0D37
	sta.w $1063,x
	lda.w #$F68E
	sta.w $14E3,x
	jsl.l CODE_9EA3F1
CODE_9EA6CC:
	lda.w $1043,x
	sec
	sbc.w $0D55,x
	sta.b $A5
	lda.w $1063,x
	sec
	sbc.w $0DB7,x
	sta.b $A9
	jsl.l CODE_9BB445
	lda.b $A5
	cmp.w #$0008
	bpl CODE_9EA6F9
	lda.b $A5
	sta.b $AD
	sta.w $1163,x
	lda.w #$0014
	sta.w $14E3,x
	jmp.w $A719
CODE_9EA6F9:
	rtl
CODE_9EA6FA:
	lda.w #$FFFF
	sta.b $AD
CODE_9EA6FF:
	inc.b $AD
	lda.b $89
	clc
	adc.b $AD
	tay
	sep #$20
	lda.w $18BA,y
	sta.w $18B9,y
	rep #$30
	bit.w #$0080
	beq CODE_9EA6FF
	dec.b $89
	rtl
CODE_9EA719:
	asl.b $AD
	asl.b $AD
	ldx.b $AD
	lda.l DATA8_9EA889+2,x
	sta.b $A9
	lda.l DATA8_9EA889,x
	sta.b $A5
	ldx.b $E4
	lda.w $1123,x
	beq CODE_9EA738
	eor.b $A5
	bpl CODE_9EA738
	stz.b $A5
CODE_9EA738:
	lda.w $1103,x
	beq CODE_9EA743
	eor.b $A9
	bmi CODE_9EA743
	stz.b $A9
CODE_9EA743:
	lda.w $12C3,x
	lsr a
	lsr a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0020
	clc
	adc.w $12E3,x
	sta.b $AD
	lda.w $12E3,x
	lsr a
	adc.b $AD
	sta.b $AD
	lda.w $0F43,x
	bne CODE_9EA78C
	lda.w $19D4,x
	bmi CODE_9EA77B
	cpx.w $0AD9
	beq CODE_9EA77B
	lda.w $12E3,x
	asl a
	adc.b $AD
	adc.w #$0008
	sta.b $AD
	bra CODE_9EA78C
CODE_9EA77B:
	lda.b $AD
	ldy.w $0D07
	bmi CODE_9EA786
	sec
	sbc.w $12E3,x
CODE_9EA786:
	clc
	adc.w #$0008
	sta.b $AD
CODE_9EA78C:
	lda.b $AD
	pha
	ldx.b $A5
	jsl.l CODE_808F5D
	tax
	lda.b $C1
	jsl.l CODE_808FC9
	ldx.b $E4
	lda.b $08
	adc.w $0EC3,x
	sta.b $A5
	xba
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9EA7B1
	ora.w #$FF00
CODE_9EA7B1:
	tax
	jsl.l CODE_808F7D
	sta.b $B1
	pla
	ldx.b $A9
	jsl.l CODE_808F5D
	tax
	lda.b $C1
	jsl.l CODE_808FC9
	ldx.b $E4
	lda.b $08
	adc.w $0EE3,x
	sta.b $A9
	xba
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9EA7DB
	ora.w #$FF00
CODE_9EA7DB:
	tax
	jsl.l CODE_808F7D
	clc
	adc.b $B1
	sta.b $B1
	lda.b $A9
	pha
	lda.b $A5
	pha
	ldx.b $E4
	jsl.l $9FDCB2
	lda.w $1303,x
	pha
	lda.l $7E34C6
	cmp.w #$0002
	bne CODE_9EA803
	lda.w #$1000
	sta.b $A5
CODE_9EA803:
	lda.b $A5
	lsr a
	clc
	adc.w #$0800
	tax
	pla
	asl a
	asl a
	asl a
	asl a
	jsl.l CODE_808F98
	lda.b $0A
	asl a
	asl a
	tax
	lda.l DATA8_80D9C6,x
	sta.b $AD
	lda.l DATA8_80D9C6+2,x
	sta.b $AF
	ldx.b $E4
	lda.w $0F43,x
	bne CODE_9EA845
	lda.w $19D4,x
	bmi CODE_9EA845
	lda.w $0B05,x
	bit.w #$0004
	bne CODE_9EA845
	lda.b $AF
	lsr a
	lsr a
	eor.w #$FFFF
	inc a
	adc.b $AF
	sta.b $AF
CODE_9EA845:
	pla
	sta.b $A5
	pla
	sta.b $A9
	lda.b $AF
	cmp.b $B1
	bcc CODE_9EA85B
	lda.b $A5
	sta.w $0EC3,x
	lda.b $A9
	sta.w $0EE3,x
CODE_9EA85B:
	lda.l $7E34C6
	beq CODE_9EA888
	lda.w $0792
	and.w #$003F
	bne CODE_9EA888
	jsl.l $9FDCB2
	lda.b $A5
	sec
	sbc.w #$0021
	sta.b $A5
	cmp.w #$0C00
	bmi CODE_9EA884
	lda.w $1423,x
	sta.b $AD
	clc
	adc.b $A5
	sta.b $A5
CODE_9EA884:
	jml.l $9FDCD3
CODE_9EA888:
	rtl
DATA8_9EA889:		; x and y steps (words) for eight directions
	dw $0000,$0006,$0004,$0004,$0006,$0000,$0004,$FFFC
	dw $0000,$FFFA,$FFFC,$FFFC,$FFFA,$0000,$FFFC,$0004
CODE_9EA8A9:
	lda.w $0F43,x
	bne CODE_9EA8B2
	jml.l $9ECFDC
CODE_9EA8B2:
	lda.w $11A3,x
	cmp.w #$F208
	beq CODE_9EA8ED
	lda.w #$EA1A
	sta.b $A9
	lda.w $1523,x
	beq CODE_9EA8C9
	lda.w #$F0D2
	sta.b $A9
CODE_9EA8C9:
	lda.b $A5
	and.w #$000F
	sta.b $A5
	cmp.w #$0008
	bcc CODE_9EA8EE
	cmp.w #$0009
	bne CODE_9EA8E5
	lda.w $0EC3,x
	ora.w $0EE3,x
	beq CODE_9EA8E5
	jmp.w $A4F7
CODE_9EA8E5:
	lda.w $1543,x
	bne CODE_9EA8ED
	jmp.w $A3DD
CODE_9EA8ED:
	rtl
CODE_9EA8EE:
	lda.b $A9
	pha
	lda.b $A5
	pha
	sta.b $AD
	cpx.w $0AD9
	bne CODE_9EA8FE
	jmp.w $A9AD
CODE_9EA8FE:
	lda.w $0D71
	sec
	sbc.w $0D55,x
	sta.b $A5
	lda.w $0DB7,x
	sta.b $B1
	lda.w $0EFF
	xba
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9EA91B
	ora.w #$FF00
CODE_9EA91B:
	clc
	adc.w $0DD3
	sec
	sbc.b $B1
	sta.b $A9
	lda.w $14C3,x
	bne CODE_9EA948
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
	lda.w #$0000
	sec
	sbc.b $A9
	sta.b $A9
	lda.w #$0000
	sec
	sbc.b $B1
	sta.b $B1
	lda.b $AD
	eor.w #$0004
	sta.b $AD
CODE_9EA948:
	lda.w $1523,x
	bne CODE_9EA967
	lda.b $B1
	bpl CODE_9EA9AD
	lda.b $AD
	cmp.w #$0004
	bne CODE_9EA9AD
	jsl.l CODE_9BB445
	inc a
	and.w #$0007
	cmp.w #$0003
	bcs CODE_9EA9AD
	bra CODE_9EA983
CODE_9EA967:
	lda.b $AD
	sec
	sbc.w #$0003
	and.w #$0007
	cmp.w #$0003
	bcs CODE_9EA9AD
	jsl.l CODE_9BB445
	inc a
	inc a
	and.w #$0007
	cmp.w #$0005
	bcs CODE_9EA9AD
CODE_9EA983:
	lda.w $1523,x
	bne CODE_9EA9B0
	lda.w $0EC3,x
	sta.b $A5
	ora.w $0EE3,x
	beq CODE_9EA9A7
	lda.w $0EE3,x
	sta.b $A9
	jsl.l CODE_9BB445
	sec
	sbc.b $01,s
	inc a
	and.w #$0007
	cmp.w #$0003
	bcs CODE_9EA9B0
CODE_9EA9A7:
	inc a
	sta.w $1523,x
	bra CODE_9EA9B0
CODE_9EA9AD:
	stz.w $1523,x
CODE_9EA9B0:
	pla
	sta.b $A5
	pla
	sta.b $A9
	lda.w $1163,x
	sta.b $AD
	lda.b $A5
	sec
	sbc.b $AD
	and.w #$0007
	asl a
	sta.b $A5
	tax
	lda.l DATA8_9EAAA3,x
	ldx.b $95
	cmp.w #$0000
	bne CODE_9EA9D5
	jmp.w $AAB3
CODE_9EA9D5:
	tax
	lda.b $C1
	jsl.l CODE_808F5D
	ldx.b $95
	sta.b $C5
	lda.w $0EC3,x
	xba
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9EA9EF
	ora.w #$FF00
CODE_9EA9EF:
	tax
	jsl.l CODE_808F7D
	sta.b $B5
	ldx.b $95
	lda.w $0EE3,x
	xba
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9EAA07
	ora.w #$FF00
CODE_9EAA07:
	tax
	jsl.l CODE_808F7D
	clc
	adc.b $B5
	sta.b $B1
	lda.w #$0300
	sec
	sbc.b $B1
	sta.b $B5
	sec
	sbc.w #$0180
	bpl CODE_9EAA24
	lda.w #$0180
	sta.b $B5
CODE_9EAA24:
	lda.b $C5
	ldx.b $B5
	jsl.l CODE_808FEB
	lda.b $0A
	sta.b $B7
	lda.b $08
	sta.b $B5
	ldx.b $95
	lda.w $1523,x
	beq CODE_9EAA4A
	lda.w #$0000
	sec
	sbc.b $B5
	sta.b $B5
	lda.w #$0000
	sbc.b $B7
	sta.b $B7
CODE_9EAA4A:
	lda.w $1183,x
	clc
	adc.b $B5
	sta.w $1183,x
	lda.w $1163,x
	adc.b $B7
	and.w #$0007
	sta.w $1163,x
	sta.b $AD
	lda.b $B1
	cmp.w #$0015
	bcc CODE_9EAA89
	stz.b $A9
	lda.b $C5
	bpl CODE_9EAA72
	lda.w #$FFCE
	sta.b $A9
CODE_9EAA72:
	lda.w $0E03,x
	bit.w #$0800
	beq CODE_9EAA81
	lda.b $A9
	eor.w #$FFCE
	sta.b $A9
CODE_9EAA81:
	lda.b $A9
	clc
	adc.w #$EBE2
	sta.b $A9
CODE_9EAA89:
	lda.w $1543,x
	bne CODE_9EAA98
	jsl.l CODE_9EA3DD
	lda.w #$0001
	sta.w $1543,x
CODE_9EAA98:
	lda.b $B1
	cmp.w #$0003
	bcc CODE_9EAAA2
	jmp.w $AB64
CODE_9EAAA2:
	rtl
DATA8_9EAAA3:		; steps for eight directions
	dw $0000,$0011,$0011,$0011,$0000,$FFEF,$FFEF,$FFEF
CODE_9EAAB3:
	lda.w #$0002
	sta.b $B5
	lda.w $1523,x
	beq CODE_9EAAC9
	lda.w #$0006
	sta.b $B5
	lda.b $A5
	eor.w #$0008
	sta.b $A5
CODE_9EAAC9:
	lda.b $A5
	beq CODE_9EAB25
	lda.w $0EC3,x
	sta.b $A5
	lda.w $0EE3,x
	sta.b $A9
	jsl.l CODE_9BB445
	bit.w #$0008
	bne CODE_9EAAF4
	sec
	sbc.w $1163,x
	clc
	adc.b $B5
	and.w #$0007
	sta.b $A5
	cmp.w #$0004
	bcs CODE_9EAAF4
	jmp.w $A4F7
CODE_9EAAF4:
	inc.w $1163,x
	lda.w $0E03,x
	bit.w #$0800
	beq CODE_9EAB05
	dec.w $1163,x
	dec.w $1163,x
CODE_9EAB05:
	lda.w $1163,x
	and.w #$0007
	sta.w $1163,x
	lda.w #$EA1A
	sta.b $A9
	lda.w $1523,x
	bne CODE_9EAB1B
	jmp.w $A3DD
CODE_9EAB1B:
	ldy.w #$0001
	lda.w #$F0D2
	jml.l CODE_9EA3F1
CODE_9EAB25:
	ldy.w #$0001
	lda.w #$F104
	sta.b $A9
	lda.w $1523,x
	bne CODE_9EAB57
	ldy.w #$0000
	lda.w #$EAFE
	sta.b $A9
	lda.w $1283,x
	bit.w #$0004
	beq CODE_9EAB4A
	ldy.w #$0001
	lda.w #$F7B2
	sta.b $A9
CODE_9EAB4A:
	cpx.w $0AD9
	bne CODE_9EAB57
	ldy.w #$0000
	lda.w #$EA4C
	sta.b $A9
CODE_9EAB57:
	lda.w $1543,x
	bne CODE_9EAB64
	tya
	sta.w $1543,x
	jsl.l CODE_9EA3DD
CODE_9EAB64:
	lda.w $1523,x
	beq CODE_9EAB70
	lda.b $AD
	eor.w #$0004
	sta.b $AD
CODE_9EAB70:
	jml.l CODE_9EA719
CODE_9EAB74:
	phb
	phk
	plb
	stz.b $C9
	lda.w $0D55,x
	sta.b $0C
	lda.w $0DB7,x
	sta.b $0E
	lda.b $A5
	sta.b $10
	lda.b $A9
	sta.b $12
	lda.w $0F43,x
	bne CODE_9EAB93
	jmp.w $ADCF
CODE_9EAB93:
	ldx.w #$00E5
	ldy.w #$011C
	jsr.w $AD4E
	ldx.w #$00E4
	ldy.w #$011D
	stx.b $14
	sty.b $16
	lda.w #$0108
	sta.b $22
	lda.w $0B9D
	sta.b $20
	lda.b $C9
	bne CODE_9EABD9
	ldx.w #$FEE4
	ldy.w #$FF1B
	jsr.w $AD4E
	ldx.w #$FEE3
	ldy.w #$FF1C
	stx.b $14
	sty.b $16
	lda.w #$FEF8
	sta.b $22
	lda.w $0B9F
	sta.b $20
	lda.b $C9
	bne CODE_9EAC09
	ldx.b $E4
	plb
	rtl
CODE_9EABD9:
	lda.b $14
	ldy.b $16
	sty.b $14
	sta.b $16
	lda.b $0E
	eor.w #$FFFF
	inc a
	sta.b $0E
	lda.b $12
	eor.w #$FFFF
	inc a
	sta.b $12
	lda.b $C5
	bit.w #$000A
	beq CODE_9EABFD
	eor.w #$000A
	sta.b $C5
CODE_9EABFD:
	lda.b $C7
	bit.w #$000A
	beq CODE_9EAC09
	eor.w #$000A
	sta.b $C7
CODE_9EAC09:
	lda.b $C7
	beq CODE_9EAC16
	ldx.b $C5
	jsr (DATA8_9EAD34,x)
	ldx.b $E4
	plb
	rtl
CODE_9EAC16:
	jsr.w $AC1D
	ldx.b $E4
	plb
	rtl
CODE_9EAC1D:
	ldx.b $E4
	lda.b $0E
	cmp.w #$FEF8
	bpl CODE_9EAC2F
	lda.b $12
	cmp.w #$FEF8
	bmi CODE_9EAC49
	bra CODE_9EAC67
CODE_9EAC2F:
	lda.b $12
	cmp.w #$FEF8
	bmi CODE_9EAC54
	ldy.b $20
	bmi CODE_9EAC49
	lda.b $0C
	cmp.b $10
	bmi CODE_9EAC4A
	cmp.w $0D55,y
	bmi CODE_9EAC49
	lda.b $16
	sta.b $A9
CODE_9EAC49:
	rts
CODE_9EAC4A:
	cmp.w $0D55,y
	bpl CODE_9EAC53
	lda.b $16
	sta.b $A9
CODE_9EAC53:
	rts
CODE_9EAC54:
	lda.b $16
	sta.b $A9
	bra CODE_9EAC95
CODE_9EAC5A:
	lda.w #$FFCA
	sta.b $A5
	rts
CODE_9EAC60:
	lda.b $0E
	cmp.w #$FEF8
	bpl CODE_9EAC79
CODE_9EAC67:
	lda.b $0C
	cmp.w #$FFCB
	bmi CODE_9EAC5A
	cmp.w #$0036
	bpl CODE_9EACE2
	lda.b $14
	sta.b $A9
	bra CODE_9EACBA
CODE_9EAC79:
	lda.b $12
	cmp.w #$FEF8
	bpl CODE_9EAC91
	lda.b $22
	sta.b $A9
	ldy.b $20
	bmi CODE_9EACBA
	lda.b $0C
	cmp.w $0D55,y
	bmi CODE_9EAC5A
	bra CODE_9EACE2
CODE_9EAC91:
	ldy.b $20
	bmi CODE_9EACD3
CODE_9EAC95:
	lda.b $10
	sec
	sbc.w $0D55,y
	pha
	lda.b $0C
	sec
	sbc.b $10
	eor.b $01,s
	bpl CODE_9EACD4
	pla
	lda.b $0C
	cmp.w $0D55,y
	bpl CODE_9EACE2
	bra CODE_9EAD14
CODE_9EACAF:
	lda.b $16
	sta.b $A9
	lda.b $C7
	and.w #$0008
	bne CODE_9EACD3
CODE_9EACBA:
	lda.b $10
	bpl CODE_9EACC9
	cmp.w #$FFCB
	bmi CODE_9EACD3
	lda.w #$FFCA
	sta.b $A5
	rts
CODE_9EACC9:
	cmp.w #$0036
	bpl CODE_9EACD3
	lda.w #$0036
	sta.b $A5
CODE_9EACD3:
	rts
CODE_9EACD4:
	pla
	rts
CODE_9EACD6:
	lda.b $C7
	cmp.w #$0010
	bne CODE_9EACE2
CODE_9EACDD:
	lda.b $16
	sta.b $A9
	rts
CODE_9EACE2:
	lda.w #$0036
	sta.b $A5
	rts
CODE_9EACE8:
	lda.w #$0036
	sta.b $A5
	lda.b $C7
	and.w #$000A
	beq CODE_9EACDD
	rts
CODE_9EACF5:
	lda.b $C7
	cmp.w #$0010
	bne CODE_9EACE2
CODE_9EACFC:
	lda.b $14
	sta.b $A9
	rts
CODE_9EAD01:
	lda.b $14
	sta.b $A9
	lda.b $C7
	and.w #$0002
	bne CODE_9EACBA
	rts
CODE_9EAD0D:
	lda.b $C7
	cmp.w #$0004
	beq CODE_9EACFC
CODE_9EAD14:
	lda.w #$FFCA
	sta.b $A5
	rts
CODE_9EAD1A:
	lda.w #$FFCA
	sta.b $A5
	lda.b $C7
	and.w #$000A
	beq CODE_9EACDD
	rts
CODE_9EAD27:
	lda.b $C7
	cmp.w #$0004
	beq CODE_9EACDD
CODE_9EAD2E:
	lda.w #$FFCA
	sta.b $A5
	rts
DATA8_9EAD34:		; jump table for jsr (DATA8_9EAD34,x)
	dw CODE_9EAC60,CODE_9EACAF,CODE_9EACE8,CODE_9EACD6,CODE_9EAD01,$0000,CODE_9EACF5
	dw $0000,CODE_9EAD1A,CODE_9EAD27,$0000,$0000,CODE_9EAD0D
CODE_9EAD4E:
	stx.b $14
	sty.b $16
	stz.b $C5
	stz.b $C7
	ldx.b $0E
	ldy.b $12
	cpx.b $14
	bpl CODE_9EAD81
	lda.w #$0008
	sta.b $C5
	cpy.b $14
	bpl CODE_9EAD8A
CODE_9EAD67:
	rts
CODE_9EAD68:
	cpy.b $16
	bmi CODE_9EAD97
	lda.w #$0002
	sta.b $C7
	bra CODE_9EAD97
CODE_9EAD73:
	cpy.w #$002C
	bmi CODE_9EADAC
	lda.b $C7
	ora.w #$0004
	sta.b $C7
	bra CODE_9EADAC
CODE_9EAD81:
	cpy.b $14
	bpl CODE_9EAD8A
	lda.w #$0008
	sta.b $C7
CODE_9EAD8A:
	cpx.b $16
	bmi CODE_9EAD68
	lda.w #$0002
	sta.b $C5
	cpy.b $16
	bpl CODE_9EAD67
CODE_9EAD97:
	ldx.b $0C
	ldy.b $10
	cpx.w #$002C
	bmi CODE_9EAD73
	lda.b $C5
	ora.w #$0004
	sta.b $C5
	cpy.w #$002C
	bpl CODE_9EAD67
CODE_9EADAC:
	cpx.w #$FFD4
	bpl CODE_9EADC0
	lda.b $C5
	ora.w #$0010
	sta.b $C5
	cpy.w #$FFD4
	bmi CODE_9EAD67
CODE_9EADBD:
	inc.b $C9
	rts
CODE_9EADC0:
	cpy.w #$FFD4
	bpl CODE_9EADBD
	lda.b $C7
	ora.w #$0010
	sta.b $C7
	inc.b $C9
	rts
CODE_9EADCF:
	ldx.w #$0102
	ldy.w #$011C
	jsr.w $AF34
	ldx.w #$0101
	ldy.w #$011D
	stx.b $14
	sty.b $16
	lda.b $C9
	bne CODE_9EAE01
	ldx.w #$FEE4
	ldy.w #$FEFE
	jsr.w $AF34
	ldx.w #$FEE3
	ldy.w #$FEFF
	stx.b $14
	sty.b $16
	lda.b $C9
	bne CODE_9EAE31
	ldx.b $E4
	plb
	rtl
CODE_9EAE01:
	lda.b $14
	ldy.b $16
	sty.b $14
	sta.b $16
	lda.b $0E
	eor.w #$FFFF
	inc a
	sta.b $0E
	lda.b $12
	eor.w #$FFFF
	inc a
	sta.b $12
	lda.b $C5
	bit.w #$000A
	beq CODE_9EAE25
	eor.w #$000A
	sta.b $C5
CODE_9EAE25:
	lda.b $C7
	bit.w #$000A
	beq CODE_9EAE31
	eor.w #$000A
	sta.b $C7
CODE_9EAE31:
	lda.b $C7
	beq CODE_9EAE3E
	ldx.b $C5
	jsr (DATA8_9EAF1A,x)
	ldx.b $E4
	plb
	rtl
CODE_9EAE3E:
	jsr.w $AE45
	ldx.b $E4
	plb
	rtl
CODE_9EAE45:
	ldx.b $E4
	lda.b $0E
	cmp.w #$FEF8
	bpl CODE_9EAE57
	lda.b $12
	cmp.w #$FEF8
	bmi CODE_9EAE60
	bra CODE_9EAE78
CODE_9EAE57:
	lda.b $12
	cmp.w #$FEF8
	bpl CODE_9EAE60
	bra CODE_9EAE91
CODE_9EAE60:
	rts
CODE_9EAE61:
	cmp.w $0D55,y
	bpl CODE_9EAEBB
	lda.b $16
	sta.b $A9
	rts
CODE_9EAE6B:
	lda.w #$FFDA
	sta.b $A5
	rts
CODE_9EAE71:
	lda.b $0E
	cmp.w #$FEF8
	bpl CODE_9EAE8A
CODE_9EAE78:
	lda.b $0C
	cmp.w #$FFDB
	bmi CODE_9EAE6B
	cmp.w #$0026
	bpl CODE_9EAEC8
	lda.b $14
	sta.b $A9
	bra CODE_9EAEA2
CODE_9EAE8A:
	lda.b $C7
	bit.w #$0002
	bne CODE_9EAEBB
CODE_9EAE91:
	lda.b $16
	sta.b $A9
	bra CODE_9EAEA2
CODE_9EAE97:
	lda.b $16
	sta.b $A9
	lda.b $C7
	and.w #$0008
	bne CODE_9EAEBB
CODE_9EAEA2:
	lda.b $10
	bpl CODE_9EAEB1
	cmp.w #$FFDB
	bmi CODE_9EAEBB
	lda.w #$FFDA
	sta.b $A5
	rts
CODE_9EAEB1:
	cmp.w #$0026
	bpl CODE_9EAEBB
	lda.w #$0026
	sta.b $A5
CODE_9EAEBB:
	rts
CODE_9EAEBC:
	lda.b $C7
	cmp.w #$0010
	bne CODE_9EAEC8
CODE_9EAEC3:
	lda.b $16
	sta.b $A9
	rts
CODE_9EAEC8:
	lda.w #$0026
	sta.b $A5
	rts
CODE_9EAECE:
	lda.w #$0026
	sta.b $A5
	lda.b $C7
	and.w #$000A
	beq CODE_9EAEC3
	rts
CODE_9EAEDB:
	lda.b $C7
	cmp.w #$0010
	bne CODE_9EAEC8
CODE_9EAEE2:
	lda.b $14
	sta.b $A9
	rts
CODE_9EAEE7:
	lda.b $14
	sta.b $A9
	lda.b $C7
	and.w #$0002
	bne CODE_9EAEA2
	rts
CODE_9EAEF3:
	lda.b $C7
	cmp.w #$0004
	beq CODE_9EAEE2
	lda.w #$FFDA
	sta.b $A5
	rts
CODE_9EAF00:
	lda.w #$FFDA
	sta.b $A5
	lda.b $C7
	and.w #$000A
	beq CODE_9EAEC3
	rts
CODE_9EAF0D:
	lda.b $C7
	cmp.w #$0004
	beq CODE_9EAEC3
	lda.w #$FFDA
	sta.b $A5
	rts
DATA8_9EAF1A:		; jump table for jsr (DATA8_9EAF1A,x)
	dw CODE_9EAE71,CODE_9EAE97,CODE_9EAECE,CODE_9EAEBC,CODE_9EAEE7,$0000,CODE_9EAEDB
	dw $0000,CODE_9EAF00,CODE_9EAF0D,$0000,$0000,CODE_9EAEF3
CODE_9EAF34:
	stx.b $14
	sty.b $16
	stz.b $C5
	stz.b $C7
	ldx.b $0E
	ldy.b $12
	cpx.b $14
	bpl CODE_9EAF67
	lda.w #$0008
	sta.b $C5
	cpy.b $14
	bpl CODE_9EAF70
CODE_9EAF4D:
	rts
CODE_9EAF4E:
	cpy.b $16
	bmi CODE_9EAF7D
	lda.w #$0002
	sta.b $C7
	bra CODE_9EAF7D
CODE_9EAF59:
	cpy.w #$0024
	bmi CODE_9EAF92
	lda.b $C7
	ora.w #$0004
	sta.b $C7
	bra CODE_9EAF92
CODE_9EAF67:
	cpy.b $14
	bpl CODE_9EAF70
	lda.w #$0008
	sta.b $C7
CODE_9EAF70:
	cpx.b $16
	bmi CODE_9EAF4E
	lda.w #$0002
	sta.b $C5
	cpy.b $16
	bpl CODE_9EAF4D
CODE_9EAF7D:
	ldx.b $0C
	ldy.b $10
	cpx.w #$0024
	bmi CODE_9EAF59
	lda.b $C5
	ora.w #$0004
	sta.b $C5
	cpy.w #$0024
	bpl CODE_9EAF4D
CODE_9EAF92:
	cpx.w #$FFDC
	bpl CODE_9EAFA6
	lda.b $C5
	ora.w #$0010
	sta.b $C5
	cpy.w #$FFDC
	bmi CODE_9EAF4D
CODE_9EAFA3:
	inc.b $C9
	rts
CODE_9EAFA6:
	cpy.w #$FFDC
	bpl CODE_9EAFA3
	lda.b $C7
	ora.w #$0010
	sta.b $C7
	inc.b $C9
	rts
CODE_9EAFB5:
	jsl.l $9EDEA7
	lda.w $1023,x
	sec
	sbc.b $C1
	sta.w $1023,x
	bmi CODE_9EAFC7
	jmp.w $B070
CODE_9EAFC7:
	adc.w #$0005
	sta.w $1023,x
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
	beq CODE_9EAFF1
	ora.w #$FF00
CODE_9EAFF1:
	clc
	adc.b $01,s
	sec
	sbc.w $0D55,x
	sta.b $A5
	lda.b $A9
	eor.w #$FFFF
	inc a
