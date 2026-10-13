; Bank $80, sixth 4 KB: the end of the shootout player list, then game data that code all over the cartridge reads.
; The code draws the list ShooterSelectList scrolls through (a column title, then rows of players with the rating of the
; column) and puts the chosen player in the shooter row, swapping if that player is already in the list.
; The data: tables of long pointers (four bytes, $FFFFFFFF for none), the stoppage messages and penalty names with their
; data, line and period abbreviations, the playoff round names, the rating column titles for skaters and goalies, the
; position names, bit masks, and a run of 48-byte records that continues in the next file. It is laid out by its byte
; structure; the tables are named once the code that reads them is disassembled.

org $80D001
	jmp.w CODE_80CF48
CODE_80D004:		; draw the ShooterSelectList list: the title of rating column $0D47, the scroll marks, the rows
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFBA
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0020
	sta.b $A5
	lda.w #$000D
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	jsl.l CODE_9FBD9C
	lda.w #$0011
	sta.w $0D0F
	lda.w #$0002
	sta.w $0D11
CODE_80D03E:
	lda.w #$0080
	sta.b $8F
	lda.w #DATA8_80D0EA
	sta.b $8D
	lda.w $0D47
	sta.b $A5
	bra CODE_80D059
CODE_80D04F:
	lda.b $8D
	clc
	adc.b [$8D]
	adc.w #$0004
	sta.b $8D
CODE_80D059:
	lda.b [$8D]
	bmi CODE_80D061
	dec.b $A5
	bpl CODE_80D04F
CODE_80D061:
	lda.b [$8D]
	bpl CODE_80D06A
	dec.w $0D47
	bra CODE_80D03E
CODE_80D06A:
	lda.w #$3800
	sta.w $0D0D
	jsl.l CODE_9EC7BE
	lda.b [$8D]
	sta.b $B7
	ldy.w #$0002
	lda.b [$8D],y
	sta.b $B5
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFBF
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $1DA7
	cmp.w $1DAB
	beq CODE_80D0BB
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFCA
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
CODE_80D0BB:
	lda.w $1DA7
	sec
	sbc.w $1DAB
	clc
	adc.w #$0009
	cmp.w $1DA3
	bpl CODE_80D0E5
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFD0
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
CODE_80D0E5:
	jsl.l CODE_80D21C
	rtl
DATA8_80D0EA:		; rating columns of the shooter list: title, then a mask word and a value word; $FFFF ends it
	%String("      Status]")
	dw $0000,$0000
	%String("    [Overall]")
	dw $1F3A,$000A
	%String("     [Energy]")
	dw $0000,$0002
	%String("    [Agility]")
	dw $1000,$000A
	%String("      [Speed]")
	dw $0800,$000A
	%String("     [Handed]")
	dw $0040,$0004
	%String("[Off. Aware.]")
	dw $0400,$000A
	%String("[Def. Aware.]")
	dw $0200,$000A
	%String(" [Shot Power]")
	dw $0100,$000A
	%String(" [Shot Accur]")
	dw $0010,$000A
	%String(" [Pass Accur]")
	dw $0002,$000A
	%String("[Stick Handl]")
	dw $0020,$000A
	%String("     [Weight]")
	dw $2000,$0006
	%String(" [ Endurance]")
	dw $0008,$000A
	%String(" [Aggression]")
	dw $0001,$000A
	%String("   [Checking ")
	dw $0080,$000A
	dw $FFFF
CODE_80D21C:		; print the rows of the list from $1DA7, the row at the cursor ($1D9B) in another palette
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFD6
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $0D43
	dec a
	asl a
	asl a
	asl a
	sta.b $A5
	ldy.b $91
	lda.w $1DA7
	inc a
	sta.b $95
	lda.w #$0080
	sta.b $9F
	lda.w #DATA8_80D9B3
	sta.b $9D
	lda.w #$0008
	sta.b $A9
	lda.w $0D43
	sec
	sbc.w #$0005
	beq CODE_80D269
	bmi CODE_80D265
	bvc CODE_80D267
	bra CODE_80D269
CODE_80D265:
	bvc CODE_80D269
CODE_80D267:
	dec.b $A9
CODE_80D269:
	lda.w #$3800
	sta.w $0D0D
	lda.b $A9
	cmp.w $1D9B
	bne CODE_80D27C
	lda.w #$2000
	sta.w $0D0D
CODE_80D27C:
	lda.b $8F
	sta.b $9F
	lda.b $8D
	sta.b $9D
	lda.w #$0002
	sta.w $0D0F
	lda.b $95
	and.w #$00FF
	dec a
	sta.b $A5
	sta.b $04
	stz.b $08
	jsl.l CODE_9ED300
	lda.b $04
	cmp.b $A5
	bpl CODE_80D2A5
	lda.w #$0010
	sta.b $08
CODE_80D2A5:
	lda.b $04
	sta.b $A5
	jsl.l CODE_9F9745
	inc.b $95
	inc.w $0D11
	dec.b $A9
	bpl CODE_80D269
	lda.w #$2000
	sta.w $0D0D
	rtl
CODE_80D2BD:		; put the player at the cursor in shooter row $1DB9; if that player is already in the list, the two swap
	ldy.b $A9
	phy
	lda.w #$0009
	sec
	sbc.w $1D9B
	clc
	adc.w $1DA7
	and.w #$00FF
	sta.b $A5
	lda.w #$0000
	sta.b $8F
	lda.w #homeshooters
	sta.b $8D
	lda.b $91
	beq CODE_80D2E8
	lda.w #$0000
	sta.b $8F
	lda.w #awayshooters
	sta.b $8D
CODE_80D2E8:
	ldy.w $1DB9
	sep #$20
	lda.b [$8D],y
	rep #$20
	and.w #$00FF
	sta.b $A9
	lda.b $A5
	ldy.w #$0001
CODE_80D2FB:
	sep #$20
	cmp.b [$8D],y
	rep #$20
	beq CODE_80D30B
	iny
	cpy.w #$0007
	bmi CODE_80D2FB
	bra CODE_80D313
CODE_80D30B:
	lda.b $A9
	sep #$20
	sta.b [$8D],y
	rep #$20
CODE_80D313:
	ldy.w $1DB9
	lda.b $A5
	sep #$20
	sta.b [$8D],y
	rep #$20
	pla
	sta.b $A9
	rtl
CODE_80D322:		; does nothing
	rtl
CODE_80D323:		; does nothing
	rtl
DATA8_80D324:
	dd $009ED0FC,$009E8804,$009E8618,$009E8968
	dd $009E8A6A,$009E8573,$009E843C,$009ED331
	dd $009EB0B8,$009EA69D,$009FD9E1,$009EBADA
	dd $009FD85F,$009EBCC7,$009EBEDF,$009ED179
	dd $009EE463,$009E8292,$009E800D,$009EE146
	dd $009EED8D,$009EE706,$009FB26A,$009FB27C
	dd $009EDCA8,$009EEF34,$009EDE81,$009FB355
	dd $009FA835
	db $9C,$FF,$EC,$FF,$64,$00,$EC,$FF,$88,$FF,$28,$00,$14,$00,$28,$00
	db $78,$00,$28,$00,$EC,$FF,$28,$00,$D8,$FF,$F0,$00,$00,$00,$DC,$00
	db $14,$00,$E6,$00,$1E,$00,$E6,$00,$07,$01,$02,$03,$04,$05,$06,$07
	db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F,$04,$03,$04,$03,$02,$01,$04,$00
	db $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $03,$04,$03
DATA8_80D3EB:
	db $00,$00,$36,$00,$49,$00,$9F,$00,$9F,$00,$D6,$00,$7A,$00,$5A,$00
	db $62,$00,$8B,$00,$40,$01,$6A,$00,$DC,$00,$FE,$00,$60,$01,$A1,$01
	db $80,$01,$20,$01,$C2,$00,$C6,$01,$DE,$01,$F1,$01,$11,$02,$33,$02
	db $AF,$00,$72,$00,$00,$00,$00,$01,$0D,$00
	db "Period Over",$10,$05,$F0,$BF,$00
	db $01,$0B,$00,"Game Over",$10,$05,$D0,$BF
	db $00,$01,$02,$00,$0A,$05,$E0,$BF,$00,$01,$02,$00,$10,$05,$F0,$BF
	db $00,$01,$02,$00,$10,$05,$FA,$BF,$00,$01,$02,$00,$10,$05,$D0,$BF
	db $00,$01,$07,$00,"Icing",$02,$00,$01,$01,$0F,$02,$FA
	db $BF,$00,$01,$0A,$00,"Off-side",$02,$00,$01
	db $03,$0F,$04,$FA,$BF,$00,$01,$0A,$00
	db "Face Off",$0A,$05,$F8,$BF,$00,$00,$09,$00
	db "Penalty",$03,$00,$01,$03,$1F,$04,$FA,$BF,$01
	db $01,$0E,$00,"Penalty Shot",$10
	db $05,$FA,$BF,$00,$00,$02,$00,$F6,$FA,$02,$04,$0A,$00
	db "Charging",$04,$00,$01,$01,$01,$0A,$01,$0B
	db $01,$0A,$01,$0B,$01,$0A,$01,$0B,$01,$0A,$01,$0B,$FF,$FE,$02,$04
	db $0A,$00,"Slashing",$04,$00,$01,$01,$01,$02
	db $01,$03,$01,$02,$01,$03,$01,$02,$01,$03,$01,$02,$01,$03,$FF,$FE
	db $02,$04,$0A,$00,"Tripping",$04,$00,$01,$04
	db $01,$05,$01,$04,$01,$05,$01,$04,$01,$05,$01,$04,$01,$05,$FF,$FE
	db $02,$0A,$0A,$00,"Roughing",$04,$00,$01,$0D
	db $01,$0E,$01,$0D,$01,$0E,$01,$0D,$01,$0E,$01,$0D,$01,$0E,$FF,$FE
	db $02,$04,$0A,$00,"Roughing",$04,$00,$01,$0D
	db $01,$0E,$01,$0D,$01,$0E,$01,$0D,$01,$0E,$01,$0D,$01,$0E,$FF,$FE
	db $02,$04,$09,$00,"Hooking",$04,$00,$01,$01,$01
	db $09,$01,$08,$01,$09,$01,$08,$01,$09,$01,$08,$01,$09,$01,$08,$FF
	db $FE,$02,$04,$0D,$00,"Cross Check"
	db $04,$00,$01,$06,$01,$0F,$01,$10,$01,$0F,$01,$10,$01,$0F,$01,$10
	db $01,$0F,$01,$10,$FF,$FE,$02,$04,$0E,$00
	db "Interference",$04,$00,$01,$01
	db $06,$0C,$FF,$FE,$02,$04,$09,$00,"Holding",$04
	db $00,$01,$01,$06,$07,$FF,$FE,$05,$28,$0A,$00
	db "Fighting",$04,$00,$01,$0D,$01,$0E,$01,$0D
	db $01,$0E,$01,$0D,$01,$0E,$01,$0D,$01,$0E,$FF,$FE,$05,$28,$0C,$00
	db "Fighting *",$04,$00,$01,$0D,$01,$0E
	db $01,$0D,$01,$0E,$01,$0D,$01,$0E,$01,$0D,$01,$0E,$FF,$FE,$02,$28
	db $12,$00
	db "Fight Instigator"
	db $04,$00,$01,$0D,$01,$0E,$01,$0D,$01,$0E,$01,$0D,$01,$0E,$01,$0D
	db $01,$0E,$FF,$FE,$0E,$00,$0E,$00,$1C,$00,$2A,$00,$54,$00,$3F,$00
	db $54,$00,$01,$09,$11,$19,$21,$29,$31,$02,$0A,$12,$1A,$22,$2A,$32
	db $02,$0A,$12,$1A,$22,$2A,$32,$01,$09,$11,$19,$21,$29,$31,$03,$0B
	db $13,$1B,$23,$2B,$33,$05,$0D,$15,$1D,$25,$2D,$35,$04,$0C,$14,$1C
	db $24,$2C,$34,$05,$0D,$15,$1D,$25,$2D,$35,$03,$0B,$13,$1B,$23,$2B
	db $33,$04,$0C,$14,$1C,$24,$2C,$34,$04,$0C,$14,$1C,$24,$2C,$34,$03
	db $0B,$13,$1B,$23,$2B,$33,$05,$0D,$15,$1D,$25,$2D,$35,$FF,$00,$01
	db $02,$04,$03,$05,$06,$00,$03,$01,$02,$04,$05,$06,$05,$00
	db "Sc1",$05,$00,"Sc2",$05,$00,"Chk",$05,$00
	db "PP1",$05,$00,"PP2",$05,$00,"PK1",$05,$00
	db "PK2",$04,$00,$31,$12,$04,$00,$32,$13,$04,$00,$33,$14,$04
	db $00,$4F,$54,$07,$00,"Final",$06,$00,$0E,$0F,$10,$11
DATA8_80D6FE:
	db $00,$B7,$00,$00,$00,$00,$00,$B9,$00,$00,$00,$00,$00,$00,$B8,$00
	db $33,$CB,$36,$38,$3A,$3C,$3E,$40,$42,$44,$BA,$00,$00,$00,$00,$4A
	db $4A,$00,$02,$04,$06,$08,$0A,$0C,$0E,$F0,$11,$13,$15,$17,$19,$1B
	db $1D,$1F,$21,$23,$25,$27,$29,$2B,$2D,$2F,$31
DATA8_80D739:		; playoff round names
	%String("NHL Hockey Night")
	%String("First Round Playoff")
	%String("Conference Semifinal")
	%String("Conference Final")
	%String("Stanley Cup Final")
DATA8_80D79B:		; skater rating columns, as DATA8_80D0EA
	%String("   Status   ]")
	dw $0000,$0000
	%String("[  Overall  ]")
	dw $9FBA,$000A
	%String("[  Energy   ]")
	dw $0000,$0002
	%String("[  Agility  ]")
	dw $1000,$000A
	%String("[   Speed   ]")
	dw $0800,$000A
	%String("[  Handed   ]")
	dw $0040,$0004
	%String("[Off. Aware.]")
	dw $0400,$000A
	%String("[Def. Aware.]")
	dw $0200,$000A
	%String("[Shot Power ]")
	dw $0100,$000A
	%String("[Shot  Accur]")
	dw $0010,$000A
	%String("[Pass  Accur]")
	dw $0002,$000A
	%String("[Stick Handl]")
	dw $0020,$000A
	%String("[  Weight   ]")
	dw $2000,$0006
	%String("[ Endurance ]")
	dw $0008,$000A
	%String("[Aggression ]")
	dw $0001,$000A
	%String("[ Checking   ")
	dw $0080,$000A
	dw $FFFF
DATA8_80D8CD:		; goalie rating columns, as DATA8_80D0EA
	%String("   Status   ]")
	dw $0000,$0000
	%String("[  Overall  ]")
	dw $930F,$000A
	%String("[  Agility  ]")
	dw $1000,$000A
	%String("[   Speed   ]")
	dw $0800,$000A
	%String("[Glove Hand ]")
	dw $0040,$0004
	%String("[Def. Aware.]")
	dw $0200,$000A
	%String("[Puck Cont. ]")
	dw $0100,$000A
	%String("[Stick Right]")
	dw $0008,$000A
	%String("[Stick Left ]")
	dw $0004,$000A
	%String("[Glove Right]")
	dw $0002,$000A
	%String("[Glove Left ]")
	dw $0001,$000A
	%String("[   Weight   ")
	dw $2000,$0006
	dw $FFFF
DATA8_80D9B3:		; position names
	%String("LD")
	%String("RD")
	%String("LW")
	%String("C")
	%String("RW")
DATA8_80D9C6:
	db $10,$C7,$9F,$01,$11,$65,$CA,$01,$44,$17,$F7,$01,$A9,$DD,$25,$02
	db $40,$B8,$56,$02,$09,$A7,$89,$02,$04,$AA,$BE,$02,$31,$C1,$F5,$02
	db $90,$EC,$2E,$03,$21,$2C,$6A,$03,$E4,$7F,$A7,$03,$D9,$E7,$E6,$03
	db $00,$64,$28,$04,$59,$F4,$6B,$04,$E4,$98,$B1,$04,$A1,$51,$F9,$04
DATA8_80DA06:
	dw $0000,$00C8,$008D,$008D,$00C8,$0000,$008D,$FF73
	dw $0000,$FF38,$FF73,$FF73,$FF38,$0000,$FF73,$008D
DATA8_80DA26:		; single-bit masks, bit 0 up
	dw $0001,$0002,$0004,$0008,$0010,$0020,$0040,$0080
	dw $0100,$0200,$0400,$0800,$1000,$2000,$4000,$8000
DATA8_80DA46:
	db $08,$00,$04,$08,$06,$07,$05,$08,$02,$01,$03,$08,$08,$08,$08,$08
TeamSongs:		; songs for MusicStart, six per team (long pointers, $FFFFFFFF none), by home team and song slot
	dd $FFFFFFFF,$FFFFFFFF,$FFFFFFFF,$FFFFFFFF
	dd $FFFFFFFF,$FFFFFFFF,$00999A9C,$009AAF99
	dd $009AADE5,$FFFFFFFF,$009AB2DF,$00999A9C
	dd $00968646,$00978BBB,$00978BBB,$00968646
	dd $009AB2DF,$FFFFFFFF,$009A9601,$00978000
	dd $009A9601,$00978000,$0097DA41,$0097DA41
	dd $0096E1A9,$0099D765,$0099CEDE,$0096E1A9
	dd $009AB2DF,$009785F0,$00999A9C,$008BFE74
	dd $008BFE74,$FFFFFFFF,$009AB2DF,$FFFFFFFF
	dd $0096F46D,$009890B0,$0099D765,$FFFFFFFF
	dd $009AB2DF,$009890B0,$0098DF46,$00999A9C
	dd $00999A9C,$FFFFFFFF,$009AB2DF,$FFFFFFFF
	dd $FFFFFFFF,$FFFFFFFF,$FFFFFFFF,$FFFFFFFF
	dd $FFFFFFFF,$FFFFFFFF,$0099BB80,$0097E67A
	dd $0096FA7D,$0097E67A,$009AB2DF,$0099BB80
	dd $009A9BAD,$009A9BAD,$0099D765,$00978000
	dd $009AB2DF,$0081FE45,$009890B0,$009AA14D
	dd $009890B0,$00989C71,$009AB2DF,$0096E4D9
	dd $0096D442,$0097FC21,$0096D442,$FFFFFFFF
	dd $009AB2DF,$0096F46D,$00978BBB,$008BFE74
	dd $00978BBB,$0096D0CE,$009AB2DF,$0096D0CE
	dd $00999A9C,$009AAA6E,$0096D442,$FFFFFFFF
	dd $009AB2DF,$FFFFFFFF,$00978BBB,$009890B0
	dd $0096EE45,$FFFFFFFF,$009AB2DF,$FFFFFFFF
	dd $0099CA96,$0097B78D,$0099CA96,$00969C09
	dd $009AB2DF,$00969C09,$00979162,$0096F779
	dd $00979162,$0096AEBB,$009AB2DF,$0096AEBB
	dd $0096E7FD,$0097DA41,$0096E7FD,$FFFFFFFF
	dd $009AB2DF,$0097DA41,$008EFD2B,$0096B6CD
	dd $0096BEA5,$0096DB0E,$0097CB79,$009785F0
	dd $0097F4F1,$0097969D,$0097969D,$0097F4F1
	dd $009AB2DF,$0096EB21,$0097B50D,$00999CD0
	dd $00999CD0,$FFFFFFFF,$009AB2DF,$FFFFFFFF
	dd $009A97E5,$009A97E5,$0099C872,$FFFFFFFF
	dd $009AB2DF,$FFFFFFFF,$0097E19B,$008EFD2B
	dd $009AB931,$FFFFFFFF,$009AB2DF,$FFFFFFFF
	dd $009890B0,$0096C265,$009890B0,$FFFFFFFF
	dd $009AB2DF,$009890B0,$00978BBB,$009890B0
	dd $0096EE45,$FFFFFFFF,$009AB2DF,$FFFFFFFF
	dd $FFFFFFFF,$FFFFFFFF,$FFFFFFFF,$FFFFFFFF
	dd $FFFFFFFF,$FFFFFFFF,$FFFFFFFF,$FFFFFFFF
	dd $FFFFFFFF,$FFFFFFFF,$FFFFFFFF,$FFFFFFFF
DefaultSongs:		; songs for MusicStart, one picked at random when the home team has none for the slot
	dd $00968646,$0099BB80,$0097E67A,$0096D0CE
	dd $00969C09,$0096AEBB,$009785F0,$0098C874
DATA8_80DD16:
	dd $0091F2F9,$0095B15C,$00959490,$009293F3
	dd $0096DE60,$00948D6F,$009AE080,$009782F8
	dd $0093C20B,$0094CABF,$009AF59C,$00928000
	dd $0094B287,$0094ED96,$0094E225,$0096AA64
	dd $0095CBEA,$0091C7A7,$00958ABD,$0095D3F2
	dw $003A,$006A,$009A,$00CA,$00FA,$03FA,$012A,$015A
	dw $018A,$01BA,$01EA,$021A,$024A,$02AA,$02DA,$030A
	dw $033A,$036A,$039A,$027A,$03CA,$042A,$045A,$048A
	dw $04BA,$04EA,$054A,$051A,$027A
	db $FC,$00,$E2,$04,$00,$00,$2A,$00,$00,$70,$00,$70,$01,$00,$00,$70
	db $00,$7F,$50,$50,$00,$FF,$E0,$50,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00
	db $FC,$00,$5F,$05,$00,$00,$25,$00,$00,$70,$00,$70,$01,$00,$00,$70
	db $00,$7F,$70,$70,$00,$FF,$E0,$70,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00
	db $FC,$00,$5F,$05,$00,$00,$1A,$00,$00,$70,$00,$70,$01,$00,$00,$70
	db $00,$7F,$70,$70,$01,$FF,$E0,$70,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00
	db $FC,$00,$5F,$05,$00,$00,$1C,$00,$00,$70,$00,$70,$01,$00,$00,$70
	db $00,$7F,$70,$70,$02,$FF,$E0,$70,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00
	db $FC,$00,$5F,$05,$00,$00,$38,$00,$00,$70,$00,$70,$01,$00,$00,$70
	db $00,$7F,$70,$70,$03,$FF,$E0,$70,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00
	db $FC,$00,$5F,$05,$00,$00,$24,$00,$00,$70,$00,$70,$01,$00,$00,$70
	db $00,$7F,$70,$70,$05,$FF,$E0,$70,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00
	db $FC,$00,$5F,$05,$00,$00,$07,$00,$00,$70,$00,$70,$01,$00,$00,$70
	db $00,$7F,$70,$70,$06,$FF,$E0,$70,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00
	db $FC,$00,$5F,$05,$00,$00,$09,$00,$00,$70,$00,$70,$01,$00,$00,$70
	db $00,$7F,$70,$70,$07,$FF,$E0,$70,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00
	db $FC,$00,$5F,$05,$00,$00,$20,$00,$00,$70,$00,$70,$01,$00,$00,$70
	db $00,$7F,$70,$70,$08,$FF,$E0,$70,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00
	db $FC,$00,$5F,$05,$00,$00,$22,$00,$00,$70,$00,$70,$01,$00,$00,$70
	db $00,$7F,$70,$70,$09,$FF,$E0,$70,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00
	db $FC,$00,$FF,$FF,$18,$3C,$FF,$FF,$00,$70,$00,$70,$01,$00,$00,$70
	db $00,$7F,$58,$30,$0A,$FF,$E0,$58,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$0C
	db $FC,$00,$FF,$FF,$18,$3C,$FF,$FF,$00,$70,$00,$70,$01,$00,$00,$70
	db $00,$7F,$30,$58,$0A,$FF,$E0,$58,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$0C
	db $02,$00,$65,$04,$00,$00,$FF,$FF,$00,$01,$00,$01,$00,$00,$00,$01
	db $00,$7F,$70,$70,$0B,$00,$00,$70,$00,$00,$00,$00,$00,$00,$00,$00
