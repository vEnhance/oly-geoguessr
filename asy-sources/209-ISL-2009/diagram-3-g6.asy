pair A = dir(120);
pair B_2 = dir(220);
pair B_1 = 0.3*A+0.7*B_2;
pair C_2 = dir(320);
pair C_1 = 0.6*A+0.4*C_2;
pair O_1 = circumcenter(A, B_1, C_1);
pair O_2 = circumcenter(A, B_2, C_2);
pair H_1 = orthocenter(A, B_1, C_1);
pair H_2 = orthocenter(A, B_2, C_2);
pair N_1 = midpoint(O_1--H_1);
pair N_2 = midpoint(O_2--H_2);
pair F_1 = foot(N_1, B_2, C_2);
pair F_2 = foot(N_2, B_1, C_1);
pair S = extension(N_1, F_1, N_2, F_2);

draw(A--B_2--C_2--cycle);
draw(B_1--C_1);
draw(N_1--F_1);
draw(N_2--F_2);
perpfactor *= 0.5;
perpendicularmark(line(N_2, F_2), line(F_2, B_1), quarter=2);
perpendicularmark(line(N_1, F_1), line(F_1, C_2), quarter=2);
draw(circumcircle(A, B_1, C_1), dashed);
draw(circumcircle(A, B_2, C_2), dashed);

dot("$A$", A, dir(A));
dot("$B_2$", B_2, dir(B_2));
dot("$C_2$", C_2, dir(C_2));
dot("$B_1$", B_1, dir(B_1));
dot("$C_1$", C_1, plain.E);
dot("$O_1$", O_1, plain.N);
dot("$O_2$", O_2, plain.SE);
dot("$H_1$", H_1, plain.N);
dot("$H_2$", H_2, plain.SE);
dot("$N_1$", N_1, plain.N);
dot("$N_2$", N_2, plain.SE);
dot("$S$", S, dir(S));

/*
    Source: ISL 2009 G6
    Points: A B_1 B_2 C_1 C_2 O_1 O_2 H_1 H_2 N_1 N_2 S
    Item: O_1 N_1 H_1
    Item: O_2 N_2 H_2
    Item: H_1 S H_2
    Text: $O_i$, $N_i$, $H_i$ denote the circumcenter,
    Text: orthocenter, and nine-point center of triangle $AB_iC_i$
*/
