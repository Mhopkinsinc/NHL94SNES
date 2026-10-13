; Bank $9B, second 4 KB: more screen code that prints text records from bank $9C (player rows, the scoring
; summary with its power play and short handed columns). DATA8_9B906F holds the player rating names (Overall,
; Energy, Agility ... Checking). CODE_9B93C1 and CODE_9B93DE are a pair of IRQ hooks that set the BG1 vertical scroll
; and install each other, to split the screen. DATA8_9B9C26 points to a set of word records that the code after it
; reads; they are not identified yet.

org $9B9001
	lda.b [$8D],y
	sta.b $B5
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F086
	sta.b $8D
	jsl.l $9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $1DA7
	cmp.w $1DAB
	beq CODE_9B9041
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F091
	sta.b $8D
	jsl.l $9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
CODE_9B9041:
	lda.w $1DA7
	sec
	sbc.w $1DAB
	clc
	adc.w $1DAF
	cmp.w $1DA3
	bpl CODE_9B906B
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F097
	sta.b $8D
	jsl.l $9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
CODE_9B906B:
	jsr.w $9249
	rtl
DATA8_9B906F:		; the player rating names: a word (2 + the text), the text, then two words; $FFFF ends them
	dw $000F : db "      Status]" : dw $0000,$0000
	dw $000F : db "    [Overall]" : dw $9FBA,$000A
	dw $000F : db "     [Energy]" : dw $0000,$0002
	dw $000F : db "    [Agility]" : dw $1000,$000A
	dw $000F : db "      [Speed]" : dw $0800,$000A
	dw $000F : db "     [Handed]" : dw $0040,$0004
	dw $000F : db "[Off. Aware.]" : dw $0400,$000A
	dw $000F : db "[Def. Aware.]" : dw $0200,$000A
	dw $000F : db " [Shot Power]" : dw $0100,$000A
	dw $000F : db " [Shot Accur]" : dw $0010,$000A
	dw $000F : db " [Pass Accur]" : dw $0002,$000A
	dw $000F : db "[Stick Handl]" : dw $0020,$000A
	dw $000F : db "     [Weight]" : dw $2000,$0006
	dw $000F : db " [ Endurance]" : dw $0008,$000A
	dw $000F : db " [Aggression]" : dw $0001,$000A
	dw $000F : db "   [Checking " : dw $0080,$000A
	dw $FFFF
CODE_9B91A1:
	rtl
CODE_9B91A2:
	pha
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F09D
	sta.b $8D
	jsl.l $9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0020
	sta.b $A5
	lda.w #$000D
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	jsl.l $9FBD9C
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F0A2
	sta.b $8D
	jsl.l $9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0800
	sta.w $0D0D
	lda.w #$0011
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	jsl.l $9D80DD
	lda.w #$009A
	sta.b $0E
	lda.w #$BA95
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$3FF4
	sta.b $10
	lda.w #$0020
	sta.b $24
	lda.w #$0014
	sta.b $26
	ldx.w #$0000
	ldy.w #$0000
	lda.l $7E35AC
	clc
	adc.w #$0C00
	jsl.l CODE_808E2D
	pla
	rts
CODE_9B9249:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F0A7
	sta.b $8D
	jsl.l $9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $0D43
	dec a
	asl a
	asl a
	asl a
	sta.b $A5
	ldy.b $91
	lda.w $1DA7
	inc a
	sta.b $95
	lda.w #$D9B3
	sta.b $9D
	lda.w #$0080
	sta.b $9F
	lda.w $1DAF
	dec a
	sta.b $A9
CODE_9B9284:
	lda.w #$3800
	sta.w $0D0D
	lda.b $A9
	sep #$20
	cmp.w $1D9B
	rep #$20
	bne CODE_9B929B
	lda.w #$2000
	sta.w $0D0D
CODE_9B929B:
	lda.b $8D
	sta.b $9D
	lda.b $8F
	sta.b $9F
	lda.w #$0002
	sta.w $0D0F
	lda.b $95
	and.w #$00FF
	dec a
	sta.b $A5
	sta.b $04
	stz.b $08
	jsl.l $9ED300
	lda.b $04
	cmp.b $A5
	bpl CODE_9B92C4
	lda.w #$0010
	sta.b $08
CODE_9B92C4:
	lda.b $04
	sta.b $A5
	jsl.l $9F9745
	inc.b $95
	inc.w $0D11
	dec.b $A9
	bpl CODE_9B9284
	lda.w #$3800
	sta.w $0D0D
	rts
CODE_9B92DC:
	ldy.b $91
	lda.w #$009C
	sta.b $97
	lda.w $1CDC,y
	sta.b $95
	ldy.w #$0008
	clc
	adc.b [$95],y
	clc
	adc.w #$0003
	sta.b $95
	lda.b [$95]
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$000F
	sta.b $A5
	rtl
CODE_9B9300:
	ldy.b $91
	lda.w #$009C
	sta.b $97
	lda.w $1CDC,y
	sta.b $95
	ldy.w #$0008
	clc
	adc.b [$95],y
	clc
	adc.w #$0003
	sta.b $95
	lda.b [$95]
	and.w #$000F
	sta.b $A5
	rtl
CODE_9B9320:
	lda.w #$0000
	sta.b $97
	lda.b $91
	beq CODE_9B932E
	lda.w #$1D1C
	bra CODE_9B9331
CODE_9B932E:
	lda.w #$1CE4
CODE_9B9331:
	sta.b $95
	rtl
CODE_9B9334:
	lda.b $97
	pha
	lda.b $95
	pha
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.b $A5
	pha
	phy
	jsl.l CODE_9B9320
	ldy.b $91
	lda.w #$009C
	sta.b $8F
	lda.w $1CDC,y
	sta.b $8D
	ldy.w #$0006
	clc
	adc.b [$8D],y
	sta.b $8D
	lda.w #$0000
	sta.b $A5
CODE_9B9361:
	sep #$20
	lda.b [$8D]
	sta.b [$95]
	rep #$20
	inc.b $8D
	inc.b $95
	lda.b $A5
	inc a
	sta.b $A5
	cmp.w #$0038
	bmi CODE_9B9361
	lda.l $7E34C6
	bne CODE_9B93B0
	jsl.l CODE_9B9320
	ldy.b $91
	lda.w #$009C
	sta.b $8F
	lda.w $1CDC,y
	sta.b $8D
	ldy.w #$000C
	clc
	adc.b [$8D],y
	sta.b $8D
	lda.w #$0000
	sta.b $A5
CODE_9B939A:
	sep #$20
	lda.b [$8D]
	sta.b [$95]
	rep #$20
	inc.b $8D
	inc.b $95
	lda.b $A5
	inc a
	sta.b $A5
	cmp.w #$0008
	bmi CODE_9B939A
CODE_9B93B0:
	ply
	pla
	sta.b $A5
	pla
	sta.b $8D
	pla
	sta.b $8F
	pla
	sta.b $95
	pla
	sta.b $97
	rtl
CODE_9B93C1:		; IRQ hook: BG1 vertical scroll from $07E0, then CODE_9B93DE is the next hook
	sep #$20
	lda.w $07E0
	sta.w BG1VOFS
	lda.w $07E1
	sta.w BG1VOFS
	rep #$20
	lda.w #CODE_9B93DE
	sta.w $078F
	lda.w #$0030
	sta.w VTIMEL
	rtl
CODE_9B93DE:		; IRQ hook: BG1 vertical scroll $FFFF, then CODE_9B93C1 is the next hook
	sep #$20
	lda.b #$FF
	sta.w BG1VOFS
	lda.b #$FF
	sta.w BG1VOFS
	rep #$20
	lda.w #CODE_9B93C1
	sta.w $078F
	rtl
CODE_9B93F3:
	lda.w $1C9A
	sta.l $7E3454
	lda.w $1C98
	sta.l $7E3452
	jsl.l $9DD9AD
	lda.w #$0000
	sta.w $1DB9
	sta.w $1DBD
	sta.w $1DC1
	ldx.w #$005E
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #$F0AC
	sta.b $8D
	jsl.l $9C936C
	jsl.l SpriteFrameEnd
	lda.w #$FFFF
	sta.l $7F75C2
	lda.w #$2BFF
	sta.l $7F7502
	lda.w #$6F7B
	sta.l $7F7522
	jsl.l $9DE0D4
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F0B5
	sta.b $8D
	jsl.l $9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0000
	sta.w $1DC1
	lda.l $7E313A
CODE_9B9466:
	cmp.w #$0006
	bmi CODE_9B9474
CODE_9B946B:
	inc.w $1DC1
	sec
	sbc.w #$0006
	bra CODE_9B9466
CODE_9B9474:
	lda.w $1DC1
	cmp.w #$0006
	bcc CODE_9B9480
CODE_9B947C:
	jsl.l CODE_9B9A5D
CODE_9B9480:
	jsr.w $95B0
	jsl.l $9DD923
	lda.w #$0058
	ldx.w #$00D0
	ldy.w #$00E0
	jsl.l $9BCDF8
	jsl.l $9DDFF6
	jsl.l CODE_8086BD
	lda.w #$0005
	sta.w $1DC5
	jsr.w $9562
CODE_9B94A5:
	jsl.l CODE_9B851F
	lda.b $B1
	bit.w #$1000
	beq CODE_9B94B1
	rtl
CODE_9B94B1:
	bit.w #$0800
	bne CODE_9B9514
	bit.w #$0400
	bne CODE_9B94C1
CODE_9B94BB:
	jsl.l WaitFrame
	bra CODE_9B94A5
CODE_9B94C1:
	lda.w #$0006
	sta.w $1DC5
	jsr.w $9562
	lda.w #$0005
	sta.w $1DC5
	lda.w $1DBD
	clc
	adc.w #$0005
	cmp.w $1DC1
	bpl CODE_9B94BB
CODE_9B94DC:
	sec
	sbc.w #$0004
	sta.w $1DBD
	lda.w #$0001
	sta.w $1DF3
	lda.w #$0018
	sta.w $1DF5
CODE_9B94EF:
	jsl.l WaitFrame
	inc.w $1DF3
	inc.w $1DF3
	lda.w $1DF3
	cmp.w #$0017
	bne CODE_9B94EF
	jsl.l CODE_9B9AB2
	jsr.w $9562
	jsl.l WaitFrame
	lda.w #$FFFF
	sta.w $1DF3
	bra CODE_9B94A5
CODE_9B9514:
	lda.w $1DBD
	dec a
	bmi CODE_9B94BB
	sta.w $1DBD
	lda.w #$0006
	sta.w $1DC5
	jsr.w $9562
	jsl.l WaitFrame
	lda.w #$0015
	sta.w $1DF3
	lda.w #$0018
	sta.w $1DF5
CODE_9B9536:
	jsl.l WaitFrame
	dec.w $1DF3
	dec.w $1DF3
	lda.w $1DF3
	cmp.w #$0001
	bne CODE_9B9536
	jsl.l CODE_9B9AB2
	lda.w #$0005
	sta.w $1DC5
	jsr.w $9562
	jsl.l WaitFrame
	lda.w #$FFFF
	sta.w $1DF3
	jmp.w $94A5
CODE_9B9562:
	lda.w $1DC1
	cmp.w #$0000
	beq CODE_9B9591
CODE_9B956A:
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
	ldy.w #$0160
	jsl.l CODE_80891F
	rts
CODE_9B9591:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F0D8
	sta.b $8D
	jsl.l $9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l $9FBF75
	rts
CODE_9B95B0:
	lda.w #$007F
	sta.b $12
	lda.w #$2780
	sta.b $10
	ldx.w #$4D80
	lda.l $7E35B6
	clc
	adc.l $7E35A8
	jsl.l CODE_808EDF
	lda.w #$007E
	sta.b $97
	lda.w #$313C
	sta.b $95
	lda.w #$0000
	sta.w $0D11
	pha
CODE_9B95DB:
	cmp.w $1DC1
	beq CODE_9B95F3
CODE_9B95E0:
	jsr.w $95F5
	lda.b $95
	clc
	adc.w #$0006
	sta.b $95
	inc.w $0D11
	pla
	inc a
	pha
	bra CODE_9B95DB
CODE_9B95F3:
	pla
	rts
CODE_9B95F5:
	lda.w #$0001
	sta.w $0D0F
	lda.w #$2000
	sta.w $0D0D
	ldy.w #$0000
	lda.b [$95],y
	phy
	pha
	and.w #$F000
	xba
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	sta.b $A5
	lda.w #$0080
	sta.b $8F
	lda.w #$D6E1
	sta.b $8D
	jsl.l $9ED323
	jsl.l $9EC894
	lda.w #$0004
	sta.w $0D0F
	pla
	and.w #$0FFF
	sta.b $A5
	jsl.l $9FA3D7
	lda.b [$8D]
	cmp.w #$0006
	bne CODE_9B9640
	inc.w $0D0F
CODE_9B9640:
	jsl.l $9EC894
	lda.w #$000A
	sta.w $0D0F
	ply
	iny
	iny
	sep #$20
	lda.b [$95],y
	rep #$20
	phy
	and.w #$00FF
	pha
	and.w #$00F0
	sta.b $B1
	stz.b $91
	lda.b $B1
	beq CODE_9B9668
	lda.w #$0002
	sta.b $91
CODE_9B9668:
	jsl.l CODE_9B9B35
	dec.w $0D11
	dec.w $0D11
	lda.w #$001C
	sta.w $0D0F
	pla
	and.w #$000F
	cmp.w #$0000
	beq CODE_9B96E4
	cmp.w #$0001
	beq CODE_9B96C8
	cmp.w #$0002
	beq CODE_9B96FE
	cmp.w #$0003
	beq CODE_9B96AC
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F0E7
	sta.b $8D
	jsl.l $9EC894
	pla
	sta.b $8D
	pla
	sta.b $8F
	bra CODE_9B96FE
CODE_9B96AC:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F0EC
	sta.b $8D
	jsl.l $9EC894
	pla
	sta.b $8D
	pla
	sta.b $8F
	bra CODE_9B96FE
CODE_9B96C8:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F0F0
	sta.b $8D
	jsl.l $9EC894
	pla
	sta.b $8D
	pla
	sta.b $8F
	bra CODE_9B96FE
CODE_9B96E4:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F0F4
	sta.b $8D
	jsl.l $9EC894
	pla
	sta.b $8D
	pla
	sta.b $8F
CODE_9B96FE:
	ply
	iny
	sep #$20
	lda.b [$95],y
	rep #$20
	phy
	and.w #$00FF
	sta.b $A5
	lda.w #$000E
	sta.w $0D0F
	jsl.l $9FC427
	jsl.l $9EC894
	ply
	iny
	lda.w #$2400
	sta.w $0D0D
	sep #$20
	lda.b [$95],y
	rep #$20
	phy
	inc.w $0D11
	and.w #$00FF
	cmp.w #$00FF
	beq CODE_9B9744
	sta.b $A5
	lda.w #$0010
	sta.w $0D0F
	jsl.l $9FC427
	jsl.l $9EC894
CODE_9B9744:
	ply
	iny
	sep #$20
	lda.b [$95],y
	rep #$20
	inc.w $0D11
	and.w #$00FF
	cmp.w #$00FF
	beq CODE_9B9767
	sta.b $A5
	lda.w #$0010
	sta.w $0D0F
	jsl.l $9FC427
	jsl.l $9EC894
CODE_9B9767:
	rts
CODE_9B9768:
	lda.w $1C9A
	sta.l $7E3454
	lda.w $1C98
	sta.l $7E3452
	jsl.l $9DD9AD
	lda.w #$0000
	sta.w $1DB9
	sta.w $1DBD
	sta.w $1DC1
	ldx.w #$0058
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #$F0F9
	sta.b $8D
	jsl.l $9C936C
	jsl.l SpriteFrameEnd
	lda.w #$FFFF
	sta.l $7F75C2
	lda.w #$2BFF
	sta.l $7F7502
	lda.w #$6F7B
	sta.l $7F7522
	jsl.l $9DE0D4
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F104
	sta.b $8D
	jsl.l $9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $163C
	sta.w $1DC1
	lda.w $1DC1
	cmp.w #$0006
	bcc CODE_9B97E3
CODE_9B97DF:
	jsl.l CODE_9B9A5D
CODE_9B97E3:
	jsr.w $9917
	jsl.l $9DD923
	lda.w #$0058
	ldx.w #$00D0
	ldy.w #$00E0
	jsl.l $9BCDF8
	jsl.l $9DDFF6
	jsl.l CODE_8086BD
	lda.w #$0005
	sta.w $1DC5
	jsr.w $98C9
CODE_9B9808:
	jsl.l CODE_9B851F
	jsl.l CODE_9B852C
	lda.b $B1
	bit.w #$1000
	beq CODE_9B9818
	rtl
CODE_9B9818:
	bit.w #$0800
	bne CODE_9B987B
	bit.w #$0400
	bne CODE_9B9828
CODE_9B9822:
	jsl.l WaitFrame
	bra CODE_9B9808
CODE_9B9828:
	lda.w #$0006
	sta.w $1DC5
	jsr.w $98C9
	lda.w #$0005
	sta.w $1DC5
	lda.w $1DBD
	clc
	adc.w #$0005
	cmp.w $1DC1
	bpl CODE_9B9822
	sec
	sbc.w #$0004
	sta.w $1DBD
	lda.w #$0001
	sta.w $1DF3
	lda.w #$0018
	sta.w $1DF5
CODE_9B9856:
	jsl.l WaitFrame
	inc.w $1DF3
	inc.w $1DF3
	lda.w $1DF3
	cmp.w #$0017
	bne CODE_9B9856
	jsl.l CODE_9B9AB2
	jsr.w $98C9
	jsl.l WaitFrame
	lda.w #$FFFF
	sta.w $1DF3
	bra CODE_9B9808
CODE_9B987B:
	lda.w $1DBD
	dec a
	bmi CODE_9B9822
	sta.w $1DBD
	lda.w #$0006
	sta.w $1DC5
	jsr.w $98C9
	jsl.l WaitFrame
	lda.w #$0015
	sta.w $1DF3
	lda.w #$0018
	sta.w $1DF5
CODE_9B989D:
	jsl.l WaitFrame
	dec.w $1DF3
	dec.w $1DF3
	lda.w $1DF3
	cmp.w #$0001
	bne CODE_9B989D
	jsl.l CODE_9B9AB2
	lda.w #$0005
	sta.w $1DC5
	jsr.w $98C9
	jsl.l WaitFrame
	lda.w #$FFFF
	sta.w $1DF3
	jmp.w $9808
CODE_9B98C9:
	lda.w $1DC1
	cmp.w #$0000
	beq CODE_9B98F8
CODE_9B98D1:
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
	ldy.w #$0160
	jsl.l CODE_80891F
	rts
CODE_9B98F8:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F127
	sta.b $8D
	jsl.l $9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l $9FBF75
	rts
CODE_9B9917:
	lda.w #$007F
	sta.b $12
	lda.w #$2780
	sta.b $10
	ldx.w #$4D80
	lda.l $7E35B6
	clc
	adc.l $7E35A8
	jsl.l CODE_808EDF
	lda.w #$0000
	sta.b $97
	lda.w #$163E
	sta.b $95
	lda.w #$0000
	sta.w $0D11
	pha
CODE_9B9942:
	cmp.w $1DC1
	beq CODE_9B995D
CODE_9B9947:
	jsr.w $995F
	lda.b $95
	clc
	adc.w #$0004
	sta.b $95
	inc.w $0D11
	inc.w $0D11
	pla
	inc a
	pha
	bra CODE_9B9942
CODE_9B995D:
	pla
	rts
CODE_9B995F:
	lda.w #$0001
	sta.w $0D0F
	lda.w #$2000
	sta.w $0D0D
	ldy.w #$0000
	lda.b [$95],y
	phy
	pha
	and.w #$F000
	xba
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	sta.b $A5
	lda.w #$0080
	sta.b $8F
	lda.w #$D6E1
	sta.b $8D
	jsl.l $9ED323
	jsl.l $9EC894
	lda.w #$0004
	sta.w $0D0F
	pla
	and.w #$0FFF
	sta.b $A5
	jsl.l $9FA3D7
	lda.b [$8D]
	cmp.w #$0006
	bne CODE_9B99AA
	inc.w $0D0F
CODE_9B99AA:
	jsl.l $9EC894
	lda.w #$000A
	sta.w $0D0F
	ply
	iny
	iny
	sep #$20
	lda.b [$95],y
	rep #$20
	phy
	and.w #$00FF
	pha
	and.w #$0080
	sta.b $B1
	stz.b $91
	lda.b $B1
	beq CODE_9B99D2
	lda.w #$0002
	sta.b $91
CODE_9B99D2:
	jsl.l CODE_9B9B35
	dec.w $0D11
	dec.w $0D11
	lda.w #$000E
	sta.w $0D0F
	pla
	and.w #$007F
	sta.b $A5
	jsl.l $9FC427
	jsl.l $9EC894
	ply
	iny
	sep #$20
	lda.b [$95],y
	rep #$20
	and.w #$00FF
	tay
	lda.w #$D3EB
	sta.b $8D
	lda.w #$0080
	sta.b $8F
	lda.b [$8D],y
	clc
	adc.b $8D
	sta.b $8D
	lda.w #$001D
	sta.w $0D0F
	lda.b [$8D]
	and.w #$00FF
	sta.b $A5
	lda.b $8D
	pha
	lda.b $8F
	pha
	lda.w #$0002
	sta.b $A9
	jsl.l $9FC623
	jsl.l $9EC894
	pla
	sta.b $8F
	pla
	sta.b $8D
	lda.w #$2400
	sta.w $0D0D
	inc.w $0D11
	lda.w #$0010
	sta.w $0D0F
	inc.b $8D
	inc.b $8D
	lda.b [$8D]
	sta.b $A5
	tay
	dec.b $8D
	lda.b [$8D],y
	inc.b $8D
	and.w #$00FF
	bne CODE_9B9A58
	dec.b $A5
CODE_9B9A58:
	jsl.l $9EC894
	rts
CODE_9B9A5D:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F138
	sta.b $8D
	jsl.l $9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$000E
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	jsl.l $9D80DD
	lda.w #$2400
	sta.w $0D0D
	lda.w #$000A
	sta.w $0D0F
	lda.w #$0007
	sta.w $0D11
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F13D
	sta.b $8D
	jsl.l $9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	rtl
CODE_9B9AB2:
	lda.w $1DBD
	clc
	adc.w #$0005
	cmp.w $1DC1
	bpl CODE_9B9ADA
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F14B
	sta.b $8D
	jsl.l $9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	bra CODE_9B9AF4
CODE_9B9ADA:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F151
	sta.b $8D
	jsl.l $9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
CODE_9B9AF4:
	lda.w $1DBD
	dec a
	bmi CODE_9B9B16
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F157
	sta.b $8D
	jsl.l $9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	bra CODE_9B9B30
CODE_9B9B16:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F15D
	sta.b $8D
	jsl.l $9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
CODE_9B9B30:
	jsl.l $9FBF75
	rtl
CODE_9B9B35:
	lda.w $0D0F
	pha
	lda.w $1CDC
	sta.b $8D
	lda.w #$009C
	sta.b $8F
	lda.b $B1
	beq CODE_9B9B4C
	lda.w $1CDE
	sta.b $8D
CODE_9B9B4C:
	ldy.w #$0004
	lda.b [$8D],y
	clc
	adc.b $8D
	sta.b $8D
	lda.b [$8D]
	adc.b $8D
	sta.b $8D
	jsl.l $9EC894
	pla
	sta.w $0D0F
	inc.w $0D11
	inc.w $0D11
	rtl
CODE_9B9B6B:
	lda.w $1630
	cmp.w #$0003
	beq CODE_9B9BA4
	stz.b $00
	lda.l $7E34BC
	cmp.w #$0000
	beq CODE_9B9B9B
	cmp.w #$0004
	beq CODE_9B9B9B
	inc.b $00
	lda.l $7E35D4
	cmp.w #$0002
	bmi CODE_9B9B9B
	inc.b $00
	lda.l $7E35D4
	cmp.w #$0003
	bmi CODE_9B9B9B
	inc.b $00
CODE_9B9B9B:
	lda.b $00
	asl a
	asl a
	asl a
	asl a
	sta.w $19BE
CODE_9B9BA4:
	rtl
CODE_9B9BA5:
	phx
	phy
	lda.w $19BE
	asl a
	asl a
	stz.b $A7
	sta.b $A5
	jsl.l $9BB3BE
	lda.b $A5
	clc
	adc.w #$0041
	cmp.w #$0080
	bcc CODE_9B9BC2
	lda.w #$0080
CODE_9B9BC2:
	sta.b $A5
	cmp.w $19C4
	bmi CODE_9B9BCC
	sta.w $19C4
CODE_9B9BCC:
	lda.w $19CA
	clc
	adc.b $A5
	sta.w $19CA
	bcc CODE_9B9BDA
	inc.w $19CC
CODE_9B9BDA:
	inc.w $19C8
	lda.w $19CC
	sta.b $0A
	lda.w $19CA
	sta.b $08
	lda.w $19C8
	sta.b $04
	jsl.l Div32U
	lda.b $00
	sta.w $19C6
	ply
	plx
	rtl
CODE_9B9BF8:
	lda.b $A5
	pha
	jsl.l CODE_9B9BA5
	lda.b $A5
	sta.w $19C2
	cmp.w #$0069
	bmi CODE_9B9C16
	cmp.w #$006E
	bmi CODE_9B9C22
	lda.w #$0001
	sta.w $19C0
	bra CODE_9B9C22
CODE_9B9C16:
	lda.w $19C0
	beq CODE_9B9C22
	jsl.l $9BA89F
	stz.w $19C0
CODE_9B9C22:
	pla
	sta.b $A5
	rtl
DATA8_9B9C26:		; word pointers to the entries below, read in the screen code below; the entries are not
			;   identified yet
	dw DATA8_9B9C50,DATA8_9B9C72,DATA8_9B9C90,DATA8_9B9CAE,DATA8_9B9CCC,DATA8_9B9CEA
	dw DATA8_9B9D10,DATA8_9B9D36,DATA8_9B9D58,DATA8_9B9D7A,DATA8_9B9D9C,DATA8_9B9DC2
	dw DATA8_9B9DE4,DATA8_9B9E0A,DATA8_9B9E32,DATA8_9B9E56,DATA8_9B9E78,DATA8_9B9EA4
	dw DATA8_9B9ECE,DATA8_9B9F08,DATA8_9B9F42
DATA8_9B9C50:
	dw $0002,$0001,$0001,$0005,$0002,$9C60,$9C66,$9C6C
	dw $0001,$0002,$FFFF,$0001,$0002,$FFFF,$0001,$0000
	dw $FFFF
DATA8_9B9C72:
	dw $0001,$0003,$000D,$0006,$0001,$9C82,$9C8C,$9C8E
	dw $0001,$0000,$0001,$0000,$FFFF,$FFFF,$FFFF
DATA8_9B9C90:
	dw $0001,$0004,$000F,$0006,$0001,$9CA0,$9CAA,$9CAC
	dw $0001,$0000,$0001,$0000,$FFFF,$FFFF,$FFFF
DATA8_9B9CAE:
	dw $0001,$0005,$0011,$0006,$0001,$9CBE,$9CC8,$9CCA
	dw $0001,$0000,$0001,$0000,$FFFF,$FFFF,$FFFF
DATA8_9B9CCC:
	dw $0001,$0006,$0013,$0006,$0001,$9CDC,$9CE6,$9CE8
	dw $0001,$0000,$0001,$0000,$FFFF,$FFFF,$FFFF
DATA8_9B9CEA:
	dw $0008,$0007,$0015,$0005,$0004,$9CFA,$9D02,$9D08
	dw $0001,$0002,$0003,$FFFF,$0002,$0003,$FFFF,$0002
	dw $0001,$0000,$FFFF
DATA8_9B9D10:
	dw $0004,$000F,$004D,$0005,$0003,$9D20,$9D28,$9D2E
	dw $0001,$0002,$0003,$FFFF,$0002,$0003,$FFFF,$0002
	dw $0001,$0000,$FFFF
DATA8_9B9D36:
	dw $0003,$0013,$005D,$0005,$0002,$9D46,$9D4C,$9D52
	dw $0001,$0002,$FFFF,$0001,$0002,$FFFF,$0001,$0000
	dw $FFFF
DATA8_9B9D58:
	dw $0002,$0016,$0066,$0005,$0001,$9D68,$9D6E,$9D74
	dw $0001,$0002,$FFFF,$0001,$0002,$FFFF,$0001,$0000
	dw $FFFF
DATA8_9B9D7A:
	dw $0002,$0018,$006C,$0005,$0002,$9D8A,$9D98,$9D9A
	dw $0001,$0002,$0002,$0002,$0001,$0000,$FFFF,$FFFF
	dw $FFFF
DATA8_9B9D9C:
	dw $0003,$001A,$0072,$0005,$0002,$9DAC,$9DBE,$9DC0
	dw $0001,$0002,$0001,$0002,$0001,$0002,$0001,$0000
	dw $FFFF,$FFFF,$FFFF
DATA8_9B9DC2:
	dw $0003,$001D,$007B,$0005,$0005,$9DD2,$9DE0,$9DE2
	dw $0001,$0002,$0001,$0002,$0001,$0000,$FFFF,$FFFF
	dw $FFFF
DATA8_9B9DE4:
	dw $0003,$0020,$0084,$0005,$0004,$9DF4,$9E06,$9E08
	dw $0001,$0002,$0001,$0002,$0001,$0002,$0001,$0000
	dw $FFFF,$FFFF,$FFFF
DATA8_9B9E0A:
	dw $0009,$0023,$008D,$0004,$0005,$9E1A,$9E2E,$9E30
	dw $0001,$0002,$0003,$0002,$0003,$0002,$0003,$0001
	dw $0000,$FFFF,$FFFF,$FFFF
DATA8_9B9E32:
	dw $0006,$002C,$00B1,$0004,$0004,$9E42,$9E52,$9E54
	dw $0001,$0002,$0003,$0002,$0003,$0001,$0000,$FFFF
	dw $FFFF,$FFFF
DATA8_9B9E56:
	dw $0004,$0032,$00C9,$0004,$0003,$9E66,$9E74,$9E76
	dw $0001,$0002,$0001,$0002,$0001,$0000,$FFFF,$FFFF
	dw $FFFF
DATA8_9B9E78:
	dw $0004,$0036,$00D5,$0002,$0003,$9E88,$9E92,$9E96
	dw $0001,$0002,$0003,$0004,$FFFF,$0004,$FFFF,$0004
	dw $0004,$0004,$0004,$0004,$0000,$FFFF
DATA8_9B9EA4:
	dw $0006,$003A,$00E9,$0002,$0003,$9EB4,$9EC8,$9ECA
	dw $0001,$0002,$0003,$0003,$0003,$0003,$0003,$0003
	dw $0003,$FFFF,$FFFF,$0000,$FFFF
DATA8_9B9ECE:
	dw $0002,$0001,$0001,$0003,$0002,$9EDE,$9EF6,$9F04
	dw $0004,$0004,$0003,$0004,$0005,$0004,$0003,$0004
	dw $0005,$0005,$0005,$FFFF,$0004,$0003,$0004,$0005
	dw $0005,$0005,$FFFF,$0000,$FFFF
DATA8_9B9F08:
	dw $0008,$0007,$0015,$0003,$0002,$9F18,$9F30,$9F3E
	dw $0005,$0005,$0004,$0005,$0006,$0005,$0004,$0005
	dw $0006,$0006,$0006,$FFFF,$0005,$0004,$0005,$0006
	dw $0006,$0006,$FFFF,$0000,$FFFF
DATA8_9B9F42:
	dw $0002,$0040,$0101,$0003,$0000,$9F52,$9F68,$9F76
	dw $0002,$0001,$0002,$0003,$0002,$0001,$0002,$0003
	dw $0003,$0003,$FFFF,$0002,$0001,$0002,$0003,$0003
	dw $0003,$FFFF,$0000,$FFFF
CODE_9B9F7A:
	lda.b $81
	beq CODE_9B9F91
	cmp.w #$003C
	bcc CODE_9B9F86
	lda.w #$003C
CODE_9B9F86:
	sec
	sbc.b $C1
	bpl CODE_9B9F8E
	lda.w #$0000
CODE_9B9F8E:
	sta.b $81
	rtl
CODE_9B9F91:
	lda.l $7E35E0
	cmp.w #$0480
	bcc CODE_9B9F9D
	lda.w #$0480
CODE_9B9F9D:
	sec
	sbc.w $0CDD
	sta.l $7E35E0
	bpl CODE_9B9FAE
	lda.w #$0000
	sta.l $7E35E0
CODE_9B9FAE:
	rtl
CODE_9B9FAF:
	lda.w $15D8
	and.w #$0800
	beq CODE_9B9FBD
	lda.w $0CB9
	bne CODE_9B9FBD
	rtl
CODE_9B9FBD:
	jsl.l $9BA1A1
	ldx.w #$0022
	lda.w $1C98
	cmp.w #$0013
	bne CODE_9B9FDC
	lda.w $0C53
	bne CODE_9B9FD9
	lda.w $0CC3
	cmp.w #$0002
	bne CODE_9B9FDC
CODE_9B9FD9:
	ldx.w #$0028
CODE_9B9FDC:
	stx.b $08
	cpx.w #$0000
	beq CODE_9B9FE8
	cpx.w #$000A
	bne CODE_9B9FF0
CODE_9B9FE8:
	lda.w $0C53
	beq CODE_9B9FF0
	jmp.w $A076
CODE_9B9FF0:
	lda.w #$009B
	sta.b $12
	lda.l DATA8_9B9C26,x
	sta.b $10
	lda.w $0C2B,x
	beq CODE_9BA003
