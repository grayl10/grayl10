%{
    #include <stdio.h>
    #include <string.h>
    extern int yylex();
    void yyerror(char *);

    char varname[20];
    char destination[20];
%}

%token VAR ASSIGN NUM PLUS MINUS SEMI ERROR



%%

stmts:  stmt stmts
        | stmt

stmt: var ASSIGN expr SEMI      { printf("MOV %s, R0\n", destination); }

expr:   NUM                     { printf("MOV R0, %s\n", varname); }
        | var1                  { printf("MOV R0, %s\n", varname); }
        | var1 PLUS plusexpr
        | var1 MINUS minusexpr

plusexpr:       varplus PLUS plusexpr
                | varplus MINUS minusexpr
                | varplus

minusexpr:      varminus MINUS minusexpr
                | varminus PLUS plusexpr
                | varminus

var1:   VAR                     { printf("MOV R0, %s\n", varname); }
        | NUM                   { printf("MOV R0, %s\n", varname); }


varplus:        VAR                     { printf("ADD R0, %s\n", varname); }
                | NUM                   { printf("ADD R0, %s\n", varname); }
varminus:       VAR                     { printf("SUB R0, %s\n", varname); }
                | NUM                   { printf("SUB R0, %s\n", varname); }


var:    VAR                     { strcpy(destination, varname); }
