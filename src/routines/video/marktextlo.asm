; Lower the low end of the changed text map area to A
marktextlo:
	cmp.w textdirtylo
	bcs .rtl
.1:
	sta.w textdirtylo
.rtl:
	rtl
