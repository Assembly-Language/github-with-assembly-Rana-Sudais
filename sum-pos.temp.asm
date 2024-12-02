; ANDULREHMAN SUDAIS
; 23-NTU-CS-1123

INCLUDE c:\Users\Bablu\.vscode\extensions\istareatscreens.masm-runner-0.4.5\native\irvine\Irvine32.inc
.data
myArray word 10, -15, 20, 25, -30,4  
messageSum byte "The Sum of Positive Numbers are : ", 0 
messageCount byte "Total Positive Numbers are : ", 0 
totalSum dword 0                 
positiveCount dword 0            
.code
main proc
  
    mov eax, 0                   
    mov esi, offset myArray      ; Address of the array
    mov ecx, lengthof myArray    ; Number of elements in the array
    call clrscr
    ; Loop through the array
positiveNumbers:
    mov ax, word ptr [esi]       ; Load current element into AX
    test ax, 8000h               ; Check if number is negative
    jnz skipPositive             ; Skip addition if negative

    movsx eax, word ptr [esi]    ; Sign-extend AX to EAX
    add totalSum, eax            ; Add to totalSum
    add positiveCount, 1         ; Increment positiveCount

skipPositive:
    add esi, type myArray        
    loop positiveNumbers        

    ; Display Sum
    mov edx, offset messageSum
    call writestring
    call crlf
    mov eax, totalSum
    call writeint
    call crlf

    ; Display Count
    mov edx, offset messageCount
    call writestring
    call crlf
    mov eax, positiveCount
    call writeint

    exit
main endp
end main
