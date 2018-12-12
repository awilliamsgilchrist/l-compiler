#ifndef VARIABLE_H
#define VARIABLE_H

#include <string>

class Variable 
{
	public:
	bool isLoaded;
	bool isSpilled;
	std::string regist;
	int globalOffset;
	int stackOffset;
	
	Variable(int offset)
	{
		isLoaded= false;
		isSpilled = false;
		regist = "";
		globalOffset = offset;
		stackOffset = 0;
	}
};

#endif