; Data table.
DATA8_9D8BA9:		; indirect HDMA table: line count, then the address of the values in this bank; $00 ends it
	db $68 : dw DATA8_9D8BA1
	db $58 : dw DATA8_9D8BA1+4
	db $14 : dw DATA8_9D8BA1
	db $00
