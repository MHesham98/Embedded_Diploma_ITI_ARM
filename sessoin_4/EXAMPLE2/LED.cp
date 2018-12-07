#line 1 "C:/Embedded/sessoin_4/EXAMPLE 2/LED.c"





void main()
{ int i=0;
 GPIO_Digital_Input(&GPIOA_IDR,_GPIO_PINMASK_0);
 GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);

 GPIOD_ODR=1;

 while(1)

 {

 if(Button(&GPIOA_IDR, 0 , 30 , 1 )==255)
 {

 GPIOD_ODR <<=1 ;
 ++i;
 while(Button(&GPIOA_IDR, 0 , 30 , 1 )==255)
 {

 }

 if(i==16)
 {
 GPIOD_ODR=1;
 i=0;
 }


 }




 }

}
