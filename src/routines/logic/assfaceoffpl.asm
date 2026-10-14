; Assignment: the players taking the face off
assfaceoffpl:
	lda.w pfalock,x
	beq .t1
.1x:
	jmp.w .t2

.t1:
	lda.w sflags
	bit.w #$0100
	beq .t3
	lda.w pflags,x
	bit.w #$0002
	beq .1xx
	and.w #$FFFD
	sta.w pflags,x
	stz.w $1003,x
.1xx:
	lda.w #$007E
	sta.b $8B
	lda.w #$312A
	sta.b a0
	lda.w pfteam,x
	beq .2
	lda.w #$312E
	sta.b a0
.2:
	lda.w SPAnum,x
	lsr a
	lsr a
	inc a
	sta.b d0
	lda.w $14A3,x
	bne .3
	inc.b d0
	inc.b d0
	inc.b d0
.3:
	lda.b d0
	sta.b [a0]
	lda.w $19D4,x
	bpl .t2
	lda.w $1543,x
	pha
	lda.w #$0001
	sta.w $1543,x
	pla
	cmp.w #$0000
	bne .t2
	lda.w #SPAfaceoff
	sta.b d1
	lda.w $101F
	cmp.w #$0011
	bcc .4
	jsl.l RandomWord
	and.w #$0007
	sta.b d0
	beq .4
	lda.w #SPAfaceoffr
	sta.b d1
.4:
	lda.w #$0001
	sta.w $1543,x
	jml.l SetSPA

.t2:
	rtl

.t3:
	lda.w #$0014
	sta.w $1203,x
	jml.l assexit
