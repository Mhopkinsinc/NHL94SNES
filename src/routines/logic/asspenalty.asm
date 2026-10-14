; Assignment: the player skates to the penalty box
asspenalty:
	lda.w pflags,x
	bit.w #$0002
	bne .t1
	jmp.w .2

.t1:
	jsl.l CODE_9EBDF8
	lda.w pflags,x
	and.w #$FFF9
	ora.w #$1000
	sta.w pflags,x
	lda.w #$0000
	sta.b d4
	jsl.l CODE_9BC174
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
	jsl.l CODE_9EBEA1
	lda.b $08
	sta.b d1
	sta.w $1063,x
	lda.w #$0088
	sta.w $1043,x
	stz.w $1003,x
	lda.w pflags,x
	ora.w #$8000
	sta.w pflags,x
	stz.w $1103,x
	stz.w $1123,x
	lda.w #$0384
	sta.w $1083,x
.2:
	lda.w $1083,x
	sec
	sbc.w $0ADB
	sta.w $1083,x
	bpl CODE_9EBD45
.1:
	jmp.w CODE_9EBDC9
