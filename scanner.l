%{
#include <cstdlib>
#include <cstring>
#include <vector>

%}

%option nounput

%%

inc|INC {return INCSY;}
dec|DEC {return DECSY;}
null|NULL {return NULLSY;}
ifneqz|IFNEQZ {return NEQZSY;}
goto|GOTO {return GOTOSY;}
"<-" {return PRODSY;}

[X][1-9][0-9]* {yylval.ctsr_val = stdup(yytext); return INPUTSY;}
[Z][1-9][0-9]* {yylval.cstr_val = stdup(yytext); return LOCALSY;}
Y {yylval.cstr_val = stdup(yytext); return OUTPUTSY;}

[A-D][1-9][0-9]* {yylval.cstr_val = stdup(yytext); return LABELSY;}
E {yylval.cstr_val = stdup(yytext); return LABELSY;}

'\n' {return DELIMSY;}
':' {return COLONSY;}
\$.*$ {}
[ \t]+ {}
. {}

%%
