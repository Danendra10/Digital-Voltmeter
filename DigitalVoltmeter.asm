_main:
    MOVLW   1
    MOVWF   PORTA+0

    MOVLW   1
    MOVWF   TRISA+0

    CLRF    PORTB+0
    CLRF    TRISB+0

    CALL    _Lcd_Init+0

    CALL    ADC_Init+0

    MOVLW   12
    MOVWF   FARG_Lcd_Cmd_out_char+0
    CALL    _Lcd_Cmd+0

    MOVLW   1
    MOVWF   FARG_Lcd_Cmd_out_char+0
    CALL    _Lcd_Cmd+0

    MOVLW   1
    MOVWF   FARG_Lcd_Out_row+0
    MOVLW   1
    MOVWF   FARG_Lcd_Out_column+0
    MOVLW   ?lstr1_MyProject+0
	MOVWF   FARG_Lcd_Out_text+0
	CALL    _Lcd_Out+0

    MOVLW   6
    MOVWF   R11+0
    MOVLW   19
    MOVWF   R12+0
    MOVLW   173
    MOVWF   R13+0

L_main0:
    DECFSZ  R13+0, 1
    GOTO    L_main0
    DECFSZ  R12+0, 1
    GOTO    L_main0
    DECFSZ  R11+0, 1
    GOTO    L_main0

L_main1:
    CLRF    FARG_ADC_Read_channel+0
    CALL    _ADC_Read+0
    CALL    _word2double+0
    MOVF    R0+0, 0
    MOVWF   _voltage+0
    MOVF    R0+1, 0
    MOVWF   _voltage+1
    MOVF    R0+2, 0
    MOVWF   _voltage+2
    MOVF    R0+3, 0
    MOVWF   _voltage+3
    
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      137
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _voltage+0
	MOVF       R0+1, 0
	MOVWF      _voltage+1
	MOVF       R0+2, 0
	MOVWF      _voltage+2
	MOVF       R0+3, 0
	MOVWF      _voltage+3

	MOVF       R0+0, 0
	MOVWF      FARG_FloatToStr_fnum+0
	MOVF       R0+1, 0
	MOVWF      FARG_FloatToStr_fnum+1
	MOVF       R0+2, 0
	MOVWF      FARG_FloatToStr_fnum+2
	MOVF       R0+3, 0
	MOVWF      FARG_FloatToStr_fnum+3
	MOVLW      _volt+0
	MOVWF      FARG_FloatToStr_str+0
	CALL       _FloatToStr+0

	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0

	MOVLW      _volt+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	CALL       _Lcd_Out+0

	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0

	GOTO       L_main1

L_end_main:
	GOTO       $+0

