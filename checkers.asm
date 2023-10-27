
section .data

section .text
	global checkers
    extern printf

checkers:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]	; x
    mov ebx, [ebp + 12]	; y
    mov ecx, [ebp + 16] ; table

    ;; DO NOT MODIFY
    ;; FREESTYLE STARTS HERE

    mov edx, eax; x
    dec edx; x - 1
    cmp edx, 0; x - 1 < 0
    jl check_down_right_corner;
    mov edx, ebx; y
    dec edx; y - 1
    cmp edx, 0; y - 1 < 0
    jl check_down_right_corner
    mov edx, eax; x
    dec edx; x - 1
    push ecx; table
    push eax; x
    mov ecx, 8;
    mov eax, edx; x - 1
    imul eax, ecx; (x - 1) * 8
    mov esi, eax; (x - 1) * 8
    mov edx, ebx; y
    dec edx; y - 1
    add esi, edx; (x - 1) * 8 + (y - 1)
    pop eax; x
    pop ecx; table
    inc BYTE [ecx + esi]; table[(x - 1) * 8 + (y - 1)]++
    
check_down_right_corner:
    mov edx, eax; x
    dec edx; x - 1
    cmp edx, 0; x - 1 < 0
    jl check_up_right_corner
    mov edx, ebx; y
    inc edx; y + 1
    cmp edx, 7; y + 1 > 7
    jg check_up_right_corner
    mov edx, eax; x
    dec edx; x - 1
    push ecx; table
    push eax; x
    mov ecx, 8;
    mov eax, edx; x - 1
    imul eax, ecx; (x - 1) * 8
    mov esi, eax; (x - 1) * 8
    mov edx, ebx; y
    inc edx; y + 1
    add esi, edx; (x - 1) * 8 + (y + 1)
    pop eax; x
    pop ecx; table
    inc BYTE [ecx + esi]; table[(x - 1) * 8 + (y + 1)]++

check_up_right_corner:
    mov edx, eax; x
    inc edx; x + 1
    cmp edx, 7; x + 1 > 7
    jg check_up_left_corner
    mov edx, ebx; y
    inc edx; y + 1
    cmp edx, 7; y + 1 > 7
    jg check_up_left_corner
    mov edx, eax; x
    inc edx; x + 1
    push ecx; table
    push eax; x
    mov ecx, 8
    mov eax, edx; x + 1
    imul eax, ecx; (x + 1) * 8
    mov esi, eax; (x + 1) * 8
    mov edx, ebx; y
    inc edx; y + 1
    add esi, edx; (x + 1) * 8 + (y + 1)
    pop eax; x
    pop ecx; table
    inc BYTE [ecx + esi]; table[(x + 1) * 8 + (y + 1)]++
    
check_up_left_corner:
    mov edx, eax; x
    inc edx; x + 1
    cmp edx, 7; x + 1 > 7
    jg Nope
    mov edx, ebx; y
    dec edx; y - 1
    cmp edx, 0; y - 1 < 0
    jl Nope
    mov edx, eax; x
    inc edx; x + 1
    push ecx; table
    push eax; x
    mov ecx, 8
    mov eax, edx; x + 1
    imul eax, ecx; (x + 1) * 8
    mov esi, eax; (x + 1) * 8
    mov edx, ebx; y
    dec edx; y - 1
    add esi, edx; (x + 1) * 8 + (y - 1)
    pop eax; x
    pop ecx; table
    inc BYTE [ecx + esi]; table[(x + 1) * 8 + (y - 1)]++
Nope:
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY

;Pentru implementarea acestui cod, m-am ajutat de codul echivalent scris de
;mine in C, pe care l-am transformat in assembly:

; #include <stdio.h>
; #include <stdlib.h>

; int main()
; {
;     int **matrix;
;     int n = 8, m = 8;
;     matrix = (int **)malloc(n * sizeof(int *));
;     for (int i = 0; i < n; i++)
;         matrix[i] = (int *)malloc(m * sizeof(int));
;     for (int i = 0; i < n; i++)
;         for (int j = 0; j < m; j++) matrix[i][j] = 0;
;     int x, y;
;     scanf("%d %d", &x, &y);


;     if(x - 1 >= 0 && y - 1 >= 0) {
;         matrix[x - 1][y - 1] = 1;
;     }
;     if(x - 1 >= 0 && y + 1 <= 7) {
;         matrix[x - 1][y + 1] = 1;
;     }
;     if(x + 1 <= 7 && y - 1 >= 0) {
;         matrix[x + 1][y - 1] = 1;
;     }
;     if(x + 1 <= 7 && y + 1 <= 7) {
;         matrix[x + 1][y + 1] = 1;
;     }
;     for(int i =0; i < 8; i++) {
;         for(int j = 0; j < 8; j++) {
;             printf("%d ", matrix[i][j]);
;         }
;         printf("\n");
;     }

; }