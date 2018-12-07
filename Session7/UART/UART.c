


void main()
{ char read;
UART1_Init(115200);
Delay_ms(100);

UART1_Write_Text(" Hello!");
UART1_Write(13);
UART1_Write(10);


while(1)
{
if(UART_Data_Ready())
{
 read = UART1_Read();
 UART1_Write(read);
}

}

}