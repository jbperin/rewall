

.zero

tmpufnX .dsb 1
tmpufnY .dsb 1

_DeltaX:		.dsb 2
_DeltaY:		.dsb 2
_Norm:          .dsb 2

absX .dsb 1
absY .dsb 1

.text

_norm_8:
.(

;;  IF DX == 0 THEN
    lda _DeltaX
	bne norm_8_dxNotNull
;;    IF DY > 0 THEN
		lda _DeltaY
		bmi norm_8_dyNegativ_01
;;      RETURN DY
		sta _Norm
		jmp norm_8_done
norm_8_dyNegativ_01
;;    ELSE
;;      RETURN -DY
		eor #$FF
		sec
		adc #$00
		sta _Norm
		jmp norm_8_done
norm_8_dxNotNull
;;  ELSE IF DX > 0 THEN
	bmi norm_8_dxNegativ_01
;;    AX = DX
		sta absX
		jmp norm_8_computeAbsY
norm_8_dxNegativ_01
;;  ELSE (DX < 0)
;;    AX = -DX
		eor #$FF
		sec
		adc #$00
		sta absX
;;  ENDIF
norm_8_computeAbsY
;;  IF DY == 0 THEN
	lda _DeltaY
	bne norm_8_dyNotNull
;;    RETURN AX
		lda absX
		sta _Norm
		jmp norm_8_done
norm_8_dyNotNull
;;  ELSE IF DY > 0 THEN
	bmi norm_8_dyNegativ_02
;;    AY = DY
		sta absY
		jmp norm_8_sortAbsVal
norm_8_dyNegativ_02
;;  ELSE (DY < 0)
		eor #$FF
		sec
		adc #$00
		sta absY
;;    AY = -DY
;;  ENDIF
norm_8_sortAbsVal
;;  IF AX > AY THEN
	cmp absX
	bcs norm_8_ayOverOrEqualAx
;;    TY = AY
		tay
		sta tmpufnY
;;    TX = AX
		lda absX
		tax
		sta tmpufnX
		jmp norm_8_approxim
norm_8_ayOverOrEqualAx
;;  ELSE
;;    TX = AY
		tax
		sta tmpufnX
;;    TY = AX
		lda absX
		tay
		sta tmpufnY
;;  END
norm_8_approxim
;;  IF TY > TX/2 THEN
	lda tmpufnX
	lsr
	cmp tmpufnY
	bcc norm_8_tyLowerOrEqualTxDiv2
	beq norm_8_tyLowerOrEqualTxDiv2
;;    RETURN TAB_A[TX] + TAB_B[TY]
		lda tabmult_A,X
		clc
		adc tabmult_B,Y
		sta _Norm
		lda #$00
		adc #$00 ; propagate carry
		sta _Norm+1
		jmp norm_8_done
norm_8_tyLowerOrEqualTxDiv2
;;  ELSE (TX/2 <= TY)
;;    RETURN TAB_C[TX] + TAB_D[TY]
		lda tabmult_C,X
		clc
		adc tabmult_D,Y
		sta _Norm
		lda #$00
		adc #$00 ; propagate carry
		sta _Norm+1
;;  END IF

norm_8_done:
.)
  rts

tabmult_A
	.byt 0, 1, 2, 3, 4, 5, 6, 7,
	.byt 8, 9, 10, 11, 12, 13, 14, 15,
	.byt 16, 17, 18, 19, 20, 21, 22, 23,
	.byt 24, 25, 26, 27, 28, 29, 30, 31,
	.byt 32, 33, 34, 35, 36, 37, 38, 39,
	.byt 40, 41, 42, 43, 44, 45, 46, 47,
	.byt 48, 49, 50, 51, 52, 53, 54, 55,
	.byt 56, 57, 58, 59, 60, 61, 62, 63,
	.byt 64, 65, 66, 67, 68, 69, 70, 71,
	.byt 72, 73, 74, 75, 76, 77, 78, 79,
	.byt 80, 81, 82, 83, 84, 85, 86, 87,
	.byt 88, 89, 90, 90, 91, 92, 93, 94,
	.byt 95, 96, 97, 98, 99, 100, 101, 102,
	.byt 103, 104, 105, 106, 107, 108, 109, 110,
	.byt 111, 112, 113, 114, 115, 116, 117, 118,
	.byt 119, 119, 120, 121, 122, 123, 124, 125
tabmult_B
	.byt 0, 0, 0, 0, 0, 1, 1, 1,
	.byt 1, 1, 1, 1, 2, 2, 2, 2,
	.byt 2, 3, 3, 3, 3, 3, 4, 4,
	.byt 4, 4, 4, 5, 5, 5, 6, 6,
	.byt 6, 6, 7, 7, 7, 7, 8, 8,
	.byt 8, 9, 9, 9, 10, 10, 10, 11,
	.byt 11, 11, 12, 12, 13, 13, 13, 14,
	.byt 14, 15, 15, 15, 16, 16, 17, 17,
	.byt 18, 18, 18, 19, 19, 20, 20, 21,
	.byt 21, 22, 22, 23, 23, 24, 24, 25,
	.byt 25, 26, 26, 27, 27, 28, 29, 29,
	.byt 30, 30, 31, 31, 32, 33, 33, 34,
	.byt 34, 35, 36, 36, 37, 38, 38, 39,
	.byt 39, 40, 41, 41, 42, 43, 44, 44,
	.byt 45, 46, 46, 47, 48, 48, 49, 50,
	.byt 51, 51, 52, 53, 54, 54, 55, 56
tabmult_C
	.byt 0, 0, 2, 3, 4, 5, 5, 6,
	.byt 7, 8, 8, 9, 10, 11, 12, 13,
	.byt 14, 14, 15, 16, 17, 18, 19, 19,
	.byt 20, 21, 22, 23, 24, 24, 25, 26,
	.byt 27, 28, 29, 30, 30, 31, 32, 33,
	.byt 34, 35, 35, 36, 37, 38, 39, 40,
	.byt 40, 41, 42, 43, 44, 44, 45, 46,
	.byt 47, 48, 49, 49, 50, 51, 52, 53,
	.byt 54, 54, 55, 56, 57, 58, 59, 59,
	.byt 60, 61, 62, 63, 63, 64, 65, 66,
	.byt 67, 68, 68, 69, 70, 71, 72, 72,
	.byt 73, 74, 75, 76, 76, 77, 78, 79,
	.byt 80, 80, 81, 82, 83, 84, 85, 85,
	.byt 86, 87, 88, 89, 89, 90, 91, 92,
	.byt 93, 93, 94, 95, 96, 97, 97, 98,
	.byt 99, 100, 101, 101, 102, 103, 104, 105
tabmult_D
	.byt 0, 1, 1, 1, 2, 2, 3, 4,
	.byt 4, 5, 5, 6, 7, 7, 8, 8,
	.byt 9, 9, 10, 10, 11, 11, 12, 13,
	.byt 13, 14, 14, 15, 15, 16, 17, 17,
	.byt 18, 18, 19, 19, 20, 20, 21, 22,
	.byt 22, 23, 23, 24, 24, 25, 26, 26,
	.byt 27, 27, 28, 28, 29, 30, 30, 31,
	.byt 31, 32, 33, 33, 34, 34, 35, 35,
	.byt 36, 37, 37, 38, 38, 39, 40, 40,
	.byt 41, 41, 42, 43, 43, 44, 44, 45,
	.byt 46, 46, 47, 47, 48, 49, 49, 50,
	.byt 50, 51, 52, 52, 53, 53, 54, 55,
	.byt 55, 56, 56, 57, 58, 58, 59, 59,
	.byt 60, 61, 61, 62, 63, 63, 64, 64,
	.byt 65, 66, 66, 67, 68, 68, 69, 69,
	.byt 70, 71, 71, 72, 73, 73, 74, 74

