#define DELAY 30
#define PINUP 4
#define PINDOWN 5
#define PINRIGHT 6
#define PINLEFT 2
#define ACTIVE_STATE 0


void main()
{    int i=0;

     int j=0;
     
     char port='d';
     
     int tempb=0;
     int tempc=0;
     int tempd=0;

     GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);
     GPIO_Digital_Output(&GPIOC_ODR,_GPIO_PINMASK_ALL);
     GPIO_Digital_Output(&GPIOB_ODR,_GPIO_PINMASK_ALL);
     
     
     GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_4);
     GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_2);
     GPIO_Digital_Input(&GPIOB_IDR,_GPIO_PINMASK_5);
     GPIO_Digital_Input(&GPIOA_IDR,_GPIO_PINMASK_6);

     GPIOD_ODR=1;
     GPIOC_ODR=0;
     GPIOB_ODR=0;
     while(1)

        {

           

        if(Button(&GPIOD_IDR,PINUP,DELAY,ACTIVE_STATE)==255)
        {  ++i;
         if(i==4)
          {

          
          
            tempd = GPIOD_ODR;
            tempc = GPIOC_ODR;
            tempb = GPIOB_ODR;

            GPIOD_ODR=0;
            GPIOC_ODR=0;
            GPIOB_ODR=0;

            Delay_ms(100);

            GPIOD_ODR = tempd;
            GPIOC_ODR = tempc;
            GPIOB_ODR = tempb;




            i=3;

          }
        
          else
          
          {
           GPIOD_ODR <<=1 ;
           GPIOC_ODR <<=1 ;
           GPIOB_ODR <<=1 ;
          }
          
            while(Button(&GPIOD_IDR,PINUP,DELAY,ACTIVE_STATE)==255)
          {

          }


           }


        else if(Button(&GPIOB_IDR,PINDOWN,DELAY,ACTIVE_STATE)==255)
        {
         --i;
         
          if(i==-1)
          {

            tempd = GPIOD_ODR;
            tempc = GPIOC_ODR;
            tempb = GPIOB_ODR;

            GPIOD_ODR=0;
            GPIOC_ODR=0;
            GPIOB_ODR=0;

            Delay_ms(100);

            GPIOD_ODR = tempd;
            GPIOC_ODR = tempc;
            GPIOB_ODR = tempb;


           i=0;
          }
          else
          {
             GPIOD_ODR >>=1 ;
             GPIOC_ODR >>=1 ;
             GPIOB_ODR >>=1 ;
          }
            while(Button(&GPIOB_IDR,PINDOWN,DELAY,ACTIVE_STATE)==255)
          {

          }




              }

        else if(Button(&GPIOA_IDR,PINRIGHT,DELAY,ACTIVE_STATE)==255)
        {

           --j;
           
           if(j==-1 && port == 'b')
          {
            GPIOC_ODR = (GPIOB_ODR<<12);
            GPIOB_ODR=0;
           j=3 ;
           port = 'c';
          }

          else if(j==-1 && port == 'c')
          {
           
            GPIOD_ODR = (GPIOC_ODR<<12);
            GPIOC_ODR=0;
           j=3 ;
           port = 'd';
           
          }
           
           else if(j==-1 && port =='d')
          {
            tempd = GPIOD_ODR;
            tempc = GPIOC_ODR;
            tempb = GPIOB_ODR;

            GPIOD_ODR=0;
            GPIOC_ODR=0;
            GPIOB_ODR=0;

            Delay_ms(100);

            GPIOD_ODR = tempd;
            GPIOC_ODR = tempc;
            GPIOB_ODR = tempb;


           j=0;

          }
          else
          {

           GPIOD_ODR >>=4 ;
           GPIOC_ODR >>=4 ;
           GPIOB_ODR >>=4 ;

          }
            while(Button(&GPIOA_IDR,PINRIGHT,DELAY,ACTIVE_STATE)==255)
          {

          }


           }

        else if(Button(&GPIOD_IDR,PINLEFT,DELAY,ACTIVE_STATE)==255)
        {  ++j;
         if(j==4 && port == 'd')
          {
            GPIOC_ODR = (GPIOD_ODR>>12);
            GPIOD_ODR=0;
           j=0 ;
           port = 'c';
          }
          
          else if(j==4 && port == 'c')
          {
            GPIOB_ODR = (GPIOC_ODR>>12);
            GPIOC_ODR=0;
           j=0 ;
           port = 'b';
          }
        
        
          else if(j==4&& port == 'b')
          {
            tempd = GPIOD_ODR;
            tempc = GPIOC_ODR;
            tempb = GPIOB_ODR;

            GPIOD_ODR=0;
            GPIOC_ODR=0;
            GPIOB_ODR=0;

            Delay_ms(100);

            GPIOD_ODR = tempd;
            GPIOC_ODR = tempc;
            GPIOB_ODR = tempb;

           j=3 ;
          }
          else
          {
          
           GPIOD_ODR <<=4 ;
           GPIOC_ODR <<=4 ;
           GPIOB_ODR <<=4 ;
          
          
          }
        
            while(Button(&GPIOD_IDR,PINLEFT,DELAY,ACTIVE_STATE)==255)
          {

          }


         }


        }
  return;
}