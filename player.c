void Player(){
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
        PosX-=DirX;
        PosY-=DirY;
        break;
    case 11: // haut => avance
        PosX+=DirX;
        PosY+=DirY;
        break;
    }
}
