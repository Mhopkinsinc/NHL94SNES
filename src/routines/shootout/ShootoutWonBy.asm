; "<team> Wins!" once the shootout is decided
ShootoutWonBy:		; "<team> Wins!" once the shootout is decided
	lda.w $1D81
	bne CODE_80C94B
	jmp.w CODE_80CA05
