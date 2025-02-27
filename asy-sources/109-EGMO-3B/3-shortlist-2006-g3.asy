pair A = dir(70);
pair C = dir(225);
pair D = dir(-45);
pair H = A+C+D;
pair M = (C+D)/2;
pair P = foot(H, A, M);
circle u_c = circle(A, C, D);
circle c_1 = circle(A, P, C);
circle c_2 = circle(A, P, D);
line tangent1 = tangent(u_c, C);
line tangent2 = tangent(u_c, D);
real angle1 = sharpdegrees(line(A, C), line(A, D));
pair C_p = rotate(-angle1, A)*C;
pair D_p = rotate(angle1, A)*D;
pair B = intersectionpoint(tangent1, line(A, C_p));
pair E = intersectionpoint(tangent2, line(A, D_p));

draw(A--C);
draw(A--D);
draw(B--D, dotted);
draw(C--E, dotted);
filldraw(A--B--C--D--E--cycle, opacity(0.2)+paleblue, black+1.1);

dot("$A$", A, dir(70));
dot("$B$", B, dir(180));
dot("$C$", C, dir(-110));
dot("$D$", D, dir(-80));
dot("$E$", E, dir(0));
dot("$M$", M, dir(-90));
dot("$P$", P, dir(70));

/*
    Source: Shortlist 2006/G3 (3.19)
    Points: A B C D E M P
    Item: A M P
    Item: A B C P
    Item: A D E P
    
    Text: $\angle BAC=\angle CAD=\angle DAE$.
    Text: $\angle ABC=\angle ACD=\angle ADE$.
    Text: $P=BD\cap CE$, $MC=MD$.
*/
