section .bss
    fileread    resd    1
    filewrite   resd    1
    bufferwrite resb    1
    bufferkey   resb    1024
    buffertext  resb    1024
section .text
    global  cifra
cifra:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi
    mov eax , dword [ebp+8]
    mov [fileread], eax
    mov eax , dword [ebp+12]
    mov [filewrite], eax
    mov esi , dword[ebp+16]
    ;le arquivo
    mov eax, 3
    mov ebx, [fileread]
    mov ecx, buffertext
    mov edx, 255
    int 0x80
    ;compara eof ou buffer pequeno
    cmp eax, 0
    je end
    cmp eax, 1024
    jg error

    mov edx,0
    mov ecx,eax
    xor eax,eax
    ;extende chave
loopkey:
    mov bl, byte[esi+edx]
    cmp bl, ' '
    je espaco
    cmp bl, 0
    je sim
    jmp nao
sim:
    xor edx,edx
    jmp loopkey
nao:
    mov byte[bufferkey+eax], bl
espaco:
    inc edx
    inc eax
    loop loopkey
    mov esi, 0
    mov edi, 0
loopcipher:
    mov cl, byte[buffertext+edi]
    cmp cl, ' '
    je printkeye
    cmp cl, 'A'
    jl error
    cmp cl, 'z'
    jg error
    cmp eax, 0
    je end
    mov bl,byte[bufferkey+esi]
    cmp bl, 'a'
    je sima
    jmp naoa
sima:
    cmp cl, 'a'
    jl mina
    sub cl, 0
    jmp menor
mina:
    sub cl,0
    jmp maior
naoa:
    cmp bl, 'b'
    je simb
    jmp naob
simb:
    cmp cl, 'a'
    jl minb
    sub cl, 1
    jmp menor
minb:
    sub cl, 1
    jmp maior
naob:
    cmp bl, 'c'
    je simc
    jmp naoc
simc:
    cmp cl, 'a'
    jl minc
    sub cl, 2
    jmp menor
minc:
    sub cl, 2
    jmp maior
naoc:
    cmp bl, 'd'
    je simd
    jmp naod
simd:
    cmp cl,'a'
    jl mind
    sub cl, 3
    jmp menor
mind:
    sub cl, 3
    jmp maior
naod:
    cmp bl, 'e'
    je sime
    jmp naoe
sime:
    cmp cl,'a'
    jl mine
    sub cl, 4
    jmp menor
mine:
    sub cl, 4
    jmp maior
naoe:
    cmp bl, 'f'
    je simf
    jmp naof
simf:
    cmp cl,'a'
    jl minf
    sub cl, 5
    jmp menor
minf:
    sub cl, 5
    jmp maior
naof:
    cmp bl, 'g'
    je simg
    jmp naog
simg:
    cmp cl,'a'
    jl ming
    sub cl, 6
    jmp menor
ming:
    sub cl, 6
    jmp maior
naog:
    cmp bl, 'h'
    je simh
    jmp naoh
simh:
    cmp cl,'a'
    jl minh
    sub cl, 7
    jmp menor
minh:
    sub cl, 7
    jmp maior
naoh:
    cmp bl, 'i'
    je simi
    jmp naoi
simi:
    cmp cl,'a'
    jl mini
    sub cl, 8
    jmp menor
mini:
    sub cl, 8
    jmp maior
naoi:
    cmp bl, 'j'
    je simj
    jmp naoj
simj:
    cmp cl,'a'
    jl minj
    sub cl, 9
    jmp menor
minj:
    sub cl, 9
    jmp maior
naoj:
    cmp bl, 'k'
    je simk
    jmp naok
simk:
    cmp cl,'a'
    jl mink
    sub cl, 10
    jmp menor
mink:
    sub cl, 10
    jmp maior
naok:
    cmp bl, 'l'
    je siml
    jmp naol
siml:
    cmp cl,'a'
    jl minl
    sub cl, 11
    jmp menor
minl:
    sub cl, 11
    jmp maior
naol:
    cmp bl, 'm'
    je simm
    jmp naom
simm:
    cmp cl,'a'
    jl minm
    sub cl, 12
    jmp menor
minm:
    sub cl, 12
    jmp maior
naom:
    cmp bl, 'n'
    je simn
    jmp naon
simn:
    cmp cl,'a'
    jl minn
    sub cl, 13
    jmp menor
minn:
    sub cl, 13
    jmp maior
naon:
    cmp bl, 'o'
    je simo
    jmp naoo
simo:
    cmp cl,'a'
    jl mino
    sub cl, 14
    jmp menor
mino:
    sub cl, 14
    jmp maior
naoo:
    cmp bl, 'p'
    je simp
    jmp naop
simp:
    cmp cl,'a'
    jl minp
    sub cl, 15
    jmp menor
minp:
    sub cl, 15
    jmp maior
naop:
    cmp bl, 'q'
    je simq
    jmp naoq
simq:
    cmp cl,'a'
    jl minq
    sub cl, 16
    jmp menor
minq:
    sub cl, 16
    jmp maior
naoq:
    cmp bl, 'r'
    je simr
    jmp naor
simr:
    cmp cl,'a'
    jl minr
    sub cl, 17
    jmp menor
minr:
    sub cl, 17
    jmp maior
naor:
    cmp bl, 's'
    je sims
    jmp naos
sims:
    cmp cl,'a'
    jl mins
    sub cl, 18
    jmp menor
mins:
    sub cl, 18
    jmp maior
naos:
    cmp bl, 't'
    je simt
    jmp naot
simt:
    cmp cl,'a'
    jl mint
    sub cl, 19
    jmp menor
mint:
    sub cl, 19
    jmp maior
naot:
    cmp bl, 'u'
    je simu
    jmp naou
simu:
    cmp cl,'a'
    jl minu
    sub cl, 20
    jmp menor
minu:
    sub cl, 20
    jmp maior
naou:
    cmp bl, 'v'
    je simv
    jmp naov
simv:
    cmp cl,'a'
    jl minv
    sub cl, 21
    jmp menor
minv:
    sub cl, 21
    jmp maior
naov:
    cmp bl, 'w'
    je simw
    jmp naow
simw:
    cmp cl,'a'
    jl minw
    sub cl, 22
    jmp menor
minw:
    sub cl, 22
    jmp maior
naow:
    cmp bl, 'x'
    je simx
    jmp naox
simx:
    cmp cl,'a'
    jl minx
    sub cl, 23
    jmp menor
minx:
    sub cl, 23
    jmp maior
naox:
    cmp bl, 'y'
    je simy
    jmp naoy
simy:
    cmp cl,'a'
    jl miny
    sub cl, 24
    jmp menor
miny:
    sub cl, 24
    jmp maior
naoy:
    cmp bl, 'z'
    je simz
    jmp naoz
simz:
    cmp cl,'a'
    jl minz
    sub cl, 25
    jmp menor
minz:
    sub cl, 25
    jmp maior
naoz:
    cmp bl, 'A'
    je simaa
    jmp naoaa
simaa:    
    cmp cl,'a'
    jl minaa
    sub cl, 0
    jmp menor
minaa:
    sub cl, 0
    jmp maior
naoaa:
    cmp bl, 'B'
    je simbb
    jmp naobb
simbb:
    cmp cl,'a'
    jl minbb
    sub cl, 1
    jmp menor
minbb:
    sub cl, 1
    jmp maior
naobb:
    cmp bl, 'C'
    je simcc
    jmp naocc
simcc:
    cmp cl,'a'
    jl mincc
    sub cl, 2
    jmp menor
mincc:
    sub cl, 2
    jmp maior
naocc:
    cmp bl, 'D'
    je simdd
    jmp naodd
simdd:
    cmp cl,'a'
    jl mindd
    sub cl, 3
    jmp menor
mindd:
    sub cl, 3
    jmp maior
naodd:
    cmp bl, 'E'
    je simee
    jmp naoee
simee:
    cmp cl,'a'
    jl minee
    sub cl, 4
    jmp menor
minee:
    sub cl, 4
    jmp maior
naoee:
    cmp bl, 'F'
    je simff
    jmp naoff
simff:
    cmp cl,'a'
    jl minff
    sub cl, 5
    jmp menor
minff:
    sub cl, 5
    jmp maior
naoff:
    cmp bl, 'G'
    je simgg
    jmp naogg
simgg:
    cmp cl,'a'
    jl mingg
    sub cl, 6
    jmp menor
mingg:
    sub cl, 6
    jmp maior
naogg:
    cmp bl, 'H'
    je simhh
    jmp naohh
simhh:
    cmp cl,'a'
    jl minhh
    sub cl, 7
    jmp menor
minhh:
    sub cl, 7
    jmp maior
naohh:
    cmp bl, 'I'
    je simii
    jmp naoii
simii:
    cmp cl,'a'
    jl minii
    sub cl, 8
    jmp menor
minii:
    sub cl, 8
    jmp maior
naoii:
    cmp bl, 'J'
    je simjj
    jmp naojj
simjj:
    cmp cl,'a'
    jl minjj
    sub cl, 9
    jmp menor
minjj:
    sub cl, 9
    jmp maior
naojj:
    cmp bl, 'K'
    je simkk
    jmp naokk
simkk:
    cmp cl,'a'
    jl minkk
    sub cl, 10
    jmp menor
minkk:
    sub cl, 10
    jmp maior
naokk:
    cmp bl, 'L'
    je simll
    jmp naoll
simll:
    cmp cl,'a'
    jl minll
    sub cl, 11
    jmp menor
minll:
    sub cl, 11
    jmp maior
naoll:
    cmp bl, 'M'
    je simmm
    jmp naomm
simmm:
    cmp cl,'a'
    jl minmm
    sub cl, 12
    jmp menor
minmm:
    sub cl, 12
    jmp maior
naomm:
    cmp bl, 'N'
    je simnn
    jmp naonn
simnn:
    cmp cl,'a'
    jl minnn
    sub cl, 13
    jmp menor
minnn:
    sub cl, 13
    jmp maior
naonn:
    cmp bl, 'O'
    je simoo
    jmp naooo
simoo:
    cmp cl,'a'
    jl minoo
    sub cl, 14
    jmp menor
minoo:
    sub cl, 14
    jmp maior
naooo:
    cmp bl, 'P'
    je simpp
    jmp naopp
simpp:
    cmp cl,'a'
    jl minpp
    sub cl, 15
    jmp menor
minpp:
    sub cl, 15
    jmp maior
naopp:
    cmp bl, 'Q'
    je simqq
    jmp naoqq
simqq:
    cmp cl,'a'
    jl minqq
    sub cl, 16
    jmp menor
minqq:
    sub cl, 16
    jmp menor
naoqq:
    cmp bl, 'R'
    je simrr
    jmp naorr
simrr:
    cmp cl,'a'
    jl minrr
    sub cl, 17
    jmp menor
minrr:
    sub cl, 17
    jmp maior
naorr:
    cmp bl, 'S'
    je simss
    jmp naoss
simss:
    cmp cl,'a'
    jl minsss
    sub cl, 18
    jmp menor
minsss:
    sub cl,18
    jmp maior
naoss:
    cmp bl, 'T'
    je simtt
    jmp naott
simtt:
    cmp cl,'a'
    jl mintt
    sub cl, 19
    jmp menor
mintt:
    sub cl, 19
    jmp maior
naott:
    cmp bl, 'U'
    je simuu
    jmp naouu
simuu:
    cmp cl,'a'
    jl minuu
    sub cl, 20
    jmp menor
minuu:
    sub cl, 20
    jmp maior
naouu:
    cmp bl, 'V'
    je simvv
    jmp naovv
simvv:
    cmp cl,'a'
    jl minvv
    sub cl, 21
    jmp menor
minvv:
    sub cl, 21
    jmp maior
naovv:
    cmp bl, 'W'
    je simww
    jmp naoww
simww:
    cmp cl,'a'
    jl minww
    sub cl, 22
    jmp menor
minww:
    sub cl, 22
    jmp maior
naoww:
    cmp bl, 'X'
    je simxx
    jmp naoxx
simxx:
    cmp cl,'a'
    jl minxx
    sub cl, 23
    jmp menor
minxx:
    sub cl, 23
    jmp maior
naoxx:
    cmp bl, 'Y'
    je simyy
    jmp naoyy
simyy:
    cmp cl,'a'
    jl minyy
    sub cl, 24
    jmp menor
minyy:
    sub cl, 24
    jmp maior
naoyy:
    cmp bl, 'Z'
    je simzz
    jmp naozz
simzz:
    cmp cl,'a'
    jl minzz
    sub cl, 25
    jmp menor
minzz:
    sub cl, 25
    jmp maior
naozz:
maior:
    cmp cl, 'A'
    jl less
    cmp cl, 'Z'
    jg more
    jmp printkey
menor:
    cmp cl, 'a'
    jl lesss
    cmp cl, 'z'
    jg mores
    jmp printkey
lesss:
    add cl, 26
    cmp cl, 'a'
    jl lesss
    jmp printkey
mores:
    sub cl, 26
    cmp cl, 'z'
    jg mores
    jmp printkey
less:
    add cl, 26
    jmp printkey
more:
    sub cl, 26
    jmp printkey
printkeye:
    inc edi
    mov edx,1
    mov byte[bufferwrite], cl
    mov ecx, bufferwrite
    mov ebx, [filewrite]
    mov eax, 4
    int 0x80
    jmp loopcipher
printkey:
    mov edx,1
    mov byte[bufferwrite], cl
    mov ecx, bufferwrite
    mov ebx, [filewrite]
    mov eax, 4
    int 0x80
    inc esi
    inc edi
    jmp loopcipher
    jmp end
error:
    mov eax, -1
    jmp end2
end:
    mov eax, 1
end2:
    pop edi
    pop esi
    pop ebx
    mov esp, ebp 
    pop ebp
    ret