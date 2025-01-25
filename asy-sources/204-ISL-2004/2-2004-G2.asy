pair A = (-1, 0);
pair B = (1, 0);
circle u_c = circle(A, B);
pair C = dir(50);
pair K = (B-.25A)/.75;
pair L = rotate(90, K)*B;
pair D = extension(A, C, K, L);
line tangent1 = tangents(u_c, D)[1];
pair E = intersectionpoints(u_c, tangent1)[0];
pair F = extension(E, B, D, K);
pair G = intersectionpoints(u_c, line(A, F))[0];
pair H = 2*foot(G, A, B)-G;

draw(u_c, blue);
draw(A--K);
draw(D--F, .8*red);
draw(A--D);
draw(D--E);
draw(E--F);
draw(F--A);
draw(G--H);

dot("$A$", A, dir(180));
dot("$B$", B, dir(50));
dot("$C$", C, dir(90));
dot("$K$", K, dir(0));
dot("$D$", D, dir(60));
dot("$E$", E, dir(110));
dot("$F$", F, dir(-60));
dot("$G$", G, dir(-70));
dot("$H$", H, dir(60));

/*
    Source: ISL 2004 G2
    Points: A B C D E F G H K
    Item: B K F G
    Item: B K D C
    Item: C D F G
    Item: C H F

    Text: $K$ is the foot of $AB$ on $d$
*/
