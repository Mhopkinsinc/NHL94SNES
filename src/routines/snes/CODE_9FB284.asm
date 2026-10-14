; Unidentified routine.
CODE_9FB284:
	lda.w sflags
	bit.w #$0100
	beq CODE_9FB305
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9FB29D
	and.w #$FFFD
	sta.w pflags,x
	stz.w $1003,x
CODE_9FB29D:
	lda.w #$007E
	sta.b $8B
	lda.w #$312A
	sta.b a0
	lda.w pfteam,x
	beq CODE_9FB2B1
	lda.w #$312E
	sta.b a0
CODE_9FB2B1:
	lda.w SPAnum,x
	lsr a
	lsr a
	inc a
	sta.b d0
	lda.w $14A3,x
	bne CODE_9FB2C4
	inc.b d0
	inc.b d0
	inc.b d0
CODE_9FB2C4:
	lda.b d0
	sta.b [a0]
	lda.w $19D4,x
	bpl CODE_9FB304
	lda.w $1543,x
	pha
	lda.w #$0001
	sta.w $1543,x
	pla
	cmp.w #$0000
	bne CODE_9FB304
	lda.w #$F600
	sta.b d1
	lda.w $101F
	cmp.w #$0011
	bcc CODE_9FB2FA
	jsl.l RandomWord
	and.w #$0007
	sta.b d0
	beq CODE_9FB2FA
	lda.w #$F62A
	sta.b d1
CODE_9FB2FA:
	lda.w #$0001
	sta.w $1543,x
	jml.l SetSPA
