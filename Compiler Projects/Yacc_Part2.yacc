%{  // DEFINITIONS
  #include <stdio.h>
  #include <string.h>
  extern int yylex();
  extern int yylineno;
  void yyerror(char *);
%}


%token NUM ASSIGN VAR LT LE GT GE EQ NE PLUS MINUS ENDIF ENDWHILE DO ELSE THEN IF WHILE SEMI>

%%
prog:           stmts
stmts:          stmt
                | stmt stmts

stmt:           assignment                                      { printf("valid assignment\n>
                | IF condition THEN stmts ENDIF SEMI            { printf("valid if\n"); }
                | IF condition THEN stmts ELSE stmts ENDIF SEMI { printf("valid if then else>
                | WHILE condition DO stmts ENDWHILE SEMI        { printf("valid while\n"); }


assignment:     VAR ASSIGN expr SEMI
expr:           operand
                | expr mathexpression expr
operand:        NUM
                |VAR
mathexpression: PLUS
                | MINUS
condition:      operand operator operand
operator:       LT
                |LE
                |GT
                |GE
                |EQ
                |NE
%%



int main() {
  yyparse();
}
