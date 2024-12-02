; ANDULREHMAN SUDAIS
; 23-NTU-CS-1123

INCLUDE c:\Users\Bablu\.vscode\extensions\istareatscreens.masm-runner-0.4.5\native\irvine\Irvine32.inc
.data
numberArray word 1, 5, 8, 11, 14, 23,44     
messageSumOdd byte "The Sum of Odd values are : ", 0 
messageCountOdd byte "The Total Odd Numbers are : ", 0 
oddSum dword 0                          
oddCount dword 0             

.code
main proc

    mov eax, 0                   ; Initialize EAX to 0
    mov esi, offset numberArray  ; Address of the array
    mov ecx, lengthof numberArray; Number of elements in the array
    call clrscr
    ; Loop through the array
OddNumbers:
    mov ax, word ptr [esi]       ; Load current element into AX
    test ax, 1                   ; Check if number is even (LSB is 0)
    jz skipOdd                   ; Skip addition if even

    movsx eax, word ptr [esi]    ; Sign-extend AX to EAX
    add oddSum, eax              ; Add to oddSum
    add oddCount, 1              ; Increment oddCount

skipOdd:
    add esi, type numberArray    ; Move to the next element
    loop OddNumbers              ; Repeat for all elements

    ; Display Sum
    mov edx, offset messageSumOdd
    call writestring
    call crlf
    mov eax, oddSum
    call writeint
    call crlf

    ; Display Count
    mov edx, offset messageCountOdd
    call writestring
    call crlf
    mov eax, oddCount
    call writeint

    exit
main endp
end main
