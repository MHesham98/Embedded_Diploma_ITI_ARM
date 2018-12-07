#define DELAY 30
#define PINLEFT 0
#define PINRIGHT 5
#define ACTIVE_STATE 1


void main()
{    int i=0;
     GPIO_Digital_Input(&GPIOA_IDR,_GPIO_PINMASK_ALL);
          GPIO_Digital_Input(&GPIOB_IDR,_GPIO_PINMASK_ALL);
     GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);

     GPIOD_ODR=1;

     while(1)

        {

        if(Button(&GPIOA_IDR,PINLEFT,DELAY,ACTIVE_STATE)==255)
        {

           GPIOD_ODR <<=1 ;
           ++i;
            while(Button(&GPIOA_IDR,PINLEFT,DELAY,ACTIVE_STATE)==255)
          {

          }

          if(i==16)
           {
            GPIOD_ODR=1;
           i=0;
           }
           }
           
           
        else if(Button(&GPIOA_IDR,PINRIGHT,DELAY,ACTIVE_STATE)==255)
        {
             GPIOD_ODR >>=1 ;
           --i;
            while(Button(&GPIOA_IDR,PINRIGHT,DELAY,ACTIVE_STATE)==255)
          {

          }

          if(i==-1)
           {
            GPIOD_ODR=0b1000000000000000;
           i=15;
           }
        
        
        
        
        }






        }
  return;
}