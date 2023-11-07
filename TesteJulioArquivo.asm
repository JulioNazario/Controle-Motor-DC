
_main:

;TesteJulioArquivo.c,23 :: 		void main(){
;TesteJulioArquivo.c,26 :: 		CMCON = 7;                        // desliga os comparadores
	MOVLW      7
	MOVWF      CMCON+0
;TesteJulioArquivo.c,28 :: 		TRISA = 16;                       // 0b00010000
	MOVLW      16
	MOVWF      TRISA+0
;TesteJulioArquivo.c,29 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;TesteJulioArquivo.c,30 :: 		PORTA = 0x00;
	CLRF       PORTA+0
;TesteJulioArquivo.c,31 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;TesteJulioArquivo.c,33 :: 		TRISA4_bit = 1;
	BSF        TRISA4_bit+0, BitPos(TRISA4_bit+0)
;TesteJulioArquivo.c,34 :: 		TRISB0_bit = 0;
	BCF        TRISB0_bit+0, BitPos(TRISB0_bit+0)
;TesteJulioArquivo.c,36 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;TesteJulioArquivo.c,38 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;TesteJulioArquivo.c,39 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;TesteJulioArquivo.c,40 :: 		Lcd_Out(1,1,"Inicializando...");                 // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_TesteJulioArquivo+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;TesteJulioArquivo.c,41 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	NOP
;TesteJulioArquivo.c,42 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;TesteJulioArquivo.c,43 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	NOP
	NOP
;TesteJulioArquivo.c,48 :: 		while(1) {                         // Endless loop
L_main2:
;TesteJulioArquivo.c,50 :: 		Lcd_Out(1,1,"Motor Desligado");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_TesteJulioArquivo+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;TesteJulioArquivo.c,51 :: 		if (s1 == 0) {
	BTFSC      RA4_bit+0, BitPos(RA4_bit+0)
	GOTO       L_main4
;TesteJulioArquivo.c,52 :: 		for (contador = 0; contador < 10; contador++) {
	CLRF       main_contador_L1+0
L_main5:
	MOVLW      10
	SUBWF      main_contador_L1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;TesteJulioArquivo.c,54 :: 		motorDC = 1;
	BSF        RA3_bit+0, BitPos(RA3_bit+0)
;TesteJulioArquivo.c,55 :: 		ledDisplay = 1;
	BSF        RA2_bit+0, BitPos(RA2_bit+0)
;TesteJulioArquivo.c,56 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;TesteJulioArquivo.c,57 :: 		Lcd_Out(1,1,"Motor Ligado");                 // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_TesteJulioArquivo+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;TesteJulioArquivo.c,58 :: 		Lcd_Out(2,1,"Tempo:");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_TesteJulioArquivo+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;TesteJulioArquivo.c,59 :: 		disp_time;
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	ADDWF      main_contador_L1+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;TesteJulioArquivo.c,60 :: 		Lcd_Out(2,14,"s");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_TesteJulioArquivo+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;TesteJulioArquivo.c,61 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
	NOP
;TesteJulioArquivo.c,52 :: 		for (contador = 0; contador < 10; contador++) {
	INCF       main_contador_L1+0, 1
;TesteJulioArquivo.c,62 :: 		}
	GOTO       L_main5
L_main6:
;TesteJulioArquivo.c,63 :: 		motorDC = 0;
	BCF        RA3_bit+0, BitPos(RA3_bit+0)
;TesteJulioArquivo.c,64 :: 		ledDisplay = 0;
	BCF        RA2_bit+0, BitPos(RA2_bit+0)
;TesteJulioArquivo.c,65 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;TesteJulioArquivo.c,68 :: 		}
L_main4:
;TesteJulioArquivo.c,69 :: 		}
	GOTO       L_main2
;TesteJulioArquivo.c,70 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
