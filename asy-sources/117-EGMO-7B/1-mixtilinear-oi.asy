pair A = dir(120);
pair B = dir(210);
pair C = dir(-30);
pair O = (0, 0);
circle u_c = circle(A, B, C);
pair I = incenter(A, B, C);
pair D = foot(I, B, C);
pair E = foot(I, C, A);
pair F = foot(I, A, B);
pair K = intersectionpoints(u_c, line(A, I))[0];
pair L = intersectionpoints(u_c, line(B, I))[1];
pair M = intersectionpoints(u_c, line(C, I))[1];
pair K_p = -K;
pair L_p = -L;
pair M_p = -M;
pair T_A = intersectionpoints(u_c, line(K_p, I))[0];
pair T_B = intersectionpoints(u_c, line(L_p, I))[1];
pair T_C = intersectionpoints(u_c, line(M_p, I))[1];
pair S = extension(I, O, A, T_A);

draw(S--O);
draw(A--T_A);
draw(u_c, blue);
draw(circle(D, E, F), lightblue);
filldraw(triangle(A, B, C), opacity(0.2)+paleyellow);

dot("$A$", A, dir(110));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$O$", O, dir(0));
dot("$I$", I, dir(-90)*1.3);
dot("$D$", D, dir(-90));
dot("$E$", E, dir(30));
dot("$F$", F, dir(180));
dot("$K$", K, dir(-90));
dot("$L$", L, dir(50));
dot("$M$", M, dir(180));
dot("$T_A$", T_A, dir(-110));
dot("$T_B$", T_B, dir(30));
dot("$T_C$", T_C, dir(180));
dot("$S$", S, dir(180));

/*
    Source: 7.42
    Points: A B C D E F I K L M O S T_A T_B T_C
    Item: A I K
    Item: B I L
    Item: C I M
    Item: D K S
    Item: E L S
    Item: F M S
    Item: B S T_B
    Item: C S T_C
    Item: A E F I
    Item: B D F I
    Item: C D E I

    Text: $I$ is the incenter, $O$ is the circumcenter.
    Text: $\triangle DEF$ is the intouch triangle.
    Text: $T_A$, $T_B$, $T_C$ are the tangency points of respective mixtilinear incircles.
    Text: $K$ is the midpoint of arc $BC$ not containing $A$. Similarly $L$, $M$.
*/
