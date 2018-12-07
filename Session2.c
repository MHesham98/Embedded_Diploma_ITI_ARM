#include <stdio.h>
#include <conio.h>

typedef unsigned char u8;
typedef signed char s8;

typedef unsigned short int u16;
typedef signed short int s16;

typedef unsigned long int u32;
typedef signed long int s32;

typedef float f32;

typedef double f64;

typedef long double f128; 

typedef struct ImjNum ImjNum;

typedef struct Human Human;

typedef struct Employee Emp;

typedef struct Student Student;

typedef struct pointerexample PtrStr;

struct ImjNum
{
	s8 Real;
	s8 Imj;	
};

struct Human
{
	u8 Name[20];
	u8 Age;
	u32 ID;
	u8 Gender;
	
};

struct Employee
{
	Human data;
	u16 Salary;
	u8 WrkHr;
	u16 Bonus;

};

struct Student
{
	Human data;
	u8 Subj1Grade;
	u8 Subj2Grade;
	u8 Grade;

};

struct pointerexample
{
	u8 x; 
	u16 y;
};
void sizeofexample();
ImjNum AddComplex(ImjNum a,ImjNum b);
ImjNum SubComplex(ImjNum a,ImjNum b);
void ptrexample();

void main(void)
{
	
	
	

}

void ptrarrexample ()
{
	

	u8 arr[10] = {1,2,3,4,5,6,7,8,9,10};
	u8 *ptrArr=arr;
	u8 i;
	printf("Printing the Array Content\n");
	for(i=0;i<10;++i,printf("\n"))
	{
		printf("%d\t",arr[i]);
		printf("%d\t",ptrArr[i]);
		printf("%d\t",*(arr+i));
		printf("%d\t",*(ptrArr+i));
		
	}
	
	
	
}
void ptrexample()
{
	PtrStr test;
	
	test.x=10;
	test.y=20;
	
	PtrStr *ptr=&test;
	
	printf("x value in structure is %d\n",test.x);
	printf("y value in structure %d\n",test.y);
	printf("x value in structure with pointer is %d\n",ptr->x);
	printf("y address in structure with pointer is %d\n",ptr->y);
	printf("changing value with pointers\n");
	ptr->x = 30;
	ptr->y = 40;
	printf("x value is %d\n",ptr->x);
	printf("y value is %d\n",ptr->y);
	
	
	
	
	
}

void StudentEmp()
{
	Emp employees[3];
	Student students[3];
	
	int i;
	for(i=0;i<3;++i)
	{
		printf("Enter Student %d Name\n",i+1);
		scanf("%s",students[i].data.Name);
		printf("Enter Student %d Age\n",i+1);
		scanf("%d",&students[i].data.Age);
		printf("Enter Student %d ID\n",i+1);
		scanf("%d",&students[i].data.ID);
		printf("Enter Student %d Gender (M/F)\n",i+1);
		students[i].data.Gender=getch();
		
		printf("Enter Student %d Subject 1 Grade\n",i+1);
		scanf("%d",&students[i].Subj1Grade);
		printf("Enter Student %d Subject 2 Grade\n",i+1);
		scanf("%d",&students[i].Subj2Grade);
		students[i].Grade=(students[i].Subj1Grade)+(students[i].Subj2Grade);
		
		
	}
	
	for(i=0;i<3;++i)
	{
		printf("Enter Employee %d Name\n",i+1);
		scanf("%s",&employees[i].data.Name);
		printf("Enter Employee %d Age\n",i+1);
		scanf("%d",&employees[i].data.Age);
		printf("Enter Employee %d ID\n",i+1);
		scanf("%d",&employees[i].data.ID);
		printf("Enter Employee %d Gender (M/F)\n",i+1);
		employees[i].data.Gender = getch();
		
		printf("Enter Employee %d Salary\n",i+1);
		scanf("%d",&employees[i].Salary);
		printf("Enter Employee %d Working Hours\n",i+1);
		scanf("%d",&employees[i].WrkHr);
		printf("Enter Employee %d Bonus\n",i+1);
		scanf("%d",&employees[i].Bonus);
		
		
	}

	printf("\n\n\nScanned Data\n\n");
	for(i=0;i<3;i++)
	{
		printf("\n");
		printf("Student%d Name:%s\n",i+1,students[i].data.Name);
		printf("Student%d Age:%d\n",i+1,students[i].data.Age);
		printf("Student%d ID:%d\n",i+1,students[i].data.ID);
		printf("Student%d Gender:%c\n",i+1,students[i].data.Gender);
		
		printf("Student%d First Subject Grade:%d\n",i+1,students[i].Subj1Grade);
		printf("Student%d Second Subject Grade:%d\n",i+1,students[i].Subj2Grade);
		printf("Student%d Total Grade:%d\n",i+1,students[i].Grade);

	}
	printf("\n\n");
	for(i=0;i<3;i++)
	{
		printf("\n");
		printf("Employee%d Name:%s\n",i+1,employees[i].data.Name);
		printf("Employee%d Age:%d\n",i+1,employees[i].data.Age);
		printf("Employee%d ID:%d\n",i+1,employees[i].data.ID);
		printf("Employee%d Gender:%c\n",i+1,employees[i].data.Gender);
		
		printf("Employee%d Salary:%d\n",i+1,employees[i].Salary);
		printf("Employee%d Bonus:%d\n",i+1,employees[i].Bonus);
		printf("Employee%d Working Hours:%d\n",i+1,employees[i].WrkHr);

	}
	
	
	
	return ;
}

void sizeofexample()
{

	printf("u8 = %d Bits\n", 8*sizeof(u8));
	printf("u16 = %d Bits\n", 8*sizeof(u16));
	printf("u32 = %d Bits\n", 8*sizeof(u32));
	printf("s8 = %d Bits\n", 8*sizeof(s8));
	printf("s16 = %d Bits\n", 8*sizeof(s16));
	printf("s32 = %d Bits\n", 8*sizeof(s32));
	printf("f32 = %d Bits\n", 8*sizeof(f32));
	printf("f64 = %d Bits\n", 8*sizeof(f64));
	printf("f128 = %d Bits\n", 8*sizeof(f128));

	return;
}

ImjNum AddComplex(ImjNum a,ImjNum b)
{
	ImjNum c;
	
	c.Real = a.Real + b.Real;
	c.Imj  = a.Imj  + b.Imj;
	
	
	return c;
}

ImjNum SubComplex(ImjNum a,ImjNum b)
{
	ImjNum c;
	
	c.Real = a.Real - b.Real;
	c.Imj  = a.Imj  - b.Imj;
	
	
	return c;
}