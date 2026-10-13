; Unidentified routine.
CODE_9BBFB9:		; draw SpriteFrames frame $0CCD (at most $3D0) at $0CCF, $0CD1
	lda.w $0CCD
	cmp.w #$03D1
	bcs CODE_9BC001
	lda.w #$0082
	sta.b $12
	lda.w #SpriteFrames
	sta.b $10
	lda.w $0CC5
	beq CODE_9BBFD6
	lda.w #$4000
	tsb.w $0CC9
CODE_9BBFD6:
	lda.w $0CD3
	beq CODE_9BBFE1
	lda.w #$8000
	tsb.w $0CC9
CODE_9BBFE1:
	lda.w $0CCD
	dec a
	bpl CODE_9BBFEA
	lda.w #$0000
CODE_9BBFEA:
	cmp.w #$03D0
	bcc CODE_9BBFF2
	lda.w #$03D0
CODE_9BBFF2:
	sta.b $00
	lda.w $0CC9
	ldx.w $0CCF
	ldy.w $0CD1
	jsl.l DrawSprite
org $9BC001
CODE_9BC001:
	rtl
