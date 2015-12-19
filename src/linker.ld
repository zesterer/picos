ENTRY(_start)

SECTIONS
{
	/* Starts at LOADER_ADDR */
	. = 0x8000;
	__start = .;
	__text_start = .;
	.text :
	{
		KEEP(*(.text.boot))
		*(.text)
	}
	. = ALIGN(4096); /* Align to page size */
	__text_end = .;
	
	_rodata_start = .;
	.rodata :
	{
		*(.rodata)
	}
	. = ALIGN(4096); /* Align to page size */
	__rodata_end = .;
	
	_data_start = .;
	.data :
	{
		*(.data)
	}
	. = ALIGN(4096); /* Align to page size */
	__data_end = .;
	
	__bss_start = .;
	.bss :
	{
		bss = .;
		*(.bss)
	}
	. = ALIGN(4096); /* Align to page size */
	__bss_end = .;
	__end = .;
}
