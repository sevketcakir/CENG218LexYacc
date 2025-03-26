%{
#include "cizim.tab.h"
%}
%option noyywrap
%%
"<-"    {return ATAMA;}
"+"  {return TOPLA;}
"-"  {return CIKAR;}
"*"  {return CARP;}
"/"  {return BOL;}
"%"  {return MOD;}
"^"  {return US;}
"<"  {return KUCUK;}
"<="  {return KUCUK_ESIT;}
">"  {return BUYUK;}
">="  {return BUYUK_ESIT;}
"="  {return ESIT;}
"<>"  {return FARKLI;}
":"  {return IKI_NOKTA;}
"eger"  {return EGER;}
"ise"  {return ISE;}
"aksi halde"  {return AKSI_HALDE;}
"dongu"  {return DONGU;}
"iken"  {return IKEN;}
"neki"  {return NEKI;}
"(" {return PARANTEZ_AC;}
")" {return PARANTEZ_KAPA;}
"dogru" {return DOGRU;}
"yanlis" {return YANLIS;}
"ve" {return VE;}
"veya" {return VEYA;}
"degil" {return DEGIL;}
"fonk" {return FONK;}
"knof" {return KNOF;}

[0-9]+(\.[0-9]+)?  { return SAYI;}
[a-zA-Z_][a-zA-Z0-9_]*    {return ID;}
[ \t] {}
"--".* {}
.   {return yytext[0];}
%%