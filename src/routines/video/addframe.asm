; Draw sprite frame $0CCD at $0CCF / $0CD1
addframe:		; draw SpriteFrames frame $0CCD (at most $3D0) at $0CCF, $0CD1
	lda.w $0CCD
	cmp.w #$03D1
	bcs .rtl
	lda.w #SpriteFrames>>16
	sta.b $12
	lda.w #SpriteFrames
	sta.b $10
	lda.w $0CC5
	beq .1
	lda.w #$4000
	tsb.w $0CC9
.1:
	lda.w $0CD3
	beq .2
	lda.w #$8000
	tsb.w $0CC9
.2:
	lda.w $0CCD
	dec a
	bpl .3
	lda.w #$0000
.3:
	cmp.w #$03D0
	bcc .4
	lda.w #$03D0
.4:
	sta.b $00
	lda.w $0CC9
	ldx.w $0CCF
	ldy.w $0CD1
	jsl.l DrawSprite
org $9BC001
.rtl:
	rtl
