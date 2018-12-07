void main() {
             GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);
             GPIOD_ODR 0x01;
             

             while(1)
             {
                GPIOD_ODR |= 1;
                delay(500);
                GPIOD_ODR &= ~1;
                delay(500);

             }
}