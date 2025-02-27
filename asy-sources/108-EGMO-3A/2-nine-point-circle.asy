pair A = dir(110);
pair B = dir(210);
pair C = dir(-30);
pair H = A+B+C;
pair O = 0;
pair D = foot(A, B, C);
pair E = foot(B, C, A);
pair F = foot(C, A, B);
pair A_p = -A;
pair B_p = -B;
pair C_p = -C;
pair M = (B+C)/2;
pair N = (C+A)/2;
pair P = (A+B)/2;
pair N_9 = (O+H)/2;
pair X = (A+H)/2;
pair Y = (B+H)/2;
pair Z = (C+H)/2;

filldraw(triangle(A, B, C), opacity(0.2)+paleblue, black+1.1);
draw(circle(A, B, C), purple);
draw(A--D);
draw(B--E);
draw(C--F);
draw(O--H);
draw(A--A_p, dashed);
draw(B--B_p, dashed);
draw(C--C_p, dashed);

dot("$A$", A, dir(110));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$D$", D, dir(-90));
dot("$E$", E, dir(40));
dot("$F$", F, dir(180));
dot("$H$", H, dir(118)*1.5);
dot("$M$", M, dir(-90));
dot("$N$", N, dir(30));
dot("$O$", O, dir(68)*1.5);
dot("$P$", P, dir(180));
dot("$X$", X, dir(0));
dot("$Y$", Y, dir(110));
dot("$Z$", Z, dir(-90));
dot("$A'$", A_p, dir(-50));
dot("$B'$", B_p, dir(30));
dot("$C'$", C_p, dir(150));
dot("$N_9$", N_9, dir(90));

/*
    Source: Nine-Point Circle (3.11)
    Points: A B C D E F H M N O P X Y Z A_p B_p C_p N_9
    Item: D E F M N P X Y Z
    Item: H M A_p
    Item: H N B_p
    Item: H P C_p
    Item: M X N_9
    Item: N Y N_9
    Item: P Z N_9
    Item: A E F H
    Item: B D F H
    Item: C D E H
    Item: B C E F
    Item: C A D F
    Item: A B D E
    Item: A O N P
    Item: B O M P
    Item: C O M N
    
    Text: $H$ is the orthocenter, $O$ is the circumcenter of $\triangle ABC$.
    Text: $D$, $E$, $F$ are the feet. $M$, $N$, $P$ are the side midpoints. $X$, $Y$, $Z$ are the midpoints of $AH$, $BH$, $CH$.
    Text: $N_9$ is the midpoint of $OH$.
    Text: $A'$, $B'$, $C'$ are the respective antipodes.
*/
