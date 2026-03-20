pair A = dir(180);
pair B = dir(0);
pair O = (A+B)/2;
pair D = dir(100);
pair E = dir(-30);
pair C = extension(A, B, D, E);
pair F = 2*circumcenter(B, O, D)-O;
pair G = intersectionpoints(circle(A, O, E), circle(B, O, D))[0];
circle u_c = circle(A, B, D);
pair O_1 = circumcenter(A, O, E);
inversion inv = inversion(1, O);
pair C_s = inv*C;
pair G_s = inv*G;
pair F_s = inv*F;

draw(D--E);
draw(A--B);
draw(B--C_s, dotted);
draw(O--G_s, dotted);
draw(u_c, blue);
draw(A--D--B--E--cycle);
draw(circle(B, O, D), deepcyan);
draw(arc(O_1, abs(O_1-A), 125, 30), deepcyan);

dot("$A$", A, dir(140));
dot("$B$", B, dir(-50));
dot("$C$", C, dir(60));
dot("$D$", D, dir(110));
dot("$E$", E, dir(10));
dot("$F$", F, dir(50));
dot("$O$", O, dir(60));
dot("$G$", G, dir(-110));
dot("$C^*$", C_s, dir(0));
dot("$G^*$", G_s, dir(0));
dot("$F^*$", F_s, dir(40));

/*
    Source: Chinese Olympiad 2006 (8.21)
    Points: A B C D E F G O C_s F_s G_s
    Item: O F F_s
    Item: C F G
    Item: O C_s F_s G_s
    Item: C G C_s G_s
    Item: B D G_s
    Item: A E G_s
    Item: B E C_s G_s
    Item: C F C_s F_s
    Item: D O E C_s
    Item: A D C_s G_s
    Item: F G F_s G_s
    Item: B E C G
    Item: C G A D

    Text: $AB$ is the diameter of cyclic quadrilateral $ABDE$ and $O$ is its center.
    Text: $G=(AOE)\cap (BOD)$, $C=AB\cap CD$.
    Text: $OF$ is the diameter of $(BOD)$.
    Text: $F^*$ is the midpoint of $BD$.
    Text: $C^*$, $G^*$ are the inverse of $C$, $G$ wrt $(ABDE)$.
*/
