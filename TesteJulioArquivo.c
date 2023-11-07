#define s1 RA4_bit
#define motorDC RA3_bit
#define ledDisplay RA2_bit

#define disp_time      lcd_chr(2,13,contador+48);

// LCD module connections
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
// End LCD module connections
                   
void main(){

  OPTION_REG = 0X8E;                  // habilita os prescaler associados ao WDT  (1:6)
  
//  ANSEL = 0x00;                     // desliga as entradas Anal�gicas Digitais
  CMCON = 7;                        // desliga os comparadores

  TRISA = 16;                       // 0b00010000
  TRISB = 0x00;
  PORTA = 0x00;
  PORTB = 0x00;
  
  TRISA4_bit = 1;
  TRISB0_bit = 0;

  Lcd_Init();                        // Initialize LCD

  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
  Lcd_Out(1,1,"Inicializando...");                 // Write text in first row
  delay_ms(1000);
  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  delay_ms(100);


  //delay_ms(2000);
  asm clrwdt;                         // comando em assembly que limpa o WDT
  while(1) {                         // Endless loop

           asm clrwdt;                         // comando em assembly que limpa o WDT
           unsigned short contador;
           Lcd_Out(1,1,"Motor Desligado");
           if (s1 == 0) {
              for (contador = 0; contador < 10; contador++) {
                  char cont = contador;
                  motorDC = 1;
                  ledDisplay = 1;
                  Lcd_Cmd(_LCD_CLEAR);               // Clear display
                  Lcd_Out(1,1,"Motor Ligado");                 // Write text in first row
                  Lcd_Out(2,1,"Tempo:");
                  disp_time;
                  Lcd_Out(2,14,"s");
                  delay_ms(1000);
              }
              motorDC = 0;
              ledDisplay = 0;
              Lcd_Cmd(_LCD_CLEAR);
              

           }
  }
}