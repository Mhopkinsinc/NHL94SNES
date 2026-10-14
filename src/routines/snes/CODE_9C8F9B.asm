; Unidentified routine.
CODE_9C8F9B:
	lda.w #$007F
	sta.b $12
	lda.w #$2780
	sta.b $10
	ldx.w #$4D80
	lda.l $7E35B6
	clc
	adc.l printfontset
	jsl.l CODE_808EDF
	lda.w #$0000
	sta.w printy
	lda.w #$0000
	sta.w $1DB9
	lda.w $1DA3
	sta.b d4
.loop:
	jsr.w .t2
	inc.w printy
	inc.w printy
	inc.w $1DB9
	dec.b d4
	bpl .loop
	rts

.t2:
	lda.w #$2800
	sta.w $0D0D
	lda.w #$0009
	sta.w printx
	lda.w $1DB9
	sta.b d0
	lda.w #$009C
	sta.b $8F
	lda.w #TeamStatNames
	sta.b a1
	lda.l OptPen
	bne .2
.1:
	lda.w #$009C
	sta.b $8F
	lda.w #TeamStatNamesNoPen
org $9C9000
	sta.b a1
.2:
	jsl.l AdvanceStringPtr
	jsl.l CODE_9EC894
	lda.w #$2400
	sta.w $0D0D
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
	lda.w #$009C
	sta.b $8B
	lda.w #DATA8_9C92FD
	sta.b a0
	lda.w $1DB9
	sta.b d0
CODE_9C9039:
	lda.b [a0]
	bpl .t2
	jmp.w CODE_9C9167

.t2:
	and.w #$00F0
	ora.w $1E15
	beq .1
	dec.b d0
	bmi .t1
.1:
	lda.b a0
	clc
	adc.w #$0006
	sta.b a0
	bra CODE_9C9039

.t1:
	lda.b [a0]
	and.w #$000F
	inc.b a0
	inc.b a0
	cmp.w #$0001
	bne .t3
	jmp.w CODE_9C90F0

.t3:
	cmp.w #$0002
	beq .t2x
	cmp.w #$0003
	bne .t1x
	jmp.w CODE_9C9145

.t1x:
	lda.b [a0]
	clc
	adc.b a2
	tay
	lda.w $0000,y
	sta.b d0
	jsl.l PushNumber
	jmp.w CODE_9C9154

.t2x:
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
	bpl .t1xx
	ldx.w #$0064
	jsl.l CODE_808F4C
	tax
	lda.b d1
	beq CODE_9C90BF
	jsl.l DivX8U
	bra CODE_9C90BF

.t1xx:
	lda.b d0
	beq CODE_9C90BF
	lda.w #$0064
CODE_9C90BF:
	sta.b d0
	jsl.l PushNumber
	lda.w #$0000
	sta.b $97
	lda.w #mesarea
	sta.b a3
	lda.w #$0002
	sta.b [a3]
	jsl.l appstring
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF36A
	sta.b a1
	jsl.l appstring
	lda.b $97
	sta.b $8F
	lda.b a3
	sta.b a1
	bra CODE_9C9154
