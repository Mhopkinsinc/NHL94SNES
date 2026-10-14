; After a game: the password and the playoff screen, then the next game or the start
GameOver:
	stz.w $07C6
	jsl.l EncodePW
	jsl.l CODE_9D8BBF
	lda.l $7E34BC
	cmp.w #$0001
	beq CODE_9F8DCE
	jml.l CODE_9F82D2
