; Print string [a1] into the text map at printx / printy
print:
	phx
	ldy.w #$0002
CODE_9EC7C2:
	lda.w printy
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w printx
	asl a
	adc.w printm
	tax
	lda.l $7E35B6
	adc.l printfontset
	ora.w $0D0D
	sta.b $14
CODE_9EC7DF:
	tya
	cmp.b [a1]
	bne .t2
	jmp.w CODE_9EC881

.t2:
	lda.b [a1],y
	bit.w #$0080
	bne CODE_9EC827
	and.w #$00FF
	cmp.w #$0040
	bne .t1
	jmp.w CODE_9EC888

.t1:
	phx
	asl a
	tax
	lda.l DATA8_9ACDB0+6,x
	adc.b $14
	plx
CODE_9EC803:
	cmp.l textmap,x
	beq .2
	sta.l textmap,x
	txa
	lsr a
	cmp.w textdirtylo
	bcs .1
	sta.w textdirtylo
.1:
	cmp.w textdirtyhi
	bcc .2
	sta.w textdirtyhi
.2:
	inc.w printx
	inx
	inx
	iny
	bra CODE_9EC7DF
CODE_9EC827:
	eor.w #$FFFF
	inc a
	pha
	and.w #$0030
	cmp.w #$0010
	bne .1
	clc
	adc.w #$0050
.1:
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	sta.w $0D0D
	lda.b $01,s
	and.w #$0040
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	tsb.w $0D0D
	pla
	and.w #$0003
	pha
	asl a
	tax
	lda.l printfontset,x
	sta.l printfontset
	pla
	dec a
	xba
	and.w #$FF00
	asl a
	asl a
	asl a
	sta.w printm
	iny
	lda.b [a1],y
	and.w #$007F
	sta.w printx
	iny
	lda.b [a1],y
	and.w #$007F
	sta.w printy
	iny
	jmp.w CODE_9EC7C2
CODE_9EC881:
	clc
	adc.b a1
	sta.b a1
	plx
	rtl
