; Unidentified routine.
CODE_9EF3C3:
	ldy.b a2
	lda.w $17CE,y
	inc a
	sta.w $17CE,y
CODE_9EF3CC:
	lda.w $1E89
	beq CODE_9EF3DA
	ldy.b a2
	lda.w $17DA,y
	inc a
	sta.w $17DA,y
CODE_9EF3DA:
	jsl.l MusicStop
	lda.w #$0002
	jsl.l CODE_9C9A7F
	stz.w $0C23
	ldy.b a2
	beq CODE_9EF406
	lda.w #$0004
	jsl.l CODE_9C9FD5
	lda.l $7E35E0
	sec
	sbc.w #$0300
	bpl CODE_9EF400
	lda.w #$0000
CODE_9EF400:
	sta.l $7E35E0
	bra CODE_9EF424
