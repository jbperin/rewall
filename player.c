
void Player(){
    // Handle player movement.
    // Update angle and coordinates
    switch (get())	// key
    {
    case 8:	// gauche => tourne gauche
        PosAngle+=16;
        DirX=((int)(CosTable[(PosAngle)&255])   -127);
        DirY=((int)(CosTable[(PosAngle+64)&255])-127);
        break;
    case 9:	// droite => tourne droite
        PosAngle-=16;
        DirX=((int)(CosTable[(PosAngle)&255])   -127);
        DirY=((int)(CosTable[(PosAngle+64)&255])-127);
        break;
    case 10: // bas => recule
        PosX-=DirX;
        PosY-=DirY;
        break;
    case 11: // haut => avance
        PosX+=DirX;
        PosY+=DirY;
        break;
    }
}
