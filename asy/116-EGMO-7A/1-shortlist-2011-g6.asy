pair A = dir(90);
pair B = dir(220);
pair C = dir(-40);
pair O = (0, 0);
circle u_c = circle(A, B, C);
pair D = (A+C)/2;
circle c_1 = circle(D, B, C);
pair E = intersectionpoints(c_1, line(A, O))[1];
circle c_2 = circle(A, E, B);
pair O_2 = circumcenter(A, B, E);
pair F = intersectionpoints(c_2, line(B, D))[1];
pair I = extension(A, F, B, E);
pair K = extension(C, I, B, D);
pair M = (B+C)/2;

draw(B--D);
draw(A--F);
draw(B--E);
draw(C--I);
draw(u_c, blue);
draw(c_1, .8*red);
draw(arc(O_2, abs(O_2-E), -85, 35), deepgreen);
filldraw(triangle(A, B, C), opacity(0.2)+paleyellow);

dot("$A$", A, dir(70));
dot("$B$", B, dir(240));
dot("$C$", C, dir(-30));
dot("$O$", O, dir(30));
dot("$D$", D, dir(40));
dot("$E$", E, dir(40));
dot("$F$", F, dir(-60));
dot("$I$", I, dir(160));
dot("$K$", K, dir(-90));
dot("$M$", M, dir(-90));

/*
    Source: ISL 2011 G6 (7.20)
    Points: A B C D E F I K M O
    Item: A O E M
    Item: A C M F
    Item: D O K M C

    Text: $AB=AC$ and $EB=EC$.
    Text: $O$ is the circumcenter of $\triangle ABC$.
    Text: $M$ is the midpoint of $BC$.
    Text: $D$ is the midpoint of $AC$.
*/
