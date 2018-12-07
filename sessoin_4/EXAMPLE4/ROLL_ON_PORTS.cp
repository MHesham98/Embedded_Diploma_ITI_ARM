#line 1 "C:/Embedded/sessoin_4/EXAMPLE4/ROLL_ON_PORTS.c"






void main()
{ int i=0;
 char port = 'd';

 GPIO_Digital_Input(&GPIOA_IDR,_GPIO_PINMASK_ALL);
 GPIO_Digital_Input(&GPIOB_IDR,_GPIO_PINMASK_ALL);
 GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);
 GPIO_Digital_Output(&GPIOC_ODR,_GPIO_PINMASK_ALL);
 GPIO_Digital_Output(&GPIOB_ODR,_GPIO_PINMASK_ALL);

 GPIOD_ODR=1;
 GPIOC_ODR=0;
 GPIOB_ODR=0;
 while(1)

 {

 if(Button(&GPIOA_IDR, 0 , 30 , 1 )==255)
 {
 GPIOD_ODR <<=1 ;
 GPIOC_ODR <<=1 ;
 GPIOB_ODR <<=1 ;
 ++i;
 while(Button(&GPIOA_IDR, 0 , 30 , 1 )==255)
 {

 }

 if(i==16&&port == 'd')
 {
 GPIOC_ODR=1;
 GPIOD_ODR=0;
 port = 'c';
 i=0;

 }

 if(i==14&&port == 'c')
 {
 GPIOB_ODR=1;
 GPIOC_ODR=0;
 port = 'b';
 i=0;

 }

 if(i==13&&port == 'b')
 {
 GPIOD_ODR=1;
 GPIOB_ODR=0;
 port = 'd';
 i=0;

 }



 }


 else if(Button(&GPIOA_IDR, 5 , 30 , 1 )==255)
 {
 GPIOD_ODR >>=1 ;
 GPIOC_ODR >>=1 ;
 GPIOB_ODR >>=1 ;
 --i;
 while(Button(&GPIOA_IDR, 5 , 30 , 1 )==255)
 {

 }

 if(i==-1&& port == 'd')
 {
 GPIOD_ODR=0;
 GPIOB_ODR=0b0001000000000000;
 port = 'b';
 i=12;
 }

 if(i==-1&& port == 'c')
 {
 GPIOC_ODR=0;
 GPIOD_ODR=0b1000000000000000;
 port = 'd';
 i=15;
 }


 if(i==-1&& port == 'b')
 {
 GPIOB_ODR=0;
 GPIOC_ODR=0b0010000000000000;
 port = 'c';
 i=13;
 }




 }






 }
 return;
}
