%include 'in_out.asm'
section .data
   msg2 db "Наименьшее число: ",0h
   A dd 21
   B dd 28
   C dd 34
section .bss
   min resb 10
section .text
global _start
_start:
   mov ecx, [A] ; 'ecx = A'
   mov [min], ecx ; 'min = A'  ; вложили в переменную min значение А

                ; Сравниваем 'A' и 'C' (как числа)
   cmp ecx, [C]
   jl check_B ; если 'A < C', то переход на метку 'check_B',

   mov ecx, [C] ; иначе 'ecx = C'
   mov [min], ecx ; 'min = C'

check_B:
                ; Сравниваем 'min(A,C)' и 'B' (как числа)
   mov ecx, [min]
   cmp ecx, [B]
   jl fin ; если 'min(A,C) < B', то переход на 'fin',

   mov ecx, [B] ; иначе 'ecx = B'
   mov [min], ecx

fin:
   ; Вывод результата
   mov eax, msg2
   call sprint ; Вывод сообщения 'Наименьшее число: '

   mov eax, [min]
   call iprintLF ; Вывод 'min(A,B,C)'

   call quit ; Выход

