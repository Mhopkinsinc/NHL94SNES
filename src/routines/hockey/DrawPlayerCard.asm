; Draw the current player card, including strengths and ratings.
DrawPlayerCard:
	jsl.l SpriteFrameStart
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF6B3
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0020
	sta.b d0
	lda.w #$0014
	sta.b d1
	lda.l $7E35D0
	sta.b d2
	jsl.l eraser
	ldy.b a2
	lda.w HomeTeam,y
	ldx.w #$00C8
	ldy.w #$0010
	jsl.l CODE_9DDFBF
	ldy.b a2
	lda.w #$009C
	sta.b $97
	lda.w tmdata,y
	sta.b a3
	ldy.w #$000C
	clc
	adc.b [a3],y
	sta.b a3
	ldy.w $1DB9
	bne .t2
	jmp.w .5

.t2:
	lda.w $1DB9
	sec
	sbc.w #$0007
	bmi .t1
	sta.w $1D9B
	bra .2

.t1:
	clc
	adc.w #$0006
	tay
	lda.w #$009D
	sta.b $8F
	lda.w #.8
	sta.b a1
	lda.b [a1],y
	and.w #$00FF
	tay
	lda.b [a3],y
	and.w #$00FF
	dec a
	sta.w $1D9B
.2:
	lda.w $1D9B
	sta.b d0
	jsl.l PlayerNumName
	lda.b [a1]
	dec a
	dec a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0010
	sta.w printx
	lda.w #$000C
	sta.w printy
	jsl.l print
	jsl.l GoalieCount
	lda.w $1D9B
	cmp.b d0
	bmi .t2x
	jmp.w .t4

.t2x:
	lda.w #$009D
	sta.b $8F
	lda.w #$C2B0
	sta.b a1
	lda.b [a1]
	dec a
	dec a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0010
	sta.w printx
	lda.w #$000D
	sta.w printy
	jsl.l print
	jsl.l CODE_9DC374
	ldx.w #$0038
	ldy.w #$007A
	lda.w #$009C
	sta.b $8F
	lda.w #StrengthsLabel
	sta.b a1
	jsl.l CODE_9C9590
	lda.w #$009D
	sta.b $8F
	lda.w #$C4E8
	sta.b a1
	lda.w $1E79
	sta.b d0
	bpl .t1x
.1:
	jmp.w .4

.t1x:
	jsl.l AdvanceStringPtr
	ldx.w #$0040
	ldy.w #$0084
	jsl.l CODE_9C9590
	lda.w #$009D
	sta.b $8F
	lda.w #$C4E8
	sta.b a1
	lda.w $1E7D
	sta.b d0
	bpl .t3
.1x:
	jmp.w .4

.t3:
	lda.w $1E7F
	cmp.w #$0050
	bpl .t1xx
	jmp.w .4

.t1xx:
	jsl.l AdvanceStringPtr
	ldx.w #$0040
	ldy.w #$008E
	jsl.l CODE_9C9590
	lda.w #$009D
	sta.b $8F
	lda.w #$C4E8
	sta.b a1
	lda.w $1E81
	sta.b d0
	bpl .t2xx
.1x2:
	jmp.w .4

.t2xx:
	lda.w $1E83
	cmp.w #$0050
	bpl .t1xxx
.1xx:
	jmp.w .4

.t1xxx:
	jsl.l AdvanceStringPtr
	ldx.w #$0040
	ldy.w #$0098
	jsl.l CODE_9C9590
	jmp.w .4

.t4:
	jsl.l GoalieCount
	lda.b d0
	sta.b d1
	jsl.l CODE_9B92DC
	lda.b d0
	clc
	adc.b d1
	cmp.w $1D9B
org $9DC002
	beq .t1x2
	bmi .t1x2
	lda.w #$009D
	sta.b $8F
	lda.w #RosterGroups
	sta.b a1
	bra .3

.t1x2:
	lda.w #$009D
	sta.b $8F
	lda.w #$C2A7
	sta.b a1
.3:
	lda.b [a1]
	dec a
	dec a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0010
	sta.w printx
	lda.w #$000D
	sta.w printy
	jsl.l print
	jsl.l CODE_9DC2FB
	ldx.w #$0038
	ldy.w #$007A
	lda.w #$009C
	sta.b $8F
	lda.w #StrengthsLabelB
	sta.b a1
	jsl.l CODE_9C9590
	lda.w #$009D
	sta.b $8F
	lda.w #RatingNames
	sta.b a1
	lda.w $1E79
	sta.b d0
	bmi .4
	jsl.l AdvanceStringPtr
	ldx.w #$0040
	ldy.w #$0084
	jsl.l CODE_9C9590
	lda.w #$009D
	sta.b $8F
	lda.w #RatingNames
	sta.b a1
	lda.w $1E7D
	sta.b d0
	bmi .4
	lda.w $1E7F
	cmp.w #$0050
	bmi .4
	jsl.l AdvanceStringPtr
	ldx.w #$0040
	ldy.w #$008E
	jsl.l CODE_9C9590
	lda.w #$009D
	sta.b $8F
	lda.w #RatingNames
	sta.b a1
	lda.w $1E81
	sta.b d0
	bmi .4
	lda.w $1E83
	cmp.w #$0050
	bmi .4
	jsl.l AdvanceStringPtr
	ldx.w #$0040
	ldy.w #$0098
	jsl.l CODE_9C9590
.4:
	ldx.w #$0098
	ldy.w #$007A
	lda.w #$009C
	sta.b $8F
	lda.w #OverallRating
	sta.b a1
	jsl.l CODE_9C9590
	lda.w #$0001
	sta.b d1
	jsl.l CODE_9DC561
	lda.w #$0004
	sta.b d1
	jsl.l CODE_9FC623
	ldx.w #$00A0
	ldy.w #$0084
	jsl.l CODE_9C9590
	jmp.w .6
.5:
	ldx.w #$000D
	ldy.w #$0004
	jsl.l CODE_9DCCBA
	lda.w #$0001
	sta.l $7E3464
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF6E0
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	ldy.b a2
	lda.w HomeTeam,y
	sta.b d1
	jsl.l CODE_9FBE08
	lda.w #$0000
	sta.l $7E3464
	ldy.b a2
	lda.w #$009C
	sta.b $8F
	lda.w tmdata,y
	sta.b a1
	ldy.w #$0004
	clc
	adc.b [a1],y
	sta.b a1
	clc
	adc.b [a1]
	sta.b a1
	clc
	adc.b [a1]
	sta.b a1
	lda.b [a1]
	dec a
	dec a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0010
	sta.w printx
	lda.w #$0007
	sta.w printy
	jsl.l print
	lda.b [a1]
	dec a
	dec a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0010
	sta.w printx
	lda.w #$0009
	sta.w printy
	jsl.l print
	lda.w #$0060
	sta.w printy
	ldx.w #$0080
	ldy.w #$0004
	jsl.l CODE_9DC2B8
	lda.w printy
	clc
	adc.w #$0008
	sta.w printy
	ldx.w #$0040
	ldy.w #$0003
	jsl.l CODE_9DC2B8
	ldx.w #$00C0
	ldy.w #$0005
	jsl.l CODE_9DC2B8
	lda.w printy
	clc
	adc.w #$000E
	sta.w printy
	ldx.w #$0058
	ldy.w #$0001
	jsl.l CODE_9DC2B8
	ldx.w #$00A8
	ldy.w #$0002
	jsl.l CODE_9DC2B8
	lda.w printy
	clc
	adc.w #$000E
	sta.w printy
	ldx.w #$0080
	ldy.w #$0000
	jsl.l CODE_9DC2B8
	ldx.w #$0066
	ldy.w #$0098
	lda.w #$009C
	sta.b $8F
	lda.w #TeamRating
	sta.b a1
	jsl.l CODE_9C9590
	jsl.l CODE_9D87B5
	lda.w #$0004
	sta.b d1
	jsl.l CODE_9FC623
	ldx.w #$0070
	ldy.w #$00A2
	jsl.l CODE_9C9590
.6:
	lda.w $1DB9
	beq .t1xxxx
	lda.w $1D9B
	ldx.w #$000D
	ldy.w #$0004
	jsl.l CODE_9DC9A8
	lda.w #$007F
	sta.b $0E
	lda.l $7E3470
	sta.b $0C
	lda.l $7E35D2
	asl a
	asl a
	asl a
	asl a
	clc
	adc.w #$2000
	tay
	ldx.w #$0600
	jsl.l WaitFrame
	jsl.l DMAToVRAM
	lda.w #$007F
	sta.b $0E
	lda.l $7E3472
	sta.b $0C
	lda.l $7E35D2
	asl a
	asl a
	asl a
	asl a
	clc
	adc.w #$2300
	tay
	ldx.w #$0600
	jsl.l DMAToVRAM
	jsl.l SendTextMap
	lda.w #$007F
	sta.b $0E
	lda.w #$7780
	sta.b $0C
	lda.w #$0400
	sta.w $079C
	ldx.w #$000C
	ldy.w #$0004
	jsl.l MapToVRAM
	bra .7

.t1xxxx:
	jsl.l CODE_9DD94D
.7:
	jsl.l CODE_9DC2DE
	jsl.l WaitFrame
	jsl.l SpriteFrameEnd
	lda.w #$3568
	sta.l $7F7500
	jsl.l SendColours
	rtl
.8:
	db $00,$04,$03,$05,$01,$02
