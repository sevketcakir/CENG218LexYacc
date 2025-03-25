%{
#include <stdio.h>
void yyerror(const char *s);
int yylex(void);
extern int yylineno;

%}

%token ATAMA
%token TOPLA CIKAR CARP BOL MOD US
%token KUCUK BUYUK KUCUK_ESIT BUYUK_ESIT ESIT FARKLI
%token VE VEYA DEGIL
%token SAYI METIN
%token ID
%token BLOK_BAS BLOK_BIT
%token EGER ISE AKSI_HALDE 
%token DONGU IKEN NEKI
%token FONK KNOF IKI_NOKTA DONDUR
%token TUS_YUKARI TUS_ASAGI TUS_SOLA TUS_SAGA
%token PARANTEZ_AC PARANTEZ_KAPA
%token SATIRSONU
%%
program:
    komut SATIRSONU
    | program komut SATIRSONU
;

komut:
    atama
    | eger
    | dongu
;

dongu: DONGU kosul IKEN komut_listesi NEKI;

komut_listesi:
    komut
    | komut_listesi komut;

eger: EGER kosul ISE komut AKSI_HALDE komut;

kosul: 
    ifade ESIT ifade
    | ifade FARKLI ifade
    | ifade KUCUK ifade
    | ifade KUCUK_ESIT ifade
    | ifade BUYUK ifade
    | ifade BUYUK_ESIT ifade
;

atama: ID ATAMA ifade;

ifade:
    terim
    | ifade TOPLA terim
    | ifade CIKAR terim
;

terim: 
    faktor
    | terim CARP faktor
    | terim BOL faktor
    | terim MOD faktor
;

faktor: 
    SAYI
    | ID
    | PARANTEZ_AC ifade PARANTEZ_KAPA
;
%%

int main() {
    yyparse(); 
}

void yyerror(const char *s)
{
  fprintf(stderr, "%d. satırda hata: %s\n", yylineno, s);
}