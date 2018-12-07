#include <stdio.h> 
#include <conio.h>
void print_odd_even();
void Calc(int a,int b,char operator);
void sorting(int arr[]);
void search(int x,int arr[],int size);
void main(void)
{

/* 	printf("Hello!\n");
	
	unsigned char x;
x=10;
char str[10];
printf("%d\n", x);	

char character ='c';
printf("the character is %c\n", character);

printf("its ascii %d\n", character);

/* scanf("%d",&x);

printf("the scanned decimal is %d \n", x); 

scanf("%s", &str);
printf("the character is %c\n", character);
printf("the string is %s, str");

 */

/* int x=3,y=4,n=1,z;
z=x+y;
printf("%d",z);
z=n++;
printf("%d",z);
z=++n+y;
printf("%d",z);
z=n+++y;
printf("%d",z);
z=n--;
printf("%d",z);
printf("%d",n); */
/* int x,y;
char operator;
printf("Enter the numbers\n");
scanf("%d%d",&x,&y);
printf("x is %d\n",x);
printf("y is %d\n",y);
printf("Enter Operator\n");
operator=getch();
printf("operator is %c\n",operator);
printf("x is%d\n",x);
Calc(x,y,operator); */
/* char x;
x=0;
int counter;
for(counter=0;counter<256;++counter)
{
	printf("%d\n",x);
	x++;
	
}
 */
int arr[10] = {2,4,5,76,8845,345,7563,1,56654,99} ;

sorting(arr);
search(76,arr,10);

}

void print_odd_even()
{
	int i;
for(i=0;i<=10;i+=2)
{
	printf("%d,", i);
	
}

printf("\n");

for(i=1; i<=10;i+=2)
{
	printf("%d,", i);
	
}
	
 return;	
 }

void Calc(int a,int b,char operator)
{
	switch(operator)
	{
		case '+':
		printf("%d\n", a+b);
		break;
		
		case '-':
		printf("%d\n",a-b);
		break;
		
		case '*':
		printf("%d\n",a*b);
		break;
		
		
		case '/':
		if(b==0)
		{
			printf("INPUT INVALID");	
			break;
			}
		printf("%d\n",(float)a/b);
		break;
		
		
	}
	
	return;
	
}

void search(int x,int arr[],int size)
{
int i;
for(i=0;i<size;++i)	
{
	if(arr[i]==x)
	{
		printf("index is %d",i);
		
	}
	
	
	
}
	
	
}


void sorting(int arr[])
{
	int i;
int j;
int temp;

for(i=0;i<10;++i)
{
	for(j=0;j<10;++j)
	{
		
		if(arr[i]<arr[j])
		{
			temp=arr[i];
			arr[i]=arr[j];
			arr[j]=temp;
			
		}
		
		
	}
}

for(i=0;i<10;i++)
{
	printf("%d\n",arr[i]);
}

	
}