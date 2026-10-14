; Pause menu Game Stats
PauseGameStats:
	lda.b d1
	bit.w #$8080
	bne .t1
	jmp.w CODE_9FE19E

.t1:
	jsl.l ShowGameStats
	jsl.l CODE_9FE79F
	bra PauseSubmenuDone
