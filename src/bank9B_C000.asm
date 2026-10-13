; Bank $9B, fifth 4 KB: screen code, with auto labels for now: the Other Scores screen (No Other Games.), the short
; names DATA8_9BC5E7 and DATA8_9BC5F5 (NY Islanders, NY Rangers) as text records, then the password screen. Passwords
; are written with the characters of PasswordChars (consonants, digits and a dash); Bad Password is shown for one
; that does not decode. The bank ends with $FF fill.

org $9BC001
CODE_9BC001:
	rtl
CODE_9BC002:
	phx
	tay
	lda.w $0D97,y
	dec a
	asl a
	asl a
	tax
	lda.l SpriteFrames,x
	clc
	adc.w #$8000
	sta.b $0C
	lda.l SpriteFrames+2,x
	adc.w #$0082
	sta.b $0E
	tyx
	ldy.w #$0012
	lda.b [$0C],y
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9BC02F
	ora.w #$FF00
CODE_9BC02F:
	sta.b $A5
	iny
	lda.b [$0C],y
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9BC03F
	ora.w #$FF00
CODE_9BC03F:
	sta.b $A9
	lda.w $0E03,x
	bit.w #$0800
	beq CODE_9BC051
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
CODE_9BC051:
	lda.w $0E03,x
	bit.w #$1000
	bne CODE_9BC061
	lda.w #$0000
	sec
	sbc.b $A9
	sta.b $A9
CODE_9BC061:
	lda.w sfhormode
	beq CODE_9BC072
	lda.b $A5
	ldy.b $A9
	eor.w #$FFFF
	inc a
	sta.b $A9
	sty.b $A5
CODE_9BC072:
	plx
	rtl
CODE_9BC074:
	phx
	tay
	lda.w $0D97,y
	dec a
	asl a
	asl a
	tax
	lda.l SpriteFrames,x
	clc
	adc.w #$8000
	sta.b $0C
	lda.l SpriteFrames+2,x
	adc.w #$0082
	sta.b $0E
	tyx
	ldy.w #$0012
	lda.b [$0C],y
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9BC0A1
	ora.w #$FF00
CODE_9BC0A1:
	sta.b $A5
	iny
	lda.b [$0C],y
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9BC0B1
	ora.w #$FF00
CODE_9BC0B1:
	sta.b $A9
	iny
	lda.b [$0C],y
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9BC0C1
	ora.w #$FF00
CODE_9BC0C1:
	sec
	sbc.b $A5
	sta.b $A5
	iny
	lda.b [$0C],y
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9BC0D4
	ora.w #$FF00
CODE_9BC0D4:
	sec
	eor.w #$FFFF
	adc.b $A9
	sta.b $A9
	lda.w $0E03,x
	bit.w #$0800
	beq CODE_9BC0EC
CODE_9BC0E4:
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
CODE_9BC0EC:
	lda.w $0E03,x
	bit.w #$1000
	bne CODE_9BC0FC
	lda.w #$0000
	sec
	sbc.b $A9
	sta.b $A9
CODE_9BC0FC:
	lda.w sfhormode
	beq CODE_9BC10D
	lda.b $A5
	ldy.b $A9
	eor.w #$FFFF
	inc a
	sta.b $A9
	sty.b $A5
CODE_9BC10D:
	plx
	rtl
CODE_9BC10F:
	lda.w sfhormode
	beq CODE_9BC128
	lda.b $A5
	pha
	lda.b $A9
	eor.w #$FFFF
	inc a
	sta.b $A5
	pla
	sec
	sbc.w #$00C5
	sta.b $A9
	bra CODE_9BC138
CODE_9BC128:
	lda.b $A5
	sec
	sbc.w $0CEB
	sta.b $A5
	lda.b $A9
	sec
	sbc.w $0D37
	sta.b $A9
CODE_9BC138:
	lda.b $A5
	cmp.w #$FF6F
	bmi CODE_9BC16E
	cmp.w #$0091
	bpl CODE_9BC16E
	lda.b $A5
	clc
	adc.w #$0080
	sta.b $A5
	lda.b $AD
	asl a
	clc
	adc.b $AD
	pha
	asl a
	pla
	ror a
	clc
	adc.b $A9
	sta.b $A9
	cmp.w #$FF6F
	bmi CODE_9BC16E
	cmp.w #$0091
	bpl CODE_9BC16E
	lda.w #$0070
	sec
	sbc.b $A9
	sta.b $A9
	rtl
CODE_9BC16E:
	lda.w #$4E20
	sta.b $A9
	rtl
CODE_9BC174:
	txa
	lsr a
	ldy.b $B5
	sta.w $0AE7,y
	rtl
CODE_9BC17C:
	lda.w HomeTeam
	asl a
	asl a
	asl a
	tax
	lda.l CenterIceTable,x
	sta.b $0C
	lda.l CenterIceTable+2,x
	sta.b $0E
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	lda.w #$007F
	sta.b $12
	sta.b $0E
	stz.b $0C
	stx.b $10
	stx.b $00
	jsl.l LinearToPlanar
	ldx.b $10
	stx.b $0C
	txa
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	adc.l $7E35B8
	sta.l $7E35BA
	lda.l $7E35B8
	asl a
	asl a
	asl a
	asl a
	adc.w #$1000
	tay
	jsl.l CODE_80891F
	jsl.l CODE_9BC1D5
	rtl
CODE_9BC1D5:
	lda.w #$0092
	sta.b $0E
	lda.w #IceRinkMap
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$C800
	sta.b $10
	jsl.l Decompress
	lda.w HomeTeam
	asl a
	asl a
	asl a
	tax
	lda.l CenterIceTable+4,x
	sta.b $0C
	lda.l CenterIceTable+6,x
	sta.b $0E
	lda.w #$007F
	sta.b $12
	lda.w #$D8B6
	sec
	sbc.b [$0C]
	sta.b $10
	lda.b [$0C]
	asl a
	sta.b $14
	inc.b $0C
	inc.b $0C
	lda.b [$0C]
	tay
	cmp.w #$0006
	bcc CODE_9BC226
	lda.b $10
	sec
	sbc.w #$0060
	sta.b $10
CODE_9BC226:
	lda.b $0C
	clc
	adc.w #$0004
	sta.b $0C
CODE_9BC22E:
	ldx.w #$0000
CODE_9BC231:
	lda.b [$0C]
	clc
	adc.l $7E35B8
	adc.w #$1400
	sta.b [$10]
	inx
	inx
	inc.b $0C
	inc.b $0C
	inc.b $10
	inc.b $10
	cpx.b $14
	bne CODE_9BC231
	lda.b $10
	clc
	adc.w #$0060
	sec
	sbc.b $14
	sta.b $10
	dey
	bne CODE_9BC22E
	rtl
CODE_9BC25A:
	lda.w #$001C
	sta.l $7E3454
	lda.w #$001D
	sta.l $7E3452
	jsl.l CODE_9DD9AD
	ldx.w #$0049
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF1E1
	sta.b $8D
	jsl.l CODE_9C936C
	jsl.l SpriteFrameEnd
	jsl.l CODE_9DE0D4
	stz.w $1DB9
	lda.w #$0000
	cmp.l $7E35D6
	bne CODE_9BC295
CODE_9BC294:
	inc a
CODE_9BC295:
	sta.w $1DBD
	jsl.l GetShifter
	lda.b $A9
	inc a
	sta.w $1DC1
	jsl.l CODE_9BC49A
	jsl.l CODE_9DD923
	lda.w #$0050
	ldx.w #$00C0
	ldy.w #$00D8
	jsl.l CODE_9BCDF8
	jsl.l CODE_9DDFF6
	jsl.l CODE_8086BD
	lda.w #$0005
	sta.w $1DC5
	jsl.l CODE_9BC44B
CODE_9BC2C9:
	jsl.l CODE_9B851F
	lda.b $B1
	bit.w #$1000
	beq CODE_9BC2D7
	jmp.w $C43B
CODE_9BC2D7:
	bit.w #$0800
	beq CODE_9BC2DF
CODE_9BC2DC:
	jmp.w $C3DA
CODE_9BC2DF:
	bit.w #$0400
	bne CODE_9BC35C
CODE_9BC2E4:
	lda.w $1DBD
	beq CODE_9BC316
	dec a
	bne CODE_9BC2F2
CODE_9BC2EC:
	cmp.l $7E35D6
	beq CODE_9BC316
CODE_9BC2F2:
	lda.w #$0004
	sta.w printx
	lda.w $1DBD
	asl a
	adc.w $1DBD
	sta.w printy
	lda.w #$2000
	sta.w $0D0D
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9C9363
	sta.b $8D
	jsl.l CODE_9EC894
CODE_9BC316:
	lda.w $1DBD
	clc
	adc.w $1DC5
	clc
	adc.w $1DE9
	cmp.w $1DC1
	bpl CODE_9BC351
	lda.w #$0004
	sta.w printx
	lda.w $1DBD
	clc
	adc.w $1DC5
	dec a
	sta.b $14
	asl a
	adc.b $14
	inc a
	sta.w printy
	lda.w #$2000
	sta.w $0D0D
	lda.w #$009C
	sta.b $8F
	lda.w #$9366
	sta.b $8D
	jsl.l CODE_9EC894
CODE_9BC351:
	jsl.l CODE_9BC44B
	jsl.l WaitFrame
	jmp.w $C2C9
CODE_9BC35C:
	jsr.w $C4F3
	lda.w #$0006
	sta.w $1DC5
	jsl.l CODE_9BC44B
	lda.w #$0005
	sta.w $1DC5
	lda.w $1DBD
	clc
	adc.w #$0005
	clc
	adc.w $1DE9
	cmp.w $1DC1
	bmi CODE_9BC382
	jmp.w $C2E4
CODE_9BC382:
	sec
	sbc.w #$0004
	sec
	sbc.w $1DE9
	cmp.l $7E35D6
	bne CODE_9BC3A8
CODE_9BC390:
	clc
	adc.w #$0005
	clc
	adc.w $1DE9
	cmp.w $1DC1
	bmi CODE_9BC3A0
	jmp.w $C2E4
CODE_9BC3A0:
	sec
	sbc.w #$0004
	sec
	sbc.w $1DE9
CODE_9BC3A8:
	sta.w $1DBD
	lda.w #$0001
	sta.w $1DF3
	lda.w #$0018
	sta.w $1DF5
CODE_9BC3B7:
	jsl.l WaitFrame
	inc.w $1DF3
	inc.w $1DF3
	lda.w $1DF3
	cmp.w #$0017
	bne CODE_9BC3B7
	jsl.l CODE_9BC44B
	jsl.l WaitFrame
	lda.w #$FFFF
	sta.w $1DF3
	jmp.w $C2C9
CODE_9BC3DA:
	jsr.w $C4F3
	lda.w $1DBD
	dec a
	bpl CODE_9BC3E6
	jmp.w $C2E4
CODE_9BC3E6:
	cmp.l $7E35D6
	bne CODE_9BC3F5
	cmp.w #$0000
	bne CODE_9BC3F4
	jmp.w $C2E4
CODE_9BC3F4:
	dec a
CODE_9BC3F5:
	sta.w $1DBD
	lda.w #$0006
	sta.w $1DC5
	jsl.l CODE_9BC44B
	jsl.l WaitFrame
	lda.w #$0015
	sta.w $1DF3
	lda.w #$0018
	sta.w $1DF5
CODE_9BC412:
	jsl.l WaitFrame
	dec.w $1DF3
	dec.w $1DF3
	lda.w $1DF3
	cmp.w #$0001
	bne CODE_9BC412
	lda.w #$0005
	sta.w $1DC5
	jsl.l CODE_9BC44B
	jsl.l WaitFrame
	lda.w #$FFFF
	sta.w $1DF3
	jmp.w $C2C9
CODE_9BC43B:
	rtl
CODE_9BC43C:
	lda.w #$0000
	sta.w $1DCD
CODE_9BC442:
	lda.w $1DCD
	cmp.w #$FFFF
	bne CODE_9BC442
	rts
CODE_9BC44B:
	lda.w $1DC1
	cmp.w #$0001
	bne CODE_9BC473
CODE_9BC453:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF1EF
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l CODE_9FBF75
	bra CODE_9BC499
CODE_9BC473:
	lda.w $1DBD
	asl a
	adc.w $1DBD
	xba
	lsr a
	lsr a
	adc.w #$2780
	sta.b $0C
	lda.w #$007F
	sta.b $0E
	lda.w $1DC5
	asl a
	adc.w $1DC5
	xba
	lsr a
	lsr a
	tax
	ldy.w #$0140
	jsl.l CODE_80891F
CODE_9BC499:
	rtl
CODE_9BC49A:
	lda.w #$007F
	sta.b $12
	lda.w #$2780
	sta.b $10
	ldx.w #$4D80
	lda.l $7E35B6
	clc
	adc.l $7E35A8
	jsl.l CODE_808EDF
	lda.w $1DC1
	cmp.w #$0001
	beq CODE_9BC4F2
	lda.w #$2400
	sta.w $0D0D
	lda.w #$0000
	sta.w printy
	lda.b $00
	sta.w $1DB9
	stz.w $1DE9
CODE_9BC4D0:
	cmp.l $7E35D6
	bne CODE_9BC4DB
CODE_9BC4D6:
	inc.w $1DE9
	bra CODE_9BC4E9
CODE_9BC4DB:
	lda.w $1DB9
	cmp.w $1DC1
	beq CODE_9BC4F2
	jsr.w $C543
	inc.w printy
CODE_9BC4E9:
	lda.w $1DB9
	inc a
	sta.w $1DB9
	bra CODE_9BC4D0
CODE_9BC4F2:
	rtl
CODE_9BC4F3:
	lda.w #$0004
	sta.w printx
	lda.w $1DBD
	asl a
	adc.w $1DBD
	sta.w printy
	lda.w #$2000
	sta.w $0D0D
	lda.w #$009C
	sta.b $8F
	lda.w #$9369
	sta.b $8D
	jsl.l CODE_9EC894
	lda.w #$0004
	sta.w printx
	lda.w $1DBD
	clc
	adc.w $1DC5
	dec a
	sta.b $14
	asl a
	adc.b $14
	inc a
	sta.w printy
	lda.w #$2000
	sta.w $0D0D
	lda.w #$009C
	sta.b $8F
	lda.w #$9369
	sta.b $8D
	jsl.l CODE_9EC894
	rts
CODE_9BC543:
	lda.w $1DB9
	asl a
	tax
	lda.l $7E3578,x
	sta.b $A5
	lda.l $7E3528,x
	jsr.w $C601
	inc.w printy
	lda.l $7E3588,x
	sta.b $A5
	lda.l $7E3538,x
	jsr.w $C601
	lda.w #$0017
	sta.w printx
	lda.l $7E3568,x
	sta.b $A5
	lda.l $7E3578,x
	cmp.l $7E3588,x
	beq CODE_9BC584
	lda.b $A5
	cmp.w #$0004
	bne CODE_9BC584
CODE_9BC582:
	inc.b $A5
CODE_9BC584:
	lda.w #$0080
	sta.b $8B
	lda.w #$D6E1
	sta.b $89
CODE_9BC58E:
	lda.b $8B
	sta.b $8F
	lda.b $89
	sta.b $8D
	lda.b [$89]
	clc
	adc.b $89
	sta.b $89
	dec.b $A5
	bmi CODE_9BC5A3
	bne CODE_9BC58E
CODE_9BC5A3:
	jsl.l CODE_9EC894
	inc.w printy
	rts
CODE_9BC5AB:
	cmp.w #$000D
	beq CODE_9BC5D0
	cmp.w #$000E
	beq CODE_9BC5DC
	asl a
	asl a
	tay
	lda.w #$009C
	sta.b $8F
	lda.w #TeamList
	sta.b $8D
	lda.b [$8D],y
	sta.b $8D
	ldy.w #$0004
	clc
	adc.b [$8D],y
	sta.b $8D
	bra CODE_9BC5E6
CODE_9BC5D0:
	lda.w #$009B
	sta.b $8F
	lda.w #DATA8_9BC5E7
	sta.b $8D
	bra CODE_9BC5E6
CODE_9BC5DC:
	lda.w #$009B
	sta.b $8F
	lda.w #DATA8_9BC5F5
	sta.b $8D
CODE_9BC5E6:
	rtl
DATA8_9BC5E7:		; a text record: a word (2 + the text), then the text
	dw $000E : db "NY Islanders"
DATA8_9BC5F5:
	dw $000C : db "NY Rangers"
CODE_9BC601:
	jsl.l CODE_9BC5AB
	lda.w #$0007
	sta.w printx
	jsl.l CODE_9EC894
	lda.w #$0014
	sta.w printx
	lda.w #$0002
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC894
	rts
CODE_9BC623:
	jsl.l CODE_9BCD8F
	stz.b $C1
	lda.l $7E34D0
	sta.b $A5
	lda.w #$0020
	sta.b $A9
	jsl.l CODE_9BC6BE
	lda.w $0ACF
	sta.b $A5
	lda.w #$0008
	sta.b $A9
	jsl.l CODE_9BC6BE
	lda.l $7E35D4
	sta.b $A5
	lda.w #$0004
	sta.b $A9
	jsl.l CODE_9BC6BE
	lda.l $7E34F2
	sta.b $A5
	lda.w #$0010
	sta.b $A9
	jsl.l CODE_9BC6BE
	lda.l $7E34CE
	sta.b $A5
	lda.w #$0004
	sta.b $A9
	jsl.l CODE_9BC6BE
	lda.w $0AD5
	sta.b $A5
	lda.w #$4000
	sta.b $A9
	jsl.l CODE_9BC6BE
	lda.w #$0005
	sta.b $A9
	lda.w #$0007
	sta.b $AD
	stz.b $8D
CODE_9BC68D:
	ldx.b $8D
	lda.l $7E3548,x
	sta.b $A5
	jsl.l CODE_9BC6BE
	ldx.b $8D
	lda.l $7E3558,x
	sta.b $A5
	jsl.l CODE_9BC6BE
	inc.b $8D
	inc.b $8D
	dec.b $AD
	bpl CODE_9BC68D
	lda.b $C1
	and.w #$01FF
	sta.b $A5
	lda.w #$0200
	sta.b $A9
	jsl.l CODE_9BCDB3
	rtl
CODE_9BC6BE:
	lda.b $C1
	clc
	adc.b $A5
	sta.b $C1
	jml.l CODE_9BCDB3
CODE_9BC6C9:
	lda.l $7E34F4
	bit.w #$0080
	beq CODE_9BC6D5
	jmp.w $C75D
CODE_9BC6D5:
	lda.b $A5
	pha
	lda.b $A7
	pha
	lda.b $A9
	pha
	lda.b $AB
	pha
	lda.b $89
	pha
	lda.b $8B
	pha
	lda.b $8D
	pha
	lda.b $8F
	pha
	lda.b $91
	pha
	lda.b $93
	pha
	lda.w #$009B
	sta.b $93
	lda.w #PasswordChars
	sta.b $91
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	lda.w #$007E
	sta.b $8B
	lda.w #$34F4
	sta.b $89
	lda.w #$0012
	sta.b [$8D]
	inc.b $8D
	inc.b $8D
	lda.w #$000F
	sta.b $A9
CODE_9BC71F:
	lda.b [$89]
	inc.b $89
	and.w #$00FF
	tay
	lda.b [$91],y
	sta.b [$8D]
	inc.b $8D
	dec.b $A9
	bpl CODE_9BC71F
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $93
	pla
	sta.b $91
	pla
	sta.b $8F
	pla
	sta.b $8D
	pla
	sta.b $8B
	pla
	sta.b $89
	pla
	sta.b $AB
	pla
	sta.b $A9
	pla
	sta.b $A7
	pla
	sta.b $A5
CODE_9BC75D:
	rtl
CODE_9BC75E:
	lda.l $7E34BC
	bne CODE_9BC767
	jmp.w $C7FA
CODE_9BC767:
	lda.w #$0001
	sta.l $7E34BC
	jsl.l CODE_9F94AE
	jsl.l CODE_9D9783
	lda.l $7E35D4
	cmp.w #$0004
	beq CODE_9BC7D5
	lda.l $7E35D6
	bpl CODE_9BC7AE
	lda.l $7E34CE
	sec
	sbc.w #$0002
	bmi CODE_9BC7D9
	lda.l $7E35D4
	cmp.w #$0001
	bne CODE_9BC7D9
	lda.l $7E34F2
	eor.w #$0001
	sta.l $7E34F2
	lda.l $7E34CE
	eor.w #$0001
	sta.l $7E34CE
CODE_9BC7AE:
	jsl.l CODE_9BC623
	jsl.l CODE_9BCD30
	lda.w sflags3
	bit.w #$0004
	beq CODE_9BC7D1
	ldx.w #$000E
CODE_9BC7C1:
	lda.l $7E3518,x
	sta.l $7E3508,x
	dex
	dex
	bpl CODE_9BC7C1
	jsl.l CODE_9BCC41
CODE_9BC7D1:
	jml.l CODE_9D9783
CODE_9BC7D5:
	jsl.l CODE_9BCDE2
CODE_9BC7D9:
	lda.w #$0080
	ora.l $7E34F4
	sta.l $7E34F4
	lda.w #$0002
	sta.l $7E34BC
	lda.w $0ACF
	cmp.w #$0007
	beq CODE_9BC7FA
	lda.w #$0003
	sta.l $7E34BC
CODE_9BC7FA:
	rtl
CODE_9BC7FB:
	jsl.l CODE_9F96F7
	jsl.l CODE_9F9708
	lda.w #$FF7F
	and.l $7E34F4
	sta.l $7E34F4
	jsl.l CODE_9DD977
	stz.w $0CD5
	lda.w #$03FF
	sta.w $0CD7
	jsl.l CODE_9B8017
	jsl.l CODE_9B8526
	jsl.l SpriteFrameStart
	ldx.w #$0053
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF203
	sta.b $8D
	jsl.l CODE_9C936C
	lda.w #$001C
	sta.l $7E3454
	lda.w #$001D
	sta.l $7E3452
	jsl.l CODE_9DDDB3
	jsl.l SpriteFrameEnd
	jsl.l CODE_9DE0D4
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF20D
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0011
	sta.b $A5
	lda.w #$0005
	sta.b $A9
	jsl.l CODE_9D80DD
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF212
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	dec.w printx
	dec.w printx
	lda.w #$009B
	sta.b $8B
	lda.w #PasswordChars
	sta.b $89
	lda.w #$0004
	sta.b $A5
CODE_9BC8AC:
	lda.w #$0005
	sta.b $A9
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	lda.w #$000D
	sta.b [$8D]
	inc.b $8D
	inc.b $8D
CODE_9BC8C4:
	lda.b [$89]
	sta.b [$8D]
	inc.b $89
	inc.b $8D
	lda.w #$0020
	sta.b [$8D]
	inc.b $8D
	dec.b $A9
	bpl CODE_9BC8C4
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	jsl.l CODE_9EC7BE
	inc.w printy
	inc.w printy
	lda.w printx
	sec
	sbc.w #$000B
	sta.w printx
	dec.b $A5
	bpl CODE_9BC8AC
	stz.b $B5
	jsl.l CODE_9BCA7A
	stz.b $B9
	lda.l $7E34F4
	and.w #$00FF
	cmp.w #$001E
	bcs CODE_9BC90F
	sta.b $B9
CODE_9BC90F:
	jsl.l CODE_9BCAB8
	jsl.l CODE_9D80DD
	lda.w #$0003
	sta.w $0A4A
	phx
	ldy.b $B9
	tyx
	lda.l PasswordChars,x
	plx
	sta.w $0A4C
	lda.w #$0000
	sta.b $8F
	lda.w #$0A4A
	sta.b $8D
	inc.w printx
	dec.w printy
	dec.w printy
	jsl.l CODE_9EC7BE
	lda.w #$000A
	sta.w $0AD1
CODE_9BC946:
	jsr.w $CBD8
CODE_9BC949:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF222
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l CODE_9BC6C9
	jsl.l CODE_9FBF75
CODE_9BC96B:
	jsl.l WaitFrame
	jsl.l CODE_9B8017
	jsl.l CODE_9B84F5
	jsl.l CODE_9B852C
	lda.b $A9
	beq CODE_9BC96B
	sta.b $A9
	bit.w #$1000
	beq CODE_9BC989
	jmp.w $CAF8
CODE_9BC989:
	stz.b $A5
	dec.b $A5
	bit.w #$4000
	bne CODE_9BC9C0
	stz.b $A5
	inc.b $A5
	bit.w #$8080
	bne CODE_9BC9C0
	bit.w #$0100
	bne CODE_9BC9F0
	stz.b $A5
	dec.b $A5
	bit.w #$0200
	bne CODE_9BC9F0
	ldy.w #$0006
	sty.b $A5
	bit.w #$0400
	bne CODE_9BC9F0
	ldy.w #$FFFA
	sty.b $A5
	bit.w #$0800
	bne CODE_9BC9F0
	jmp.w $C949
CODE_9BC9C0:
	lda.b $B5
	clc
	adc.b $A5
	cmp.w #$0010
	bcc CODE_9BC9CD
	jmp.w $C949
CODE_9BC9CD:
	sta.b $B5
	jsl.l CODE_9BCA7A
	lda.w #$007E
	sta.b $8B
	lda.w #$34F4
	sta.b $89
	stz.b $A5
	ldy.b $B5
	lda.b [$89],y
	and.w #$00FF
	cmp.w #$001E
	bcs CODE_9BC9F0
	sec
	sbc.b $B9
	sta.b $A5
CODE_9BC9F0:
	lda.b $B9
	clc
	adc.b $A5
	cmp.w #$001E
	bcc CODE_9BC9FD
	jmp.w $C949
CODE_9BC9FD:
	pha
	jsl.l CODE_9BCAB8
	lda.l $7E35D0
	sta.b $AD
	jsl.l eraser
	lda.w #$0003
	sta.w $0A4A
	phx
	ldy.b $B9
	tyx
	lda.l PasswordChars,x
	plx
	sta.w $0A4C
	lda.w #$0000
	sta.b $8F
	lda.w #$0A4A
	sta.b $8D
	inc.w printx
	dec.w printy
	dec.w printy
	jsl.l CODE_9EC7BE
	pla
	sta.b $B9
	jsl.l CODE_9BCAB8
	jsl.l CODE_9D80DD
	phx
	ldy.b $B9
	tyx
	lda.l PasswordChars,x
	plx
	sta.w $0A4C
	lda.w #$0000
	sta.b $8F
	lda.w #$0A4A
	sta.b $8D
	inc.w printx
	dec.w printy
	dec.w printy
	jsl.l CODE_9EC7BE
	lda.w #$007E
	sta.b $8B
	lda.w #$34F4
	sta.b $89
	ldy.b $B5
	sep #$20
	lda.b $B9
	sta.b [$89],y
	rep #$30
	jmp.w $C949
CODE_9BCA7A:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF227
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w printx
	clc
	adc.b $B5
	sta.w printx
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF22C
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	rtl
CODE_9BCAB8:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF231
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	phx
	ldx.b $B9
	lda.w #$0006
	jsl.l DivX8U
	plx
	asl a
	adc.w printy
	sta.w printy
	lda.w RDMPYL
	asl a
	adc.w printx
	dec a
	dec a
	sta.w printx
	lda.w #$0003
	sta.b $A5
	sta.b $A9
CODE_9BCAF7:
	rtl
CODE_9BCAF8:
	jsl.l CODE_9BCD28
	lda.l $7E34D0
	bpl CODE_9BCAF7
CODE_9BCB02:
	lda.w $0776
	bit.w #$4000
	bne CODE_9BCB02
	bit.w #$8080
	bne CODE_9BCB02
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF236
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF24A
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF25E
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF272
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l CODE_9FBF75
CODE_9BCB7B:
	jsl.l CODE_9B8017
	jsl.l CODE_9B84F5
	lda.b $B1
	beq CODE_9BCB7B
	bit.w #$4000
	bne CODE_9BCBCD
	bit.w #$8080
	beq CODE_9BCB7B
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF282
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$000F
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	jsl.l eraser
	jsr.w $CBD8
	jsl.l CODE_9FBF75
	jsl.l CODE_8085FF
	jmp.w $C946
CODE_9BCBCD:
	lda.w #$0002
	sta.l $7E34BC
	jml.l CODE_9F82D2
CODE_9BCBD8:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF287
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF29B
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF2AF
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF2C3
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	rts
CODE_9BCC41:
	lda.w #$0200
	sta.b $A5
	jsl.l CODE_9CA41B
	lda.b $A5
	pha
	stz.b $C1
	lda.w #$0007
	sta.b $AD
	lda.w #$000E
	sta.b $8D
CODE_9BCC59:
	ldx.b $8D
	lda.l $7E3598,x
	and.w #$FFFB
	sta.l $7E3598,x
	lda.w #$0005
	sta.b $A5
	jsl.l CODE_9BCD1C
	lda.b $A5
	ldx.b $8D
	sta.l $7E3558,x
	cmp.w #$0004
	bne CODE_9BCC87
	lda.l $7E3598,x
	ora.w #$0004
	sta.l $7E3598,x
CODE_9BCC87:
	lda.w #$0005
	sta.b $A5
	jsl.l CODE_9BCD1C
	ldx.b $8D
	lda.b $A5
	sta.l $7E3548,x
	cmp.w #$0004
	bne CODE_9BCCA8
	lda.l $7E3598,x
	ora.w #$0004
	sta.l $7E3598,x
CODE_9BCCA8:
	dec.b $8D
	dec.b $8D
	dec.b $AD
	bpl CODE_9BCC59
	lda.w #$4000
	sta.b $A5
	jsl.l CODE_9BCD1C
	lda.b $A5
	sta.w $0AD5
	lda.w #$0004
	sta.b $A5
	jsl.l CODE_9BCD1C
	lda.b $A5
	sta.l $7E34CE
	lda.w #$0010
	sta.b $A5
	jsl.l CODE_9BCD1C
	lda.b $A5
	sta.l $7E34F2
	lda.w #$0004
	sta.b $A5
	jsl.l CODE_9BCD1C
	lda.b $A5
	sta.l $7E35D4
	lda.w #$0008
	sta.b $A5
	jsl.l CODE_9BCD1C
	lda.b $A5
	sta.w $0ACF
	lda.w #$0020
	sta.b $A5
	jsl.l CODE_9BCD1C
	lda.b $A5
	sta.l $7E34D0
	lda.b $C1
	and.w #$01FF
	sta.b $C5
	pla
	cmp.b $C5
	beq CODE_9BCD1B
	lda.w #$FFFF
	sta.l $7E34D0
CODE_9BCD1B:
	rtl
CODE_9BCD1C:
	jsl.l CODE_9CA41B
	lda.b $C1
	clc
	adc.b $A5
	sta.b $C1
	rtl
CODE_9BCD28:
	jsl.l PWtoBits
	jml.l CODE_9BCC41
CODE_9BCD30:
	ldx.w #$000F
CODE_9BCD33:
	lda.w #$001E
	sta.b $A5
	jsl.l CODE_9CA41B
	sep #$20
	lda.b $A5
	sta.l $7E34F4,x
	rep #$30
	dex
	bpl CODE_9BCD33
	rtl
PasswordChars:		; the characters a password is written with
	db "BCDFGHJKLMNPRSTVWXYZ0123456789-"
PWtoBits:
	jsl.l CODE_9BCD8F
	ldx.w #$0000
CODE_9BCD70:
	lda.w #$001E
	sta.b $A5
	jsl.l CODE_9CA4CF
	lda.l $7E34F4,x
	and.w #$00FF
	sta.b $A5
	stz.b $A7
	jsl.l CODE_9BB4A3
	inx
	cpx.w #$0010
	bne CODE_9BCD70
	rtl
CODE_9BCD8F:
	lda.w #$0000
	sta.l $7E3508
	sta.l $7E350A
	sta.l $7E350C
	sta.l $7E350E
	sta.l $7E3510
	sta.l $7E3512
	sta.l $7E3514
	sta.l $7E3516
	rtl
CODE_9BCDB3:
	lda.b $A5
	pha
	lda.b $A7
	pha
	lda.b $A9
	pha
	lda.b $AB
	pha
	lda.b $A5
	ldx.b $A9
	sta.b $A9
	stx.b $A5
	jsl.l CODE_9CA4CF
	stz.b $A7
	lda.b $A9
	sta.b $A5
	jsl.l CODE_9BB4A3
	pla
	sta.b $AB
	pla
	sta.b $A9
	pla
	sta.b $A7
	pla
	sta.b $A5
	rtl
CODE_9BCDE2:
	sep #$30
	lda.b #$00
	sta.l $7E34F4
	ldx.b #$0F
	lda.b #$1E
CODE_9BCDEE:
	sta.l $7E34F4,x
	dex
	bne CODE_9BCDEE
	rep #$30
	rtl
CODE_9BCDF8:
	sta.w $1DED
	stx.w $1DEF
	sty.w $1DF1
	lda.w #$FFFF
	sta.w $1DF3
	sta.w $1DF5
	sta.w $1DF7
	lda.w #$00C4
	sta.w $07D4
	lda.w #$CE21
	ldx.w #$009B
	ldy.w $1DED
	jsl.l CODE_808520
	rtl
	sep #$20
	lda.w $1DF3
	sta.w BG1VOFS
	lda.w $1DF4
	sta.w BG1VOFS
	rep #$20
	lda.w #$CE44
	sta.w $078F
	lda.w $1DEF
	sta.w VTIMEL
	lda.w #$FFFF
	sta.w $1DCD
	rtl
	sep #$20
	lda.w $1DF5
	sta.w BG1VOFS
	lda.w $1DF6
	sta.w BG1VOFS
	rep #$20
	lda.w #$CE61
	sta.w $078F
	lda.w $1DF1
	sta.w VTIMEL
	rtl
	sep #$20
	lda.w $1DF7
	sta.w BG1VOFS
	lda.w $1DF8
	sta.w BG1VOFS
	rep #$20
	lda.w #$CE21
	sta.w $078F
	rtl
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
