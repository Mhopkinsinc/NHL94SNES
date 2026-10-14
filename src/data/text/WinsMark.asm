; Screen titles: Wins!, Win!, Shootout, Edit Lines, and the cursors between them
WinsMark:
	%String("Wins!")
WinMark:
	%String("Win!")
DATA8_9CEF66:
	dw $0005 : db $AF,$00,$00
DATA8_9CEF6B:
	dw $0005 : db $BF,$09,$0A
DATA8_9CEF70:
	dw $0011 : db $9F,$0A,$0B,"   Lineup   "
DATA8_9CEF81:
	dw $0005 : db $AF,$00,$00
DATA8_9CEF86:
	dw $0005 : db $BF,$09,$0A
DATA8_9CEF8B:
	dw $0011 : db $9F,$0A,$0B,"   Lineup   "
ShootoutLabel:
	%String("Shootout")
DATA8_9CEFA6:
	dw $0005 : db $AF,$0B,$07
DATA8_9CEFAB:
	dw $0005 : db $AF,$00,$0D
DATA8_9CEFB0:
	dw $0005 : db $AF,$00,$0E
DATA8_9CEFB5:
	dw $0005 : db $AF,$00,$00
DATA8_9CEFBA:
	dw $0005 : db $AF,$00,$00
DATA8_9CEFBF:
	dw $000B : db $AF,$03,$02,"Player"
DATA8_9CEFCA:
	dw $0006 : db $AF,$02,$02,"{"
DATA8_9CEFD0:
	dw $0006 : db $AF,$09,$02,"}"
DATA8_9CEFD6:
	dw $0005 : db $AF,$00,$03
DATA8_9CEFDB:
	dw $0005 : db $9F,$08,$0A
DATA8_9CEFE0:
	dw $0005 : db $BF,$0B,$01
DATA8_9CEFE5:
	dw $0005 : db $9F,$08,$0A
DATA8_9CEFEA:
	dw $0005 : db $BF,$00,$00
DATA8_9CEFEF:
	dw $0005 : db $BF,$07,$09
EditLinesLabel:
	%String("Edit Lines")
