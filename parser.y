%{
#include <iostream>
#include <fstream>
#include <vector>
#include <string>

#include "main.h"
#include "variable.h"

extern int yylex();
void yyerror(const char*);
%}

%union
{
	const char* cstr_val;
}

%token INCSY
%token DECSY
%token NULLSY
%token NEQZSY
%token GOTOSY
%token PRODSY
%token INPUTSY
%token LOCALSY
%token OUTPUTSY
%token LABELSY
%token DELIMSY
%token COLONSY

%type <cstr_val> INPUTSY
%type <cstr_val> LOCALSY
%type <cstr_val> OUTPUTSY
%type <cstr_val> LABELSY

%%
Program : StatementList {}
	;

StatementList : Statement StatementList {}
	| Statement {}
	;

Statement : Variable PRODSY Instruction DELIMSY {}
	| LABELSY COLONSY Variable PRODSY Instruction DELIMSY {}
	| GotoStatement DELIMSY {}
	| LABELSY COLONSY GotoStatement DELIMSY {}
	;

Variable : INPUTSY {}
	| LOCALSY {}
	| OUTPUTSY {}
	;

Instruction : INCSY {}
	| DECSY {}
	| NULLSY {}
	;

GotoStatement: NEQZSY Variable GOTOSY LABELSY DELIMSY {}
	;

%%

void yyerror(const char* msg)
{
	std::cerr << msg;
}