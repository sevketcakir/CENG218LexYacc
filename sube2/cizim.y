%{
#include <stdio.h>

void yyerror(const char *s);
int yylex(void);

%}
%token ATAMA
%token ID SAYI
%token TOPLA CIKAR CARP BOL MOD US
%token ESIT KUCUK KUCUK_ESIT BUYUK BUYUK_ESIT FARKLI
%token VE VEYA DEGIL
%token BLOK_AC BLOK_KAPA
%token EGER ISE AKSI_HALDE
%token DONGU IKEN NEKI
%token FONK KNOF IKI_NOKTA DONDUR
%token PARANTEZ_AC PARANTEZ_KAPA
%token DOGRU YANLIS

%%
program:
    komut
    | program komut
;

komut:
    atama
    | eger
    | fonksiyon_cagrisi
    | fonksiyon_tanim
;
atama: ID ATAMA ifade;

fonksiyon_cagrisi: ID ifade_listesi;

ifade_listesi: 
    | ifade
    | ifade_listesi ifade
;

fonksiyon_tanim: FONK ID parametre_listesi IKI_NOKTA komut_listesi KNOF;

komut_listesi:
    komut
    | komut_listesi komut;

parametre_listesi:
    ID
    | parametre_listesi ID
;
eger: EGER kosul ISE komut AKSI_HALDE komut;

kosul:
    DOGRU
    | YANLIS
    | kosul VE kosul
    | kosul VEYA kosul
    | ifade ESIT ifade
    | ifade FARKLI ifade
    | ifade KUCUK ifade
    | ifade KUCUK_ESIT ifade
    | ifade BUYUK ifade
    | ifade BUYUK_ESIT ifade
;

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
    fprintf(stderr, "Hata: %s", s);
}