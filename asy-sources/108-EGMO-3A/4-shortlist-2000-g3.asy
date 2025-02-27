pair A = dir(110);
pair B = dir(210);
pair C = dir(-30);
pair H = A+B+C;
pair O = 0;
pair H_a = 2*foot(H, B, C)-H;
pair H_b = 2*foot(H, C, A)-H;
pair H_c = 2*foot(H, A, B)-H;
pair D = extension(O, H_a, B, C);
pair E = extension(O, H_b, C, A);
pair F = extension(O, H_c, A, B);
pair U = extension(B, E, C, F);

draw(circle(A, B, C), purple);
draw(A--H_a);
draw(B--H_b);
draw(C--H_c);
draw(B--E, grey);
draw(C--F, grey);
filldraw(triangle(A, B, C), opacity(0.2)+paleblue, black+1.1);

dot("$A$", A, dir(110));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$D$", D, dir(-90));
dot("$E$", E, dir(20));
dot("$F$", F, dir(170));
dot("$H$", H, dir(210)*1.4);
dot("$O$", O, dir(0));
dot("$U$", U, dir(90));
dot("$H_a$", H_a, dir(-100));
dot("$H_b$", H_b, dir(30));
dot("$H_c$", H_c, dir(160));

/*
    Source: Shortlist 2000/G3 (3.15)
    Points: A B C D E F H O U H_a H_b H_c
    Item: D O H_a
    Item: E O H_b
    Item: F O H_c
    Item: A D U
    
    Text: $H$ is the orthocenter, $O$ is the circumcenter.
    Text: $H_a$, $H_b$, $H_c$ are the reflection of $H$ wrt the sides.
    Text: $D$, $E$, $F$ are on the sides such that $OD+DH=OE+EH=OF+FH$.
*/
