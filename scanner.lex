%{

/* Declarations section */
#include <stdio.h>

void handleGeneralError();


%}

%option yylineno
%option noyywrap


%%
void                              return("VOID");
int                               return("INT");
byte                              return("BYTE");
b                                 return("B");
bool                              return("BOOL");
and                               return("AND");
or                                return("OR");
not                               return("NOT");
true                              return("TRUE");
false                             return("FALSE");
return                            return("RETURN");
if                                return("IF");
else                              return("ELSE");
while                             return("WHILE");
break                             return("BREAK");
continue                          return("CONTINUE");
;                                 return("SC");
,                                 return("COMMA");
(                                 return("LPAREN")
)                                 return("RPAREN")
{                                 return("LBRACE")
}                                 return("RBRACE")
=                                 return("ASSIGN")
== | != | < | > | <= | >=         return("RELOP")
+ | - | * | /                     return("BINOP")
[a-zA-Z][a-zA-Z0-9]*              return("ID")
0 | [1-9][0-9]*                   return("NUM")
"([^\n\r\"\\]|\\[rnt"\\])+"       return("STRING")
\r|\n                             ;
//[^\r\n]*[\r|\n|\r\n]?           ;
.                                 handleGeneralError();


%%



void handleGeneralError(){
    printf("Error %s\n", yytext);
    exit(0);
}
