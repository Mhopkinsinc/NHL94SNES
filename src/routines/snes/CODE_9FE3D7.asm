; Unidentified routine.
CODE_9FE3D7:
	lda.w tmgoalie,y
	bmi CODE_9FE3E7
CODE_9FE3DC:
	dec a
CODE_9FE3DD:
	sta.w tmgoalie,y
	jsl.l setpersonel
	jmp.w $E19E
