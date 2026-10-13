; initial NMI hook, per-frame hook, IRQ hook (long pointers) and random seed
InitHooks:		; initial NMI hook, per-frame hook, IRQ hook (long pointers) and random seed
	dl NullHook&$FFFF,NullHook&$FFFF,IRQHook_Off&$FFFF		; bank $00 mirror
	dw $AFE5,$F527
