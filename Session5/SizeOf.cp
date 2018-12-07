#line 1 "C:/Embedded/Session5/SizeOf.c"
#line 1 "c:/embedded/session5/typedefs.h"
 typedef unsigned short int u8;
 typedef signed short int s8;

 typedef unsigned int u16;
 typedef signed int s16;


 typedef unsigned long int u32;
 typedef signed long int s32;

 typedef float f32;
 typedef long double f64;
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdlib.h"







 typedef struct divstruct {
 int quot;
 int rem;
 } div_t;

 typedef struct ldivstruct {
 long quot;
 long rem;
 } ldiv_t;

 typedef struct uldivstruct {
 unsigned long quot;
 unsigned long rem;
 } uldiv_t;

int abs(int a);
float atof(char * s);
int atoi(char * s);
long atol(char * s);
div_t div(int number, int denom);
ldiv_t ldiv(long number, long denom);
uldiv_t uldiv(unsigned long number, unsigned long denom);
long labs(long x);
long int max(long int a, long int b);
long int min(long int a, long int b);
void srand(unsigned x);
int rand();
int xtoi(char * s);
#line 1 "c:/embedded/session5/defs.h"
void VarSize(char SIZE);
void Toggle(int*);
void TogglePin(int,u8);
void SetBit(int,u8);
void ClearBit(int,u8);
u8 GetBit(int,u8);
void ClearPort(int *ptr);
void SetPort(int *ptr);
void SetValue(s16 *ptr,u8 Value);
void BuzzerOn(u32 frequency,f32 DutyCycle);
void ADC1_Init();
#line 6 "C:/Embedded/Session5/SizeOf.c"
void main() {

u16 adcValue;
u16 BuzzerFrequency;
u8 COUNT;
u8 HEIGHT=1;
u8 i;
char arr[7] = {sizeof(char),sizeof(int),sizeof(short int),sizeof(long int),sizeof(float),sizeof(double),sizeof(long double)} ;






GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);


GPIO_Digital_Output(&GPIOB_ODR,_GPIO_PINMASK_ALL);
GPIO_Digital_Output(&GPIOC_ODR,_GPIO_PINMASK_ALL);

ADC_Set_Input_Channel(_ADC_CHANNEL_3);

ADC1_Init();


GPIO_Digital_Output(&GPIOE_ODR,_GPIO_PINMASK_14);
GPIOE_ODR =0;

GPIOD_ODR =0;


 while(1)
 {


 GPIOD_ODR =0;
 adcValue = ADC1_Get_Sample(3);
 BuzzerFrequency=2000+(adcValue*2000/4096.0);


 COUNT = adcValue/1023;
 BuzzerOn(BuzzerFrequency,0.5);
 for(i=0;i<COUNT;i++)
 {

 GPIOD_ODR |= (1<<4*i)<<COUNT-1;

 }
#line 84 "C:/Embedded/Session5/SizeOf.c"
 }

 return;
}


void VarSize(char SIZE)
{
char i=0;
GPIOD_ODR=0;
for(i=0;i<SIZE;i++)
{
 GPIOD_ODR |= (1<<i);
}
}



void BuzzerOn(u32 frequency,f32 DutyCycle)
{
 u16 i;
 u8 j;
 f32 PeriodicTime;
 f32 T_ON;
 f32 T_OFF;
 f32 CYCLES;
 PeriodicTime = 1000.0/frequency;
 T_ON = PeriodicTime * DutyCycle;
 T_OFF = PeriodicTime - T_ON;





 GPIOE_ODR |= (1<<14);
 for(i=0;i<T_ON*1000;++i)
 {
 Delay_us(1);
 }

 GPIOE_ODR &= ~(1<<14);
 for(i=0;i<T_OFF*1000;i++)
 {
 Delay_us(1);
 }







 return;
}
