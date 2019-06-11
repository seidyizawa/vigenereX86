#include <stdio.h>
#include <stdlib.h>

int cifra(int fd_entrada, int fd_saida, const char*
chave);

int main(){
    FILE *texto;
    FILE *cripto;

    texto = fopen("teste.txt","r");
    cripto = fopen("teste2.txt","w");
    int fd_entrada = fileno(texto);
    int fd_saida = fileno(cripto);
    cifra(fd_entrada,fd_saida,"banana");
    
}