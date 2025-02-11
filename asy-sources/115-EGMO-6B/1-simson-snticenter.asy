pair A = dir(140);
pair B = dir(200);
pair C = dir(-110);
pair D = dir(-20);
pair H_A = B+C+D;
pair H_B = A+C+D;
pair H_C = A+B+D;
pair H_D = A+B+C;
pair R = (A+B+C+D)/2;
circle u_c = circle(A, B, C);

draw(A--C);
draw(B--D);
draw(u_c, blue);
draw(C--H_C, deepgreen);
draw(A--B--C--D--cycle);

dot("$A$", A, dir(110));
dot("$B$", B, dir(180));
dot("$C$", C, dir(-110));
dot("$D$", D, dir(0));
dot("$H_A$", H_A, dir(-90));
dot("$H_B$", H_B, dir(0));
dot("$H_C$", H_C, dir(90));
dot("$H_D$", H_D, dir(180));
dot("$R$", R, dir(210));

/*
    Source: 6.31
    Points: A B C D R H_A H_B H_C H_D
    Item: A R H_A
    Item: B R H_B
    Item: D R H_D

    Text: $ABCD$ is cyclic.
    Text: $H_D$ is the orthocenter of $\triangle ABC$ and etc.
    Text: $R$ is the midpoint of $CH_C$.
*/
