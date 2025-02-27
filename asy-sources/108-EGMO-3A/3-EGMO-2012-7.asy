pair A = dir(65);
pair B = dir(210);
pair C = dir(-30);
pair H = A+B+C;
pair K = dir(-85);
pair L = 2*foot(K, A, B)-K;
pair M = 2*foot(K, B, C)-K;
circle u_c = circle(A, B, C);
circle c_1 = circle(B, L, M);
pair E = intersectionpoints(u_c, c_1)[1];
pair H_A = 2*foot(H, B, C)-H;
pair H_C = 2*foot(H, A, B)-H;
pair J = extension(B, C, K, H);

draw(H--K);
draw(A--H_A);
draw(C--H_C);
draw(c_1, grey);
draw(u_c, purple);
draw(K--L, dotted);
draw(K--M, dotted);
filldraw(triangle(A, B, C), opacity(0.2)+paleblue, black+1.1);

dot("$A$", A, dir(70));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$E$", E, dir(80));
dot("$H$", H, dir(30));
dot("$J$", J, dir(-60));
dot("$K$", K, dir(-90));
dot("$L$", L, dir(180));
dot("$M$", M, dir(180));
dot("$H_A$", H_A, dir(-60));
dot("$H_C$", H_C, dir(120));

/*
    Source: EGMO 2012/7 (3.14)
    Points: A B C E H J K L M H_A H_C
    Item: E M J H_A
    Item: E L H_C
    Item: H L M
    Item: H K M H_A
    Item: H K L H_C
    Item: B C H M
    Item: A B H L
    
    Text: $H$ is the orthocenter. $K$ lies on $(ABC)$.
    Text: $L$, $M$ are the reflections of $K$ and $H_C$, $H_A$ are the reflections of $H$ wrt $AB$, $AC$.
    Text: $E=(BLM)\cap (ABC)$.  $J=KH\cap BC$.
*/
