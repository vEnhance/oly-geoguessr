pair A = dir(110);
pair B = dir(210);
pair C = dir(-30);
pair X = 2C-B;
pair Y = (C-.2A)/.8;
pair Z = extension(A, B, X, Y);

draw(C--X, dotted);
draw(C--Y, dotted);
draw(B--Z, dotted);
filldraw(triangle(A, B, C), opacity(0.2)+paleblue, black+1.1);

dot("$A$", A, dir(110));
dot("$B$", B, dir(180));
dot("$C$", C, dir(0));
dot("$X$", X, dir(0));
dot("$Y$", Y, dir(0));
dot("$Z$", Z, dir(0));

/*
    Source: Menelaus’s Theorem (3.7)
    Points: A B C X Y Z
    Item: X Y Z
    
    Text: $X$, $Y$, $Z$ lies on the sides.
    Text: $\frac{BX}{XC}\cdot\frac{CY}{YA}\cdot\frac{AZ}{ZB}=-1$.
*/
