; Print each team-stat name and both teams' numbers.
PrintTeamStatRows:
	lda.w #$007F
	sta.b $12
	lda.w #$2780
	sta.b $10
	ldx.w #$4D80
	lda.l smallfontchars
	clc
	adc.l printfontset
	jsl.l MemFill
	lda.w #$0000
	sta.w printy
	lda.w #$0000
	sta.w curitem
	lda.w listcount
	sta.b d4
.loop:
	jsr.w .t2
	inc.w printy
	inc.w printy
	inc.w curitem
	dec.b d4
	bpl .loop
	rts

.t2:
	lda.w #$2800
	sta.w printa
	lda.w #$0009
	sta.w printx
	lda.w curitem
	sta.b d0
	lda.w #TeamStatNames>>16
	sta.b $8F
	lda.w #TeamStatNames
	sta.b a1
	lda.l OptPen
	bne .2
.1:
	lda.w #TeamStatNames>>16
	sta.b $8F
	lda.w #TeamStatNamesNoPen
org $9C9000
	sta.b a1
.2:
	jsl.l AdvanceStringPtr
	jsl.l PrintToStatsPage
	lda.w #$2400
	sta.w printa
	stz.b a2
	lda.w #$001C
	sta.w printx
	jsr.w .t1
	lda.w #$0002
	sta.b a2
	lda.w #$0007
	sta.w printx
	jsr.w .t1
	rts

.t1:
	lda.w #TeamStatSources>>16
	sta.b $8B
	lda.w #TeamStatSources
	sta.b a0
	lda.w curitem
	sta.b d0
.3:
	lda.b [a0]
	bpl .t2x
	jmp.w .8

.t2x:
	and.w #$00F0
	ora.w statpenrows
	beq .1x
	dec.b d0
	bmi .t1x
.1x:
	lda.b a0
	clc
	adc.w #$0006
	sta.b a0
	bra .3

.t1x:
	lda.b [a0]
	and.w #$000F
	inc.b a0
	inc.b a0
	cmp.w #$0001
	bne .t3
	jmp.w .5

.t3:
	cmp.w #$0002
	beq .t2xx
	cmp.w #$0003
	bne .t1xx
	jmp.w .6

.t1xx:
	lda.b [a0]
	clc
	adc.b a2
	tay
	lda.w $0000,y
	sta.b d0
	jsl.l PushNumber
	jmp.w .7

.t2xx:
	lda.b [a0]
	clc
	adc.b a2
	tay
	lda.w $0000,y
	sta.b d0
	inc.b a0
	inc.b a0
	lda.b [a0]
	clc
	adc.b a2
	tay
	lda.w $0000,y
	sta.b d1
	lda.b d0
	cmp.b d1
	bpl .t1xxx
	ldx.w #$0064
	jsl.l Mul8U
	tax
	lda.b d1
	beq .4
	jsl.l DivX8U
	bra .4

.t1xxx:
	lda.b d0
	beq .4
	lda.w #$0064
.4:
	sta.b d0
	jsl.l PushNumber
	lda.w #mesarea>>16
	sta.b $97
	lda.w #mesarea
	sta.b a3
	lda.w #$0002
	sta.b [a3]
	jsl.l appstring
	lda.w #StatPercent>>16
	sta.b $8F
	lda.w #StatPercent
	sta.b a1
	jsl.l appstring
	lda.b $97
	sta.b $8F
	lda.b a3
	sta.b a1
	bra .7
.5:
	lda.b [a0]
	inc.b a0
	inc.b a0
	clc
	adc.b a2
	tay
	lda.w $0000,y
	sta.b d0
	jsl.l PushNumber
	lda.b [a0]
	sta.b d1
	lda.w #mesarea>>16
	sta.b $97
	lda.w #mesarea
	sta.b a3
	lda.w #$0002
	sta.b [a3]
	jsl.l appstring
	lda.w #StatSlash>>16
	sta.b $8F
	lda.w #StatSlash
	sta.b a1
	jsl.l appstring
	lda.b a2
	clc
	adc.b d1
	tay
	lda.w $0000,y
	sta.b d0
	jsl.l PushNumber
	jsl.l appstring
	lda.b $97
	sta.b $8F
	lda.b a3
	sta.b a1
	bra .7
.6:
	lda.b [a0]
	clc
	adc.b a2
	tay
	lda.w $0000,y
	sta.b d0
	jsl.l PushTime
.7:
	lda.b [a1]
	inc a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w printx
	sta.w printx
	jsl.l PrintToStatsPage
.8:
	rts
