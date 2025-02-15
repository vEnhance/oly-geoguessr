pair A = dir(120);
pair B = dir(215);
pair C = dir(-35);
circle u_c = circle(A, B, C);
pair I = incenter(A, B, C);
pair D = foot(I, B, C);
pair E = 2*I-D;
pair N_a = dir(-90);
pair I_a = 2*N_a-I;
pair X = foot(I_a, B, C);
pair T_1 = foot(I_a, A, B);
pair T_2 = foot(I_a, C, A);
pair Y = 2*I_a-X;
pair K = foot(A, B, C);
pair M = (A+K)/2;

draw(A--K, grey);
draw(X--Y, grey);
draw(D--E, grey);
draw(A--I_a, dotted);
draw(A--B--C--cycle);
draw(B--T_1, dotted);
draw(C--T_2, dotted);
draw(circle(I, abs(I-D)), deepcyan);
draw(circle(I_a, abs(I_a-X)), dotted+deepcyan);

dot("$A$", A, dir(110));
dot("$B$", B, dir(180));
dot("$C$", C, dir(0));
dot("$I$", I, dir(0));
dot("$D$", D, dir(-90));
dot("$E$", E, dir(90));
dot("$X$", X, dir(90));
dot("$I_A$", I_a, dir(0));
dot("$Y$", Y, dir(-90));
dot("$K$", K, dir(-90));
dot("$M$", M, dir(0));

/*
    Source: Midpoint of Altitudes (4.14)
    Points: A B C D E I K M I_a X Y
    Item: A E X
    Item: M I X
    Item: M D I_a
    Item: A D Y

    Text: $I$ is the incenter, $I_a$ is $A$-excenter.
    Text: $E$ is the antipode of $D$ wrt incircle, $Y$ is the antipose of $X$ wrt the excircle.
    Text: $K$ is the foot of $A$ and $M$ is the midpoint of $AK$.
*/
