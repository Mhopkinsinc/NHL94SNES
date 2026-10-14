; The assignment routines, by assignment number
asstab:
	dd rtss,assdefo,assdefd,asswingd
	dd asswingo,asscenterd,asscentero,assgoalie
	dd assscore,assstanley,asseben,assepen
	dd assbench,asspenalty,assdopen,assgoalietopuck
	dd CODE_9EE463,asspuckc,assnearest,assshoot
	dd CODE_9EED8D,asspassrec,assfaceoff,assfaceoffpl
	dd pucknorm,puckshadow,pucknothing,puckfaceoff
	dd puckfaceoff2
	db $9C,$FF,$EC,$FF,$64,$00,$EC,$FF,$88,$FF,$28,$00,$14,$00,$28,$00
	db $78,$00,$28,$00,$EC,$FF,$28,$00,$D8,$FF,$F0,$00,$00,$00,$DC,$00
	db $14,$00,$E6,$00,$1E,$00,$E6,$00,$07,$01,$02,$03,$04,$05,$06,$07
	db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F,$04,$03,$04,$03,$02,$01,$04,$00
	db $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $03,$04,$03
