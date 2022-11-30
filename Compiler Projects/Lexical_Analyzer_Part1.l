
%{
  // DEFINITIONS
  #include <stdio.h>
%}



%%
[0-9]+                          printf("NUM\n");
"="                             printf("ASSIGN\n");
"-"                             printf("MINUS\n");
"+"                             printf("PLUS\n");
"!="                            printf("NE\n");
"=="                            printf("EQ\n");
"<"                             printf("LT\n");
">"                             printf("GT\n");
">="                            printf("GE\n");
"<="                            printf("LE\n");
"while"                         printf("WHILE\n");
"do"                            printf("DO\n");
"endwhile"                      printf("ENDWHILE\n");
"if"                            printf("IF\n");
"then"                          printf("THEN\n");
"else"                          printf("ELSE\n");
"endif"                         printf("ENDIF\n");
"for"                           printf("FOR\n");
";"                             printf("SEMI\n");
[(){},*]                        printf("JUNK\n");
[a-zA-Z]+[[a-zA-Z]|[0-9]]*      printf("VAR\n");

\n      ;                       // ignore
.       ;                       // ignore
%%


int main()
{
  while(yylex());
}
