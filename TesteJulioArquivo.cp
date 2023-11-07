#line 1 "C:/Users/Public/Documents/Mikroelektronika/mikroC PRO for PIC/Examples/TesteJulio/TesteJulioArquivo.c"







sbit LCD_RS at RB3_bit;
sbit LCD_EN at RB2_bit;
sbit LCD_D7 at RB7_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D4 at RB4_bit;

sbit LCD_RS_Direction at TRISB3_bit;
sbit LCD_EN_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB7_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB4_bit;


void main(){


 CMCON = 7;

 TRISA = 16;
 TRISB = 0x00;
 PORTA = 0x00;
 PORTB = 0x00;

 TRISA4_bit = 1;
 TRISB0_bit = 0;

 Lcd_Init();

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,"Inicializando...");
 delay_ms(1000);
 Lcd_Cmd(_LCD_CLEAR);
 delay_ms(100);




 while(1) {
 unsigned short contador;
 Lcd_Out(1,1,"Motor Desligado");
 if ( RA4_bit  == 0) {
 for (contador = 0; contador < 10; contador++) {
 char cont = contador;
  RA3_bit  = 1;
  RA2_bit  = 1;
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,"Motor Ligado");
 Lcd_Out(2,1,"Tempo:");
  lcd_chr(2,13,contador+48); ;
 Lcd_Out(2,14,"s");
 delay_ms(1000);
 }
  RA3_bit  = 0;
  RA2_bit  = 0;
 Lcd_Cmd(_LCD_CLEAR);


 }
 }
}
