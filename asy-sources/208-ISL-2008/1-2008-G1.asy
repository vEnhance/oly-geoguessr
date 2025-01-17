pair A = dir(110);
pair B = dir(208);
pair C = dir(-28);
circle u_c = circle(A, B, C);
pair D = (B+C)/2;
pair E = (C+A)/2;
pair F = (A+B)/2;
pair H = A+B+C;
pair A_1 = D+abs(D-H)*dir(D--B);
pair A_2 = D+abs(D-H)*dir(D--C);
pair B_1 = E+abs(E-H)*dir(E--C);
pair B_2 = E+abs(E-H)*dir(E--A);
pair C_1 = F+abs(F-H)*dir(F--A);
pair C_2 = F+abs(F-H)*dir(F--B);
pair X = 2*foot(H, E, F)-H;
pair Y = 2*foot(H, D, F)-H;
pair Z = 2*foot(H, D, E)-H;

draw(circle(D, abs(D-H)), deepcyan);
draw(circle(E, abs(E-H)), deepcyan);
draw(circle(F, abs(F-H)), deepcyan);
draw(A--B--C--cycle);

dot("$A$", A, dir(110));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$D$", D, dir(-90));
dot("$E$", E, dir(30));
dot("$F$", F, dir(180));
dot("$H$", H, dir(-20));
dot("$A_1$", A_1, dir(-130));
dot("$A_2$", A_2, dir(-50));
dot("$B_1$", B_1, dir(0));
dot("$B_2$", B_2, dir(90));
dot("$C_1$", C_1, dir(120));
dot("$C_2$", C_2, dir(200));
dot("$X$", X, dir(20));
dot("$Y$", Y, dir(130));
dot("$Z$", Z, dir(-10));

/*
    Source: ISL 2008 G1
    Points: A B C D E F X Y Z A_1 A_2 B_1 B_2 C_1 C_2 H
    Item: A X H
    Item: B Y H
    Item: C Z H
    Item: A_1 A_2 B_1 B_2 C_1 C_2
*/
