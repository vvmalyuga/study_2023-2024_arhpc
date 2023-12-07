%include 'in_out.asm'

SECTION .data
    msg: DB 'Введите x: ', 0
    result: DB 'f(g(x)) = 2(3x-1) + 7 =  ', 0

SECTION .bss
    x: RESB 80
    res: RESB 80

SECTION .text
    GLOBAL _start
;------------------------------------------
; Основная программа
;------------------------------------------
    _start:
        mov eax, msg
        call sprint
        mov ecx, x
        mov edx, 80
        call sread
        mov eax, x
        call atoi
        call _calcul             ; Вызов подпрограммы _calcul
        mov eax, result
        call sprint
        mov eax, [res]
        call iprintLF
        call quit
;------------------------------------------
; подпрограмма вычисления f(x) = 2x + 7
;------------------------------------------
    _calcul:
        mov ebx, eax             ; сохраняем x
        call _subcalcul          ; вызов подпрограммы _subcalcul для вычисления g(x)
        mov ebx, 2
        imul eax, ebx            ; умножаем g(x) на 2
        add eax, 7               ; добавляем 7
        mov [res], eax
        ret
;------------------------------------------
; подпрограмма вычисления g(x) = 3x - 1
;------------------------------------------
    _subcalcul:
        mov ebx, 3
        imul eax, ebx            ; умножаем x на 3
        sub eax, 1               ; вычитаем 1
        ret
        
        
