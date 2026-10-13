; Data table.
DATA8_9DE056:		; indirect HDMA table: line count, then the address of the values in this bank; $00 ends it
	db $10 : dw DATA8_9DE04E
	db $20 : dw DATA8_9DE04E+4
	db $14 : dw DATA8_9DE04E
	db $00
