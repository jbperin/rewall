.zero
; unsigned char idx16
_idx16      .dsb 1
; int xx, yy
_xx         .dsb 2
_yy          .dsb 2
; signed int ix, iy
_ix          .dsb 2
_iy          .dsb 2

; unsigned int	distance;
_distance   .dsb 1

; unsigned char 	nbStep;
_nbStep     .dsb 1

; unsigned char	angle;
_angle      .dsb 1

; unsigned char    indexAngle;
_indexAngle .dsb 1

; unsigned int _div16b8_dividend;
_div16b8_dividend         .dsb 2


.text

_DrawColumn
 sta $a000+0,x
 sta $a000+7960,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+40,x
 sta $a000+7920,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+80,x
 sta $a000+7880,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+120,x
 sta $a000+7840,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+160,x
 sta $a000+7800,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+200,x
 sta $a000+7760,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+240,x
 sta $a000+7720,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+280,x
 sta $a000+7680,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+320,x
 sta $a000+7640,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+360,x
 sta $a000+7600,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+400,x
 sta $a000+7560,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+440,x
 sta $a000+7520,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+480,x
 sta $a000+7480,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+520,x
 sta $a000+7440,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+560,x
 sta $a000+7400,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+600,x
 sta $a000+7360,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+640,x
 sta $a000+7320,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+680,x
 sta $a000+7280,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+720,x
 sta $a000+7240,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+760,x
 sta $a000+7200,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+800,x
 sta $a000+7160,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+840,x
 sta $a000+7120,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+880,x
 sta $a000+7080,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+920,x
 sta $a000+7040,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+960,x
 sta $a000+7000,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+1000,x
 sta $a000+6960,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+1040,x
 sta $a000+6920,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+1080,x
 sta $a000+6880,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+1120,x
 sta $a000+6840,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+1160,x
 sta $a000+6800,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+1200,x
 sta $a000+6760,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+1240,x
 sta $a000+6720,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+1280,x
 sta $a000+6680,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+1320,x
 sta $a000+6640,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+1360,x
 sta $a000+6600,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+1400,x
 sta $a000+6560,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+1440,x
 sta $a000+6520,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+1480,x
 sta $a000+6480,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+1520,x
 sta $a000+6440,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+1560,x
 sta $a000+6400,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+1600,x
 sta $a000+6360,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+1640,x
 sta $a000+6320,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+1680,x
 sta $a000+6280,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+1720,x
 sta $a000+6240,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+1760,x
 sta $a000+6200,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+1800,x
 sta $a000+6160,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+1840,x
 sta $a000+6120,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+1880,x
 sta $a000+6080,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+1920,x
 sta $a000+6040,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+1960,x
 sta $a000+6000,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+2000,x
 sta $a000+5960,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+2040,x
 sta $a000+5920,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+2080,x
 sta $a000+5880,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+2120,x
 sta $a000+5840,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+2160,x
 sta $a000+5800,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+2200,x
 sta $a000+5760,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+2240,x
 sta $a000+5720,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+2280,x
 sta $a000+5680,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+2320,x
 sta $a000+5640,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+2360,x
 sta $a000+5600,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+2400,x
 sta $a000+5560,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+2440,x
 sta $a000+5520,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+2480,x
 sta $a000+5480,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+2520,x
 sta $a000+5440,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+2560,x
 sta $a000+5400,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+2600,x
 sta $a000+5360,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+2640,x
 sta $a000+5320,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+2680,x
 sta $a000+5280,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+2720,x
 sta $a000+5240,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+2760,x
 sta $a000+5200,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+2800,x
 sta $a000+5160,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+2840,x
 sta $a000+5120,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+2880,x
 sta $a000+5080,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+2920,x
 sta $a000+5040,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+2960,x
 sta $a000+5000,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+3000,x
 sta $a000+4960,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+3040,x
 sta $a000+4920,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+3080,x
 sta $a000+4880,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+3120,x
 sta $a000+4840,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+3160,x
 sta $a000+4800,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+3200,x
 sta $a000+4760,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+3240,x
 sta $a000+4720,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+3280,x
 sta $a000+4680,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+3320,x
 sta $a000+4640,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+3360,x
 sta $a000+4600,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+3400,x
 sta $a000+4560,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+3440,x
 sta $a000+4520,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+3480,x
 sta $a000+4480,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+3520,x
 sta $a000+4440,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+3560,x
 sta $a000+4400,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+3600,x
 sta $a000+4360,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+3640,x
 sta $a000+4320,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+3680,x
 sta $a000+4280,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+3720,x
 sta $a000+4240,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+3760,x
 sta $a000+4200,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+3800,x
 sta $a000+4160,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+3840,x
 sta $a000+4120,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+3880,x
 sta $a000+4080,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+3920,x
 sta $a000+4040,x
 .(:tay: lda _nextPattern,y:.):
 sta $a000+3960,x
 sta $a000+4000,x
 .(:tay: lda _nextPattern,y:.):
 rts
_EraseColumn
 sta $a000+4000,x
 sta $a000+3960,x
 sta $a000+3960,x
 sta $a000+4000,x
 sta $a000+3920,x
 sta $a000+4040,x
 sta $a000+3880,x
 sta $a000+4080,x
 sta $a000+3840,x
 sta $a000+4120,x
 sta $a000+3800,x
 sta $a000+4160,x
 sta $a000+3760,x
 sta $a000+4200,x
 sta $a000+3720,x
 sta $a000+4240,x
 sta $a000+3680,x
 sta $a000+4280,x
 sta $a000+3640,x
 sta $a000+4320,x
 sta $a000+3600,x
 sta $a000+4360,x
 sta $a000+3560,x
 sta $a000+4400,x
 sta $a000+3520,x
 sta $a000+4440,x
 sta $a000+3480,x
 sta $a000+4480,x
 sta $a000+3440,x
 sta $a000+4520,x
 sta $a000+3400,x
 sta $a000+4560,x
 sta $a000+3360,x
 sta $a000+4600,x
 sta $a000+3320,x
 sta $a000+4640,x
 sta $a000+3280,x
 sta $a000+4680,x
 sta $a000+3240,x
 sta $a000+4720,x
 sta $a000+3200,x
 sta $a000+4760,x
 sta $a000+3160,x
 sta $a000+4800,x
 sta $a000+3120,x
 sta $a000+4840,x
 sta $a000+3080,x
 sta $a000+4880,x
 sta $a000+3040,x
 sta $a000+4920,x
 sta $a000+3000,x
 sta $a000+4960,x
 sta $a000+2960,x
 sta $a000+5000,x
 sta $a000+2920,x
 sta $a000+5040,x
 sta $a000+2880,x
 sta $a000+5080,x
 sta $a000+2840,x
 sta $a000+5120,x
 sta $a000+2800,x
 sta $a000+5160,x
 sta $a000+2760,x
 sta $a000+5200,x
 sta $a000+2720,x
 sta $a000+5240,x
 sta $a000+2680,x
 sta $a000+5280,x
 sta $a000+2640,x
 sta $a000+5320,x
 sta $a000+2600,x
 sta $a000+5360,x
 sta $a000+2560,x
 sta $a000+5400,x
 sta $a000+2520,x
 sta $a000+5440,x
 sta $a000+2480,x
 sta $a000+5480,x
 sta $a000+2440,x
 sta $a000+5520,x
 sta $a000+2400,x
 sta $a000+5560,x
 sta $a000+2360,x
 sta $a000+5600,x
 sta $a000+2320,x
 sta $a000+5640,x
 sta $a000+2280,x
 sta $a000+5680,x
 sta $a000+2240,x
 sta $a000+5720,x
 sta $a000+2200,x
 sta $a000+5760,x
 sta $a000+2160,x
 sta $a000+5800,x
 sta $a000+2120,x
 sta $a000+5840,x
 sta $a000+2080,x
 sta $a000+5880,x
 sta $a000+2040,x
 sta $a000+5920,x
 sta $a000+2000,x
 sta $a000+5960,x
 sta $a000+1960,x
 sta $a000+6000,x
 sta $a000+1920,x
 sta $a000+6040,x
 sta $a000+1880,x
 sta $a000+6080,x
 sta $a000+1840,x
 sta $a000+6120,x
 sta $a000+1800,x
 sta $a000+6160,x
 sta $a000+1760,x
 sta $a000+6200,x
 sta $a000+1720,x
 sta $a000+6240,x
 sta $a000+1680,x
 sta $a000+6280,x
 sta $a000+1640,x
 sta $a000+6320,x
 sta $a000+1600,x
 sta $a000+6360,x
 sta $a000+1560,x
 sta $a000+6400,x
 sta $a000+1520,x
 sta $a000+6440,x
 sta $a000+1480,x
 sta $a000+6480,x
 sta $a000+1440,x
 sta $a000+6520,x
 sta $a000+1400,x
 sta $a000+6560,x
 sta $a000+1360,x
 sta $a000+6600,x
 sta $a000+1320,x
 sta $a000+6640,x
 sta $a000+1280,x
 sta $a000+6680,x
 sta $a000+1240,x
 sta $a000+6720,x
 sta $a000+1200,x
 sta $a000+6760,x
 sta $a000+1160,x
 sta $a000+6800,x
 sta $a000+1120,x
 sta $a000+6840,x
 sta $a000+1080,x
 sta $a000+6880,x
 sta $a000+1040,x
 sta $a000+6920,x
 sta $a000+1000,x
 sta $a000+6960,x
 sta $a000+960,x
 sta $a000+7000,x
 sta $a000+920,x
 sta $a000+7040,x
 sta $a000+880,x
 sta $a000+7080,x
 sta $a000+840,x
 sta $a000+7120,x
 sta $a000+800,x
 sta $a000+7160,x
 sta $a000+760,x
 sta $a000+7200,x
 sta $a000+720,x
 sta $a000+7240,x
 sta $a000+680,x
 sta $a000+7280,x
 sta $a000+640,x
 sta $a000+7320,x
 sta $a000+600,x
 sta $a000+7360,x
 sta $a000+560,x
 sta $a000+7400,x
 sta $a000+520,x
 sta $a000+7440,x
 sta $a000+480,x
 sta $a000+7480,x
 sta $a000+440,x
 sta $a000+7520,x
 sta $a000+400,x
 sta $a000+7560,x
 sta $a000+360,x
 sta $a000+7600,x
 sta $a000+320,x
 sta $a000+7640,x
 sta $a000+280,x
 sta $a000+7680,x
 sta $a000+240,x
 sta $a000+7720,x
 sta $a000+200,x
 sta $a000+7760,x
 sta $a000+160,x
 sta $a000+7800,x
 sta $a000+120,x
 sta $a000+7840,x
 sta $a000+80,x
 sta $a000+7880,x
 sta $a000+40,x
 sta $a000+7920,x
 rts



_TableMul6Low
 .byt 0
 .byt 6
 .byt 12
 .byt 18
 .byt 24
 .byt 30
 .byt 36
 .byt 42
 .byt 48
 .byt 54
 .byt 60
 .byt 66
 .byt 72
 .byt 78
 .byt 84
 .byt 90
 .byt 96
 .byt 102
 .byt 108
 .byt 114
 .byt 120
 .byt 126
 .byt 132
 .byt 138
 .byt 144
 .byt 150
 .byt 156
 .byt 162
 .byt 168
 .byt 174
 .byt 180
 .byt 186
 .byt 192
 .byt 198
 .byt 204
 .byt 210
 .byt 216
 .byt 222
 .byt 228
 .byt 234
 .byt 240
 .byt 246
 .byt 252
 .byt 2
 .byt 8
 .byt 14
 .byt 20
 .byt 26
 .byt 32
 .byt 38
 .byt 44
 .byt 50
 .byt 56
 .byt 62
 .byt 68
 .byt 74
 .byt 80
 .byt 86
 .byt 92
 .byt 98
 .byt 104
 .byt 110
 .byt 116
 .byt 122
 .byt 128
 .byt 134
 .byt 140
 .byt 146
 .byt 152
 .byt 158
 .byt 164
 .byt 170
 .byt 176
 .byt 182
 .byt 188
 .byt 194
 .byt 200
 .byt 206
 .byt 212
 .byt 218
 .byt 224
 .byt 230
 .byt 236
 .byt 242
 .byt 248
 .byt 254
 .byt 4
 .byt 10
 .byt 16
 .byt 22
 .byt 28
 .byt 34
 .byt 40
 .byt 46
 .byt 52
 .byt 58
 .byt 64
 .byt 70
 .byt 76
 .byt 82
 .byt 88
 .byt 94
 .byt 100
 .byt 106
 .byt 112
 .byt 118
 .byt 124
 .byt 130
 .byt 136
 .byt 142
 .byt 148
 .byt 154
 .byt 160
 .byt 166
 .byt 172
 .byt 178
 .byt 184
 .byt 190
 .byt 196
 .byt 202
 .byt 208
 .byt 214
 .byt 220
 .byt 226
 .byt 232
 .byt 238
 .byt 244
 .byt 250
 .byt 0
 .byt 6
 .byt 12
 .byt 18
 .byt 24
 .byt 30
 .byt 36
 .byt 42
 .byt 48
 .byt 54
 .byt 60
 .byt 66
 .byt 72
 .byt 78
 .byt 84
 .byt 90
 .byt 96
 .byt 102
 .byt 108
 .byt 114
 .byt 120
 .byt 126
 .byt 132
 .byt 138
 .byt 144
 .byt 150
 .byt 156
 .byt 162
 .byt 168
 .byt 174
 .byt 180
 .byt 186
 .byt 192
 .byt 198
 .byt 204
 .byt 210
 .byt 216
 .byt 222
 .byt 228
 .byt 234
 .byt 240
 .byt 246
 .byt 252
 .byt 2
 .byt 8
 .byt 14
 .byt 20
 .byt 26
 .byt 32
 .byt 38
 .byt 44
 .byt 50
 .byt 56
 .byt 62
 .byt 68
 .byt 74
 .byt 80
 .byt 86
 .byt 92
 .byt 98
 .byt 104
 .byt 110
 .byt 116
 .byt 122
 .byt 128
 .byt 134
 .byt 140
 .byt 146
 .byt 152
 .byt 158
 .byt 164
 .byt 170



_TableMul6High
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 0
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 1
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 2
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 3
 .byt 4
 .byt 4
 .byt 4
 .byt 4
 .byt 4
 .byt 4
 .byt 4
 .byt 4
 .byt 4
 .byt 4
 .byt 4
 .byt 4
 .byt 4
 .byt 4
 .byt 4
 .byt 4
 .byt 4
 .byt 4
 .byt 4
 .byt 4
 .byt 4
 .byt 4
 .byt 4
 .byt 4
 .byt 4
 .byt 4
 .byt 4
 .byt 4
 .byt 4



_nextPattern
 .byt  0    
 .byt  0    
 .byt  0    
 .byt  0    
 .byt  0    
 .byt  0    
 .byt  0    
 .byt  0    
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  64
 .byt  96
 .byt  68
 .byt  100
 .byt  80
 .byt  88
 .byt  74
 .byt  77
 .byt  66
 .byt  82
 .byt  67
 .byt  86
 .byt  98
 .byt  75
 .byt  106
 .byt  121
 .byt  65
 .byt  76
 .byt  70
 .byt  99
 .byt  104
 .byt  89
 .byt  78
 .byt  117
 .byt  81
 .byt  116
 .byt  102
 .byt  87
 .byt  108
 .byt  79
 .byt  103
 .byt  126
 .byt  72
 .byt  69
 .byt  97
 .byt  90
 .byt  84
 .byt  92
 .byt  114
 .byt  94
 .byt  73
 .byt  83
 .byt  113
 .byt  91
 .byt  120
 .byt  122
 .byt  124
 .byt  125
 .byt  112
 .byt  85
 .byt  101
 .byt  93
 .byt  105
 .byt  115
 .byt  110
 .byt  95
 .byt  71
 .byt  109
 .byt  107
 .byt  111
 .byt  118
 .byt  123
 .byt  119
 .byt  127

 
_TableMul10Low
 .byt  0  
 .byt  10 
 .byt  20 
 .byt  30 
 .byt  40 
 .byt  50 
 .byt  60 
 .byt  70 
 .byt  80 
 .byt  90 
 .byt  100
 .byt  110
 .byt  120
 .byt  130
 .byt  140
 .byt  150
 .byt  160
 .byt  170
 .byt  180
 .byt  190
 .byt  200
 .byt  210
 .byt  220
 .byt  230
 .byt  240
 .byt  250
 .byt  4
 .byt  14
 .byt  24
 .byt  34
 .byt  44
 .byt  54
 .byt  64
 .byt  74
 .byt  84
 .byt  94
 .byt  104
 .byt  114
 .byt  124
 .byt  134
 .byt  144
 .byt  154
 .byt  164
 .byt  174
 .byt  184
 .byt  194
 .byt  204
 .byt  214
 .byt  224
 .byt  234
 .byt  244
 .byt  254
 .byt  8
 .byt  18
 .byt  28
 .byt  38
 .byt  48
 .byt  58
 .byt  68
 .byt  78
 .byt  88
 .byt  98
 .byt  108
 .byt  118
 .byt  128
 .byt  138
 .byt  148
 .byt  158
 .byt  168
 .byt  178
 .byt  188
 .byt  198
 .byt  208
 .byt  218
 .byt  228
 .byt  238
 .byt  248
 .byt  2
 .byt  12
 .byt  22
 .byt  32
 .byt  42
 .byt  52
 .byt  62
 .byt  72
 .byt  82
 .byt  92
 .byt  102
 .byt  112
 .byt  122
 .byt  132
 .byt  142
 .byt  152
 .byt  162
 .byt  172
 .byt  182
 .byt  192
 .byt  202
 .byt  212
 .byt  222
 .byt  232
 .byt  242
 .byt  252
 .byt  6
 .byt  16
 .byt  26
 .byt  36
 .byt  46
 .byt  56
 .byt  66
 .byt  76
 .byt  86
 .byt  96
 .byt  106
 .byt  116
 .byt  126
 .byt  136
 .byt  146
 .byt  156
 .byt  166
 .byt  176
 .byt  186
 .byt  196
 .byt  206
 .byt  216
 .byt  226
 .byt  236
 .byt  246
 .byt  0
 .byt  10
 .byt  20
 .byt  30
 .byt  40
 .byt  50
 .byt  60
 .byt  70
 .byt  80
 .byt  90
 .byt  100
 .byt  110
 .byt  120
 .byt  130
 .byt  140
 .byt  150
 .byt  160
 .byt  170
 .byt  180
 .byt  190
 .byt  200
 .byt  210
 .byt  220
 .byt  230
 .byt  240
 .byt  250
 .byt  4
 .byt  14
 .byt  24
 .byt  34
 .byt  44
 .byt  54
 .byt  64
 .byt  74
 .byt  84
 .byt  94
 .byt  104
 .byt  114
 .byt  124
 .byt  134
 .byt  144
 .byt  154
 .byt  164
 .byt  174
 .byt  184
 .byt  194
 .byt  204
 .byt  214
 .byt  224
 .byt  234
 .byt  244
 .byt  254
 .byt  8
 .byt  18
 .byt  28
 .byt  38
 .byt  48
 .byt  58
 .byt  68
 .byt  78
 .byt  88
 .byt  98
 .byt  108
 .byt  118
 .byt  128
 .byt  138
 .byt  148
 .byt  158
 .byt  168
 .byt  178
 .byt  188
 .byt  198
_TableMul10High
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  0
 .byt  1
 .byt  1
 .byt  1
 .byt  1
 .byt  1
 .byt  1
 .byt  1
 .byt  1
 .byt  1
 .byt  1
 .byt  1
 .byt  1
 .byt  1
 .byt  1
 .byt  1
 .byt  1
 .byt  1
 .byt  1
 .byt  1
 .byt  1
 .byt  1
 .byt  1
 .byt  1
 .byt  1
 .byt  1
 .byt  1
 .byt  2
 .byt  2
 .byt  2
 .byt  2
 .byt  2
 .byt  2
 .byt  2
 .byt  2
 .byt  2
 .byt  2
 .byt  2
 .byt  2
 .byt  2
 .byt  2
 .byt  2
 .byt  2
 .byt  2
 .byt  2
 .byt  2
 .byt  2
 .byt  2
 .byt  2
 .byt  2
 .byt  2
 .byt  2
 .byt  3
 .byt  3
 .byt  3
 .byt  3
 .byt  3
 .byt  3
 .byt  3
 .byt  3
 .byt  3
 .byt  3
 .byt  3
 .byt  3
 .byt  3
 .byt  3
 .byt  3
 .byt  3
 .byt  3
 .byt  3
 .byt  3
 .byt  3
 .byt  3
 .byt  3
 .byt  3
 .byt  3
 .byt  3
 .byt  3
 .byt  4
 .byt  4
 .byt  4
 .byt  4
 .byt  4
 .byt  4
 .byt  4
 .byt  4
 .byt  4
 .byt  4
 .byt  4
 .byt  4
 .byt  4
 .byt  4
 .byt  4
 .byt  4
 .byt  4
 .byt  4
 .byt  4
 .byt  4
 .byt  4
 .byt  4
 .byt  4
 .byt  4
 .byt  4
 .byt  5
 .byt  5
 .byt  5
 .byt  5
 .byt  5
 .byt  5
 .byt  5
 .byt  5
 .byt  5
 .byt  5
 .byt  5
 .byt  5
 .byt  5
 .byt  5
 .byt  5
 .byt  5
 .byt  5
 .byt  5
 .byt  5
 .byt  5
 .byt  5
 .byt  5
 .byt  5
 .byt  5
 .byt  5
 .byt  5
 .byt  6
 .byt  6
 .byt  6
 .byt  6
 .byt  6
 .byt  6
 .byt  6
 .byt  6
 .byt  6
 .byt  6
 .byt  6
 .byt  6
 .byt  6
 .byt  6
 .byt  6
 .byt  6
 .byt  6
 .byt  6
 .byt  6
 .byt  6
 .byt  6
 .byt  6
 .byt  6
 .byt  6
 .byt  6
 .byt  6
 .byt  7
 .byt  7
 .byt  7
 .byt  7
 .byt  7
 .byt  7
 .byt  7
 .byt  7
 .byt  7
 .byt  7
 .byt  7
 .byt  7
 .byt  7
 .byt  7
 .byt  7
 .byt  7
 .byt  7
 .byt  7
 .byt  7
 .byt  7
