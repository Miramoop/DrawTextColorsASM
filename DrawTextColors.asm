; 
; CSCI268 - Asgn 4 - Exercise 1 - Draw Text Colors
; Miranda Morris
; April 8, 2024
; This program displays the same string in four different colors, using a loop. It calls the SetTextColor procedure from the 
; book's link library. 

.586
.model flat, stdcall
option casemap : none; case-sensitive

ExitProcess proto,dwExitCode:dword

INCLUDE Irvine32.inc								; includes the Irvine32 link library
.data												; showing this is the start of the data area
str1 BYTE "This is a line displayed in color", 0	; creates a BYTE named str1 that contains the line "This is a line displayed in color"

.code												; showing this is the start of the code area
main proc											; starts the main procedure
mov eax, white + (green * 16)						; makes the first line have white text on the green background

mov ecx, 5											; moves the value pf 5 to the ecx register which is the number of loops that it iterates through						

L1: 
	call SetTextColor								; calls the SetTextColor procedure 
	mov edx, OFFSET str1 							; moves the OFFSET (address) of str1 to the register edx
	call WriteString								; calls the WriteString procedure 
	call Crlf										; calls the Crlf procedure which calls the end of line
	add eax, 2										; add 2 to foreground color which makes each line have a different color
	loop L1											; tells the program to iterate and loop through L1 until it reaches the loop counter of 5

	invoke ExitProcess,0							; calls a Windows service (also known as a function named ExitProcess that halts the program and returns)
main endp											; is the ending marker of the main procedure.

end main