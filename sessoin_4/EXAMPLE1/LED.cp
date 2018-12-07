#line 1 "C:/Embedded/sessoin_4/LED.c"





void main()
{
 GPIO_Digital_Input(&GPIOA_IDR,_GPIO_PINMASK_0);
 GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);

 GPIOD_ODR=0x00;

 while(1)

 {

 if(Button(&GPIOA_IDR, 0 , 30 , 1 )==255)
 {
 GPIOD_ODR ^= 0XFF;

 while(Button(&GPIOA_IDR, 0 , 30 , 1 )==255)
 {

 }
 }




 }

}
