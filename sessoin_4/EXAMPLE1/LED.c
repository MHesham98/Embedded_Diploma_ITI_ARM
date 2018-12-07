#define DELAY 30
#define PIN   0
#define ACTIVE_STATE 1


void main()
{
     GPIO_Digital_Input(&GPIOA_IDR,_GPIO_PINMASK_0);
     GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);

     GPIOD_ODR=0x00;

     while(1)

        {
        
        if(Button(&GPIOA_IDR,PIN,DELAY,ACTIVE_STATE)==255)
        {
          GPIOD_ODR ^= 0XFF;
          
          while(Button(&GPIOA_IDR,PIN,DELAY,ACTIVE_STATE)==255)
          {
          
          }
          
        }




        }

}