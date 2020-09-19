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

char DrawCompleteColumn();

extern unsigned char CosTable[];
extern unsigned char Labyrinthe[];

#include "tabcolor.c"

unsigned char ColorDraw;

#ifdef SHOWMAP

unsigned char FlagScanned[16*16];
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


void Raycast()
{
	unsigned char	i;
	unsigned char	angle;
	unsigned char	y_value;

	int				xx,yy;
	int				ix,iy;

	unsigned int	distance;

	unsigned int	d_step;

#ifdef SHOWMAP
	// Clean the buffer ;)
    memset(FlagScanned, 0, 255);

	FlagScanned[(PosX>>8) + ((PosY>>8)<<4)]=1;
#endif

	// Start angle
	angle=PosAngle+20;
	for (i=0;i<40;i++)
	{	  
		// Vertical scan
		xx=PosX;
		yy=PosY;

		// Launch a ray scanning...
		ix=((int)(CosTable[(angle)&255]>>1)   -64);
		iy=((int)(CosTable[(angle+64)&255]>>1)-64);
		distance=0;

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

		d_step=((unsigned int)CosTable[(256+i-20)&255])<<1;	// Fishball nearly gone


		// Do the raycast
		while (!Labyrinthe[(xx>>8) + ((yy>>8)<<4)])
		{
#ifdef SHOWMAP
			FlagScanned[(xx>>8) + ((yy>>8)<<4)]=1;
#endif
			xx+=ix;
			yy+=iy;
			distance+=d_step;
		}

		// Compute the distance
		distance>>=4;
		distance=(64<<8)/distance;
		
        // Fake perspective test
		if (distance>100)
		{
			y_value=0;
		}
		else
		{
			y_value=100-distance;
		}

		//   0=Full size block (200 high)
		// 100=Nothing drawn (0 high, horizontal single pixel)
		TableVerticalPos[i]=y_value;
		angle--;
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

    DirX=((int)(CosTable[(PosAngle)&255])   -127);
    DirY=((int)(CosTable[(PosAngle+64)&255])-127);

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








