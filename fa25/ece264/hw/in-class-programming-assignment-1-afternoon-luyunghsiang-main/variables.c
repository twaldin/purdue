// Modify this file

#include "variables.h"

/*
Arguments:
    number: a integer given from the test case
    character: a character given from the test case
Return:
    return formatted string(char pointer)
*/
char* declare_variables(int number, char character)
{
    char* answer = malloc(sizeof(char) * 100);


    // -----------------------------------------------------------
    // ---- EDIT THIS AREA ONLY, DO NOT EDIT ANY LINES ABOVE -----



    // Variable Declarations
    //char MSFT;
    //char POTR;
    //char STEW;
    //char BHEE;
    //char PHYS = 'a';
		char MSEE;
		double POTR;
		char* STEW = malloc(sizeof(char) * 16);
		char PMU;
		int WALC;
		char ELLT[1] = "a";
		char CREC = 'a';
    // -------------- DO NOT EDIT ANY LINES BELOW ----------------
    // -----------------------------------------------------------


    // Variable Definition
    MSEE = 10 + number;
    POTR = -516;
    STEW = "Chase The River";
    WALC = 3.141592;
    PMU = character;


    sprintf(answer, "%d%f%s%d%c", MSEE, POTR, ELLT, WALC, CREC);
    return answer;
}
