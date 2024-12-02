; ANDULREHMAN SUDAIS
; 23-NTU-CS-1123

include irvine32.inc
.data
numberArray word 8, 3, 12, 7, 10, 23, 14         
messageSumEven byte "The Sum of Even values are : ", 0 
messageCountEven byte "Total Even Numbers are : ", 0 
evenSum dword 0                      
evenCount dword 0                       

.code
main proc
  
    mov eax, 0                   ; Initialize EAX to 0
    mov esi, offset numberArray  ; Address of the array
    mov ecx, lengthof numberArray; Number of elements in the array
    call clrscr
    ; Loop through the array
EvenNumbers:
    mov ax, word ptr [esi]       ; Load current element into AX
    test ax, 1                   ; Check if number is odd (LSB is 1)
    jnz skipEven                 ; Skip addition if odd

    movsx eax, word ptr [esi]    ; Sign-extend AX to EAX
    add evenSum, eax             ; Add to evenSum
    add evenCount, 1             ; Increment evenCount

skipEven:
    add esi, type numberArray    ; Move to the next element
    loop EvenNumbers             ; Repeat for all elements

    ; Display Sum
    mov edx, offset messageSumEven
    call writestring
    call crlf
    mov eax, evenSum
    call writeint
    call crlf

    ; Display Count
    mov edx, offset messageCountEven
    call writestring
    call crlf
    mov eax, evenCount
    call writeint

    exit
main endp
end main
