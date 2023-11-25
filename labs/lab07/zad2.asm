%include 'in_out.asm'

SECTION .data
    msgX: db 'Введите x: ', 0h  ; 
    msgA: db 'Введите a: ', 0h  ; 
    result: db 'Результат: ', 0h

SECTION .bss
    x: resb 80   ; для ввода x
    a: resb 80   ; для ввода a
    res: resb 80 ; для результата вычислений

SECTION .text
    GLOBAL _start
    _start:
    
    mov eax, msgX
    call sprint 
    
        ; Ввод х 
    mov ecx, x
    mov edx, 80
    call sread
    mov eax, x
    call atoi
    mov [x], eax

    mov eax, msgA
    call sprint
    
        ; Ввод а
    mov ecx, a
    mov edx, 80
    call sread
    mov eax, a
    call atoi
    mov [a], eax

    ; Перемещение x в регистр ecx для дальнейших вычислений
    mov ecx, [x]

    ; сравнение x с 0
    cmp ecx, 0
    je _xisnull  ; "jump if equals" (x = 0) 
    jne _xisnotnull  ; "jump if not equals" (x != 0)

    _xisnull:
    ; вычисление f(x)= 4a, если x = 0
    mov eax, [a]   ; Загрузка значения a в регистр eax
    mov ebx, 4     ; Загрузка константы 4 в регистр ebx
    imul eax, ebx
    mov [res], eax
    jmp _fin  ; Переход к fin для завершения программы

    _xisnotnull:
    ; вычисление f(x)= 4a + x, если x != 0
    mov eax, [a]   ; Загрузка значения a в регистр eax
    mov ebx, 4     ; Загрузка константы 4 в регистр ebx
    imul eax, ebx  ; Умножение a на 4
    add eax, ecx   ; Прибавление x к результату
    mov [res], eax ; Сохранение результата в res
    jmp _fin

    _fin:
    mov eax, result
    call sprint
    mov eax, [res]
    call iprintLF
    call quit

