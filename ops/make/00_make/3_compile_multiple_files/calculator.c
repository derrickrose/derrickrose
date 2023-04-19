#include <stdio.h>
#include <my_math.h>

int main()
{
	int arg1,arg2,result;
	printf("Enter first operand: \n");
	scanf("%d",&arg1);

	printf("Enter second operand: \n");
	scanf("%d",&arg2);
	
	result = add(arg1,arg2);
	printf("arg1 + arg2 = %d\n",result);

	return 0;
}
	
	
