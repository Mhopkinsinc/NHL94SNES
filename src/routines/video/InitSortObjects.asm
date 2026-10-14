; Clear the sorted objects and set up the objects from their start tables
InitSortObjects:
	phb
	phk
	plb
	ldx.w #$0000
.loop:
	stz.w Xpos,x
	inx
	inx
	cpx.w #$076E
	bne .loop
	stz.b d6
	stz.b a1
	stz.b a2
	stz.b a3
	stz.b a4
	stz.w $0DF9
.loop2:
	ldx.b a2
	ldy.b a3
	lda.b d6
	sta.w $1143,y
	lda.w #$FFFF
	sta.w $0E23,y
	sta.w pnum,y
	lda.w .3,x
	sta.w Xpos,y
	lda.w .3+2,x
	sta.w Ypos,y
	lda.w .3+6,x
	sta.w $0D97,y
	lda.w .3+8,x
	sta.w attribute,y
	lda.w .3+10,x
	sta.w $10C3,y
	lda.w .3+12,x
	sta.w $10E3,y
	lda.b d6
	asl a
	asl a
	asl a
	tay
	lda.w .3+14,x
	sta.w asslist,y
	ldy.b a3
	sta.w $0B7D,y
	lda.w .3+16,x
	sta.w pflags,y
	lda.w #$0000
	sta.w $1563,y
	cpy.w #$001E
	bne .1
	lda.w #$0001
	sta.w $1563,y
.1:
	cpx.w #$006C
	rol a
	inc a
	and.w #$0001
	sta.w pfgoal,y
	cpx.w #$006C
	bcc .2
	cpx.w #$00D8
	bcs .2
	lda.w #$0034
	sta.w pfteam,y
.2:
	inc.b a3
	inc.b a3
	sep #$20
	lda.b d6
	asl a
	ldy.b a1
	sta.w OOlist,y
	inc.b a1
	rep #$30
	ldy.b a4
	lda.b d6
	sta.w OOlistpos,y
	inc.b a4
	inc.b a4
	inc.b d6
	lda.b a2
	clc
	adc.w #$0012
	sta.b a2
	lda.b d6
	cmp.w #$0010
	beq .t1
	jmp.w .loop2

.t1:
	lda.w #$FFFF
	sta.w $0F5B
	sta.w $0F5D
	plb
	jmp.w SprSort
.3:		; a record of 9 words per object, read by the .loop2 loop above
	dw $0160,$00C0,$0000,$0001,$0000,$0008,$0004,$0000,$0000
	dw $FF38,$FF9C,$0000,$0001,$0000,$0008,$0004,$0000,$0000
	dw $FF38,$FFB0,$0000,$0001,$0000,$0008,$0004,$0000,$0000
	dw $FF38,$FFC4,$0000,$0001,$0000,$0008,$0004,$0000,$0000
	dw $FF38,$FFD8,$0000,$0001,$0000,$0008,$0004,$0000,$0000
	dw $FF38,$FFEC,$0000,$0001,$0000,$0008,$0004,$0000,$0000
	dw $00C0,$00C0,$0000,$0001,$0001,$0008,$0004,$0000,$0000
	dw $FF38,$0028,$0000,$0001,$0001,$0008,$0004,$0000,$0000
	dw $FF38,$003C,$0000,$0001,$0001,$0008,$0004,$0000,$0000
	dw $FF38,$0050,$0000,$0001,$0001,$0008,$0004,$0000,$0000
	dw $FF38,$0064,$0000,$0001,$0001,$0008,$0004,$0000,$0000
	dw $FF38,$0078,$0000,$0001,$0001,$0008,$0004,$0000,$0000
	dw $0000,$010C,$0000,$0197,$0000,$0014,$0006,$0000,$0000
	dw $0000,$FEF4,$0000,$0198,$0000,$0014,$0006,$0000,$0000
	dw $0000,$0000,$0000,$018D,$0000,$0005,$0005,$0018,$0001
	dw $0000,$0000,$0000,$018C,$0000,$0003,$0003,$0019,$0000
