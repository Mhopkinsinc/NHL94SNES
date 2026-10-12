; Bank $80, last 4 KB: $FF fill, a table of OAM high table bit masks, then the SNES internal header and the interrupt
; vectors. The masks have the values DrawSprite reads from WRAM at $7EE67C; no reader of this copy is found yet.

org $80F000
	padbyte $FF
	pad $80FF00
DATA8_80FF00:		; OAM high table bits of the four entries in a byte: clear both, X high bit, size, both
	db $3F,$CF,$F3,$FC
	db $40,$10,$04,$01
	db $80,$20,$08,$02
	db $C0,$30,$0C,$03
	pad $80FFC0
	db "NHL '94              "		; title
	db $30		; map mode: LoROM, FastROM
	db $00		; cartridge type: ROM only
	db $0A		; ROM size: 1 MB
	db $00		; SRAM size: none
	db $01		; country: USA
	db $69		; licensee: Electronic Arts
	db $00		; version
	dw $64AD		; checksum complement
	dw $9B52		; checksum
	db $FF,$FF,$FF,$FF		; native mode vectors:
	dw $0000		; COP
	dw $0000		; BRK
	dw $0000		; ABORT
	dw NMI&$FFFF		; NMI
	dw Reset&$FFFF		; (unused)
	dw IRQ&$FFFF		; IRQ
	db $FF,$FF,$FF,$FF		; emulation mode vectors:
	dw $0000		; COP
	dw $0000		; (unused)
	dw $0000		; ABORT
	dw NMI&$FFFF		; NMI
	dw Reset&$FFFF		; RESET
	dw IRQ&$FFFF		; IRQ/BRK
