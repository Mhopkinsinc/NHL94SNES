; Unidentified routine.
CODE_9DA869:
	lda.b d1
	bit.w #$1000
	beq .t2
	jmp.w CODE_9DA7D7

.t2:
	bit.w #$0400
	beq .t1
	lda.w #$0002
	sta.b d0
	jsr.w CODE_9DAC4F
	jsr.w CODE_9DA973
	jmp.w CODE_9DA6FF

.t1:
	bit.w #$0800
	beq .2
	lda.w #$FFFE
	sta.b d0
	jsr.w CODE_9DAC4F
	jsr.w CODE_9DA973
.1:
	jmp.w CODE_9DA6FF
.2:
	lda.w #$0001
	sta.b d2
	lda.b d1
	bit.w #$0100
	bne .1x
	bit.w #$0200
	beq .1
	lda.w #$FFFF
	sta.b d2
.1x:
	jsr.w CODE_9DA8B8
	jsr.w CODE_9DA973
	jmp.w CODE_9DA6FF
