; Unidentified routine.
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
