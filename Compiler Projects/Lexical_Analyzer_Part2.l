%{
  // DEFINITIONS
  #include <stdio.h>
  #include <string.h>
  #include "y.tab.h"
%}


%%
[0-9]+                          return NUM;             /*return TOKEN*/
"="                             return ASSIGN;
"-"                             return MINUS;
"+"                             return PLUS;
"=="                            return EQ;
"<"                             return GT;
">"                             return LT;
">="                            return GE;
"<="                            return LE;
"<>"                            return NE;
"while"                         return WHILE;
"do"                            return DO;
"endwhile"                      return ENDWHILE;
"if"                            return IF;
"then"                          return THEN;
"else"                          return ELSE;
"endif"                         return ENDIF;
";"                             return SEMI;
[a-zA-Z]([0-9]*|[a-zA-Z]*)*      return VAR;

" "                             ; // ignore
\n                               yylineno++; // ignore
\t                              ;
.                               return ERROR;
%%
