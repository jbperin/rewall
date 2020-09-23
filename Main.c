#include	"lib.h"

// --------------------------------------
// Walls
// --------------------------------------
// (c) 2001 Mickael Pointier.
// This code is provided as-is.
// I do not assume any responsability
// concerning the fact this is a bug-free
// software !!!
// Except that, you can use this example
// without any limitation !
// If you manage to do something with that
// please, contact me :)
// --------------------------------------
// --------------------------------------
// For more information, please contact me
// on internet:
// e-mail: mike@defence-force.org
// URL: http://www.defence-force.org
// --------------------------------------
// Note: This text was typed with a Win32
// editor. So perhaps the text will not be
// displayed correctly with other OS.
#define SHOWMAP

#define COS(v) ((int)(CosTable[((unsigned char)v)])   -127)
#define SIN(v) ((int)(CosTable[((unsigned char)(v+64))])-127)
// #define max(a,b)            (((a) > (b)) ? (a) : (b))
// #define min(a,b)            (((a) < (b)) ? (a) : (b))
#define abs(x)                 (((x)<0)?-(x):(x))

char DrawCompleteColumn();

extern unsigned char        CosTable[];
extern unsigned char        Labyrinthe[];

#include "tabcolor.c"

unsigned char ColorDraw;

#ifdef SHOWMAP
unsigned char   FlagScanned[16*16];
#endif 

unsigned char	TableVerticalPos[40];
unsigned char	PosAngle;

int	PosX;
int	PosY;
int	DirX;
int	DirY;

unsigned char XPos;
unsigned char YPos;

#include "player.c"

// http://www.permadi.com/tutorial/raycast/rayc8.html
//
// Before drawing the wall, there is one problem that must be taken care of. 
// This problem is known as the "fishbowl effect." 
// Fishbowl effect happens because ray-casting implementation mixes polar coordinate and Cartesian coordinate together. 
// Therefore, using the above formula on wall slices that are not directly in front of the viewer will 
// gives a longer distance. This is not what we want because it will cause a viewing distortion such as 
// illustrated below.		
// Thus to remove the viewing distortion, the resulting distance obtained from equations in Figure 17 
// must be multiplied by cos(BETA); where BETA is the angle of the ray that is being cast relative to 
// the viewing angle. On the figure above, the viewing angle (ALPHA) is 90 degrees because the player 
// is facing straight upward. Because we have 60 degrees field of view, BETA is 30 degrees for the leftmost 
// ray and it is -30 degrees for the rightmost ray.
// tab_Ci_int[ii] = 2^18 / CosTable[abs(ii-20)])*2
int tab_Ci_int[] = {
 548, 546, 544, 539, 537, 535, 533, 531
, 529, 526, 524, 524, 522, 520, 520, 518
, 518, 518, 518, 518, 516, 518, 518, 518
, 518, 518, 520, 520, 522, 524, 524, 526
, 529, 531, 533, 535, 537, 539, 544, 546
};

extern unsigned char    idx16;
extern signed int	    xx,yy;
extern signed int 	    ix,iy;

extern unsigned char 	nbStep;
extern unsigned char    distance;

extern unsigned char	angle;
extern unsigned char    indexAngle;

extern unsigned int     div16b8_dividend;

void Raycast()
{
#ifdef SHOWMAP
	// Clean the buffer ;)
    memset(FlagScanned, 0, 255);

	FlagScanned[(PosX>>8) + ((PosY>>8)<<4)]=1;
#endif

	// Start angle
	angle=PosAngle+20;
    // lprintf ("X=%d, Y=%d, PosAngle = %d\n", PosX, PosY, PosAngle);
	for (indexAngle=0;indexAngle<40;indexAngle++)
	{	  
		// Vertical scan
		xx=PosX;
		yy=PosY;

		// Launch a ray scanning...
		ix=((signed int)(CosTable[((unsigned char)angle)]>>1)   -64);
		iy=((signed int)(CosTable[((unsigned char)(angle+64))]>>1)-64);

        // lprintf ("{'idx': %d, 'angle': %d, 'iX':%d, 'iY':%d, ",indexAngle, (signed char)angle, ix, iy);

		// nbStep = 0;
		asm ("lda #0;"
            "sta _nbStep;");

		// idx16 = (xx>>8) + ((yy>>8)<<4);
        asm(
            "lda _yy+1;"
            "asl;"
            "asl;"
            "asl;"
            "asl;"
            "clc;"
            "adc _xx+1;"
            "sta _idx16;"
        );

		// Do the raycast
		while (!Labyrinthe[idx16])
		{
#ifdef SHOWMAP
			FlagScanned[idx16]=1;
#endif

			// xx+=ix;
            asm (
                "    clc;"
                "    lda _xx;"
                "    adc _ix;"
                "    sta _xx;"
                "    lda _xx+1;"
                "    adc _ix+1;"
                "    sta _xx+1;"
            );

			// yy+=iy;
            asm (
                "    clc;"
                "    lda _yy;"
                "    adc _iy;"
                "    sta _yy;"
                "    lda _yy+1;"
                "    adc _iy+1;"
                "    sta _yy+1;"
            );

			// nbStep++;
			asm ("inc _nbStep;");

			// idx16 = (xx>>8) + ((yy>>8)<<4);
			asm(
				"lda _yy+1;"
				"asl;"
				"asl;"
				"asl;"
				"asl;"
				"clc;"
				"adc _xx+1;"
				"sta _idx16;"
			);
		}
        if (nbStep > 2){
            //
            // Compute distance = tab_Ci_int[indexAngle]/nbStep;
            //

            // div16b8_dividend = tab_Ci_int[indexAngle];
            asm (
                " lda _indexAngle;"
                " asl; "
                " tay; "
                " lda _tab_Ci_int,y;"
                " sta _div16b8_dividend;"
                " iny;"
                " lda _tab_Ci_int,y;"
                " sta _div16b8_dividend+1;"
            )

            // http://forums.nesdev.com/viewtopic.php?p=895#p895
            asm(
                "  ldx #16;"           
                "  lda #0;"
                "divloop;"
                "  asl _div16b8_dividend;"
                "  rol _div16b8_dividend+1;"
                "  rol;"
                "  cmp _nbStep;"
                "  bcc no_sub;"
                "  sbc _nbStep;"
                "  inc _div16b8_dividend;"
                "no_sub;"
                "  dex;"
                "  bne divloop;"
                "  lda _div16b8_dividend;"
                "  sta _distance;"
            );


            // Fake perspective test
            //   0=Full size block (200 high)
            // 100=Nothing drawn (0 high, horizontal single pixel)
            if (distance>100)
            {
                TableVerticalPos[indexAngle]=0;
            }
            else
            {
                TableVerticalPos[indexAngle]=100-distance;
            }
        } else {
            TableVerticalPos[indexAngle]=0;
        }
		angle--;
        // asm ("dec _angle;");
        // lprintf ("'nbStep':%d, 'distance' : %d ,'hauteur' = %d},\n", nbStep, distance, TableVerticalPos[indexAngle]);
	}
}

void DisplayWall()
{
	int x;
	unsigned char yy;

	for (x=2;x<40;x++){

		yy=TableVerticalPos[x];

		XPos=x;
		YPos=yy;

		ColorDraw=TabColor[yy];

		DrawCompleteColumn();
	}
}

#ifdef SHOWMAP
//
// Display TWO maps.
// The first one is simply the map with walls
// The second one show the recasting informations
//
void DrawMap()
{
	unsigned char x,y;
	unsigned char *ptr_dst;
	unsigned char *ptr_src;
	unsigned char *ptr_scan;
	unsigned char color;

	ptr_src=Labyrinthe;
	ptr_scan=FlagScanned;
	ptr_dst=(unsigned char*)0xa000+24;
	for (y=0;y<16;y++)
	{
		for (x=0;x<16;x++)
		{
			color = (*ptr_src)?64+1+2+4+8+16+32:64;

			if (*ptr_scan)
			{
				color|=128;
				//printf("%d/%d ",x,y);
			}

			ptr_dst[x]=color;
			ptr_dst[x+40]=color;
			ptr_dst[x+80]=color;
			ptr_dst[x+120]=color;
			ptr_src++;
			ptr_scan++;
		}
		ptr_dst+=40*4;
	}

	curset(144+((PosX*6)>>8),(PosY>>6),2);
}
#endif // SHOWMAP

void main()
{
	int	y;
	int	i;

	// Inits
	PosAngle=0;
	PosX=(8<<8)+128;
	PosY=(7<<8)+128;

    DirX=COS(PosAngle); // ((int)(CosTable[(PosAngle)&255])   -127);
    DirY=SIN(PosAngle); // ((int)(CosTable[(PosAngle+64)&255])-127);

	hires();
	ink(3);

    // Fill the vertical pos table
    for (i=0;i<40;i++)
    {
        TableVerticalPos[i]=i*2;
    }

	while (1)
	{

		// Fill the table
		Raycast();

		// Display the table
		ColorDraw=65;
		DisplayWall();

#ifdef SHOWMAP
		DrawMap();
#endif
        Player();
	}
}








