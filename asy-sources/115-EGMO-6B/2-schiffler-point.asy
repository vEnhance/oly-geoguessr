pair A = dir(130);
pair B = dir(210);
pair C = dir(-30);
circle u_c = circle(A, B, C);
pair I = incenter(A, B, C);
pair D = intersectionpoints(u_c, line(A, I))[0];
pair E = intersectionpoints(u_c, line(B, I))[1];
pair F = intersectionpoints(u_c, line(C, I))[1];
pair M = (B+C)/2;
pair N = (C+A)/2;
pair P = (A+B)/2;
pair G_a = (I+B+C)/3;
pair G_b = (I+C+A)/3;
pair G_c = (I+A+B)/3;
pair G = (A+B+C)/3;
pair O = (0, 0);
pair Sc = extension(D, G_a, E, G_b);

draw(A--I);
draw(B--I);
draw(C--I);
draw(u_c, blue);
draw(A--B--C--cycle);

dot("$A$", A, dir(110));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$I$", I, dir(-90));
dot("$D$", D, dir(-90));
dot("$E$", E, dir(30));
dot("$F$", F, dir(180));
dot("$M$", M, dir(-90));
dot("$N$", N, dir(30));
dot("$P$", P, dir(180));
dot("$G_a$", G_a, dir(0));
dot("$G_b$", G_b, dir(140));
dot("$G_c$", G_c, dir(0));
dot("$G$", G, dir(110));
dot("$O$", O, dir(0));
dot("$Sc$", Sc, dir(0), .8*red);

/*
    Source: Schiffler Point (6.40)
    Points: A B C D E F G I O M N P G_a G_b G_c Sc
    Item: A I D
    Item: B I E
    Item: C I F
    Item: A G M
    Item: B G N
    Item: C G P
    Item: I G_a M
    Item: I G_b N
    Item: I G_c P
    Item: D G_a Sc
    Item: E G_b Sc
    Item: F G_c Sc
    Item: O G Sc

    Text: $D$ is the midpoint of the arc $BC$ not containing $A$. Similarly $E$, $F$
    Text: $O$ is the center of $(ABC)$
    Text: $G$ be the centroid of $ABC$
    Text: $G_a$ be the centroid of $IBC$. Similarly $G_b$, $G_c$
    Text: $Sc$ is the Schiffler Point
*/
