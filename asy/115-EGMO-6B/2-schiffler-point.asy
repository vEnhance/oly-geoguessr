pair A = dir(130);
pair B = dir(210);
pair C = dir(-30);
circle u_c = circle(A, B, C);
pair I = incenter(A, B, C);
pair D = intersectionpoints(u_c, line(A, I))[0];
pair E = intersectionpoints(u_c, line(B, I))[1];
pair F = intersectionpoints(u_c, line(C, I))[1];
pair G_a = (I+B+C)/3;
pair G_b = (I+C+A)/3;
pair G_c = (I+A+B)/3;
pair G = (A+B+C)/3;
pair O = (0, 0);
pair Sc = extension(D, G_a, E, G_b);

draw(A--I, grey);
draw(O--G, deepgreen);
draw(D--Sc, deepgreen);
draw(B--I, grey);
draw(C--I, grey);
draw(u_c, blue);
draw(A--B--C--cycle, lightblue);

dot("$A$", A, dir(110));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$I$", I, dir(-90));
dot("$D$", D, dir(-90));
dot("$E$", E, dir(30));
dot("$F$", F, dir(180));
dot("$G_a$", G_a, dir(0));
dot("$G_b$", G_b, dir(140));
dot("$G_c$", G_c, dir(0));
dot("$G$", G, dir(110));
dot("$O$", O, dir(0));
dot("$Sc$", Sc, dir(-25), .8*blue);

/*
    Source: Schiffler Point (6.40)
    Points: A B C D E F G I O G_a G_b G_c Sc
    Item: A I D
    Item: B I E
    Item: C I F
    Item: E G_b Sc
    Item: F G_c Sc

    Text: $I$ is the incenter of $\triangle ABC$.
    Text: $D$ is the midpoint of the arc $BC$ not containing $A$. Similarly $E$, $F$.
    Text: $O$ is the center of $(ABC)$.
    Text: $G$ be the centroid of $ABC$.
    Text: $G_a$ be the centroid of $IBC$. Similarly $G_b$, $G_c$.
    Text: $Sc$ is the intersection of $DG_A$ and $OG$.
*/
