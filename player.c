void Player(){
    int tmpPosX, tmpPosY;

    // Handle player movement.
    // Update angle and coordinates
    switch (get())	// key
    {
    case 8:	// gauche => tourne gauche
        PosAngle+=16;
        DirX=COS(PosAngle);
        DirY=SIN(PosAngle);
        break;
    case 9:	// droite => tourne droite
        PosAngle-=16;
        DirX=COS(PosAngle);
        DirY=SIN(PosAngle);
        break;
    case 10: // bas => recule
        tmpPosX = PosX - 2*DirX;
        tmpPosY = PosY - 2*DirY;
        if (!Labyrinthe[(tmpPosX>>8) + ((tmpPosY>>8)<<4)]) {
            PosX = PosX - DirX;
            PosY = PosY - DirY;
        }
        break;
    case 11: // haut => avance
        tmpPosX = PosX + 2*DirX;
        tmpPosY = PosY + 2*DirY;
        if (!Labyrinthe[(tmpPosX>>8) + ((tmpPosY>>8)<<4)]) {
            PosX = PosX + DirX;
            PosY = PosY + DirY;
        }
        break;
    }
    // printf ("%d %d    ", PosX, PosY);
}
