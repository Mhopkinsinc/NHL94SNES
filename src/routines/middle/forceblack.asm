; Turn the screen black: default interrupt handlers, forced blank, PPU registers reset
forceblack:
	lda.w $0AD3
	beq .1
	jsl.l CODE_9F96F7
	jsl.l CODE_9F9708
.1:
	jsl.l CODE_808684
	jmp.w CODE_8086D5
