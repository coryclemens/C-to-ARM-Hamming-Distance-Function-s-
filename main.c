

#include <stdio.h>
#include <stdlib.h>

extern int isNumber(int*);
extern int compare(int, int);
extern int countOnes(int);
extern int returnHammingDistance(char, char);




void main(void) {

int isNumberCheck1 = '?';
int isNumberCheck2 = '5';
int forCompare1=9, forCompare2=10;
int countOnesCheck = 15;
char charOne = 'z';
char charTwo = 'w';
int isNumRet, compareRet, countOnesRet, HamDistRet;

compareRet = compare(forCompare1, forCompare2);
printf("Return value for number compare: %d\n", compareRet);


isNumRet=isNumber(&isNumberCheck1);
printf("Return Value for isNumber: %d\n", isNumRet);

countOnesRet=countOnes(countOnesCheck);
printf("Return value for number of ones in %d: %d\n", countOnesCheck, countOnesRet);

HamDistRet=returnHammingDistance(charOne, charTwo);
printf("Hamming Distance Between char's is: %d\n", HamDistRet);





}

/*************************** End of file ****************************/
