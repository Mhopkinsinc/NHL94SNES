; Data table.
DATA8_9C8080:		; a box map for the box drawer in bank $9D: width, height, a word, then the top, middle and
			;   bottom rows (corner, edge, corner)
	dw $0003,$0003,$0308
	dw $0000,$0001,$4000
	dw $0002,$0003,$4002
	dw $8000,$8001,$C000
