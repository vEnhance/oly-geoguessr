pair A = dir(180);
pair B = dir(0);
pair O = (A+B)/2;
pair C = dir(100);
pair D = dir(35);
pair M = extension(A, B, C, D);
pair K = intersectionpoints(circle(A, O, C), circle(B, O, D))[1];
inversion inv = inversion(1, O);
pair K_s = inv*K;
pair M_s = inv*M;

draw(O--K_s, dotted);
draw(D--M--B);
draw(A--C--D--B--cycle);
draw(circle(A, B, C), blue);
draw(circle(A, O, C), lightblue);
draw(circle(B, O, D), lightblue);

dot("$A$", A, dir(220));
dot("$B$", B, dir(-50));
dot("$C$", C, dir(90));
dot("$D$", D, dir(60));
dot("$M$", M, dir(0));
dot("$O$", O, dir(-105)*1.8);
dot("$K$", K, dir(-10));
dot("$K^*$", K_s, dir(90));
dot("$M^*$", M_s, dir(-90));

/*
    Source: Iran Olympiad 1996 (8.27)
    Points: A B C D K M O K_s M_s
    Item: A C K_s
    Item: B D K_s
    Item: C D K K_s
    Item: C D O M_s

    Text: $ABCD$ is cyclic with its diameter $AB$ and center $O$.
    Text: $K=(AOC)\cap (BOD)$.
    Text: $K^*$, $M^*$ are inverse of $K$, $M$ wrt $(ABCD)$.
*/
