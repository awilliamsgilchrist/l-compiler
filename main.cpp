#include "main.h"
extern int yyparse();

int auto_counter = 0;

std::string label_auto()
{
	auto_counter++;
	return "label" + std::to_string(auto_counter);
}

int main()
{
	yyparse();
}