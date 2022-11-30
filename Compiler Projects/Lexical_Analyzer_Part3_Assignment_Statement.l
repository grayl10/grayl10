%{
  // DEFINITIONS
  #include <stdio.h>
  #include <string.h>
  #include "y.tab.h"

  extern char varname[];
%}


%%
"="                             { return ASSIGN; }


"-"                             { return MINUS; }


"+"                             { return PLUS; }


";"                             { return SEMI; }


[0-9]+                          { strcpy(varname, yytext);
                                        return NUM; }
[a-zA-Z]([0-9]|[a-zA-Z])*     { strcpy(varname, yytext);
                                        return VAR;     }

" "                             ; // ignore
\t                              ;
\n                              ;
.                               { return ERROR; }
%%
