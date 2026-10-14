; Crowd meter screen
ShowCrowdMeter:
	lda.w VisTeam
	sta.l $7E3454
	lda.w HomeTeam
	sta.l $7E3452
	jsl.l CODE_9DD9AD
	lda.w #$009C
	sta.b $0E
	lda.w #DATA8_9C8328
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
	ldy.w #$0050
	ldx.w #$0010
	jsl.l CODE_9DE0BD
	jsl.l CODE_9DE0D4
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF163
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0800
	sta.w $0D0D
	lda.w #$0014
	sta.b d0
	lda.w #$0005
	sta.b d1
	jsl.l CODE_9D8091
	lda.w #$0096
	sta.b $0E
	lda.w #DATA8_96D7AC
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
	stx.b $10
	stx.b $00
	jsl.l LinearToPlanar
	lda.b $10
	sta.b $0C
	tax
	lda.l $7E35C4
	asl a
	asl a
	asl a
	asl a
	clc
	adc.w #$1000
	tay
	jsl.l CODE_80891F
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9ACFB6
	sta.b $0C
	ldy.w #$0070
	ldx.w #$0010
	jsl.l CODE_9DE0BD
	lda.w #$6F7B
	sta.l $7F75C2
	jsl.l CODE_9DE0D4
	stz.w $1DB9
	jsl.l ScreenOn
.1:
	jsl.l SpriteFrameStart
	ldx.w #$0048
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #CrowdMeter
	sta.b a1
	jsl.l CODE_9C936C
	jsl.l CODE_9DDDB3
	jsl.l CODE_9BA563
	jsl.l SpriteFrameEnd
.2:
	jsl.l CODE_9DD923
	jsl.l WaitFrame
	jsl.l CODE_9B8017
	jsl.l CODE_9B851F
	jsl.l ProcessInputWithRepeat
	lda.b d1
	bit.w #$1000
	bne .t1
	bit.w #$0800
	bne .t2
	bit.w #$0400
	bne .t3
	bra .2

.t1:
	rtl

.t2:
	lda.w $1DB9
	dec a
	bmi .2
	sta.w $1DB9
	bra .1

.t3:
	lda.w $1DB9
	inc a
	cmp.w #$0003
	bcs .2
	sta.w $1DB9
	bra .1
