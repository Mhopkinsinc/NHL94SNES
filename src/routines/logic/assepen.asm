; Assignment: the player leaves the penalty box and comes onto the ice
assepen:
	lda.w pflags,x
	bit.w #$0002
	bne .t1
	jmp.w .t2

.t1:
	and.w #$FFFD
	sta.w pflags,x
	ldy.w #$0010
	lda.w pfteam,x
	beq .1
	ldy.w #$0001
.1:
	sty.b d0
	lda.w PBnum
	sec
	sbc.b d0
	sta.w PBnum
	stz.w $0EC3,x
	stz.w $0EE3,x
	lda.w #$003C
	sta.b d0
	lda.w pfteam,x
	bne .2
	lda.w #$FFC4
	sta.b d0
.2:
	lda.b d0
	sta.w Ypos,x
	lda.w #$0088
	sta.w Xpos,x
	lda.w #$0002
	sta.w facedir,x
	sta.w pfalock,x
	lda.w #$E936
	jsl.l SetSPAFromA
	jml.l SprSort

.t2:
	lda.w #$0004
	sta.w facedir,x
	lda.w #$FFFF
	sta.w newpnum,x
	sta.w newpos,x
	lda.w pflags,x
	and.w #$6FF7
	sta.w pflags,x
	stz.w $1563,x
	lda.w #$F000
	sta.w $0EC3,x
	ldx.b a2
	lda.w $19D0,x
	cmp.w #$0004
	bcc .2x
	ldy.w $0AF9,x
.loop:
	iny
	iny
	cpy.w #$000A
	bne .1x
	ldy.w #$0000
.1x:
	lda.w $19F6,y
	bpl .loop
	and.w #$00FF
	cmp.b a2
	bne .loop
	sta.w $19F6,y
	inc a
	inc a
	lsr a
	sta.w $1C84,y
	ldx.b $E4
	tya
	sta.w $19D4,x
	txa
	sta.w $19EC,y
.2x:
	ldx.b $E4
	jml.l CODE_9E8BE6
