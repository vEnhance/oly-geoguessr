pair A = (-.6, -.6);
pair B = (1.2, -.6);
pair E = (-.4, -.05);
pair C = B+(abs(A-B)-abs(A-E))*dir(A--E);
pair M = (C+E)/2;
pair B_p = 2*M-B;
pair E_r = rotate(90, (A+E)/2)*E;
pair Z_1 = extension(E_r, (A+E)/2, B, C);
pair Z_2 = 2*Z_1-B;
circle c_1 = circle(C, E, Z_2);
circle c_2 = circle(A, B, B_p);
pair D = intersectionpoints(c_1, c_2)[1];
pair O = circumcenter(B, C, D);
pair D_p = 2*M-D;
pair Y = (B+D)/2;
pair Z = (C+D)/2;

draw(C--E, deepgreen);
draw(B--B_p, deepgreen);
draw(D--D_p, deepgreen);
draw(A--E, lightblue);
draw(B--C, lightblue);
draw(B--D);
draw(A--B);
draw(M--O);
draw(C--D--E);

dot("$A$", A, dir(180));
dot("$B$", B, dir(0));
dot("$C$", C, dir(0));
dot("$D$", D, dir(90));
dot("$E$", E, dir(140));
dot("$M$", M, dir(200));
dot("$O$", O, dir(-90));
dot("$Y$", Y, dir(0));
dot("$Z$", Z, dir(40));
dot("$B'$", B_p, dir(90));
dot("$D'$", D_p, dir(0));

/*
    Source: ISL 2010 G5
    Points: A B C D E M Y Z O B_p D_p
    Item: A E B_p
    Item: B C D D_p
    Item: D M O Y Z
    Item: A B D B_p

    Text: $BC\parallel AE$, $AB=BC+AE$, $\angle ABC=\angle CDE$, $\angle DMO=90^\circ$.
    Text: $O$ is the circumcenter of $\triangle BCD$, $M$ is the midpoint of $CE$.
    Text: $B'$ is the reflection of $B$ wrt $M$.
    Text: $Y$, $Z$ are the midpoint of $BD$, $CD$ respectively.
*/
