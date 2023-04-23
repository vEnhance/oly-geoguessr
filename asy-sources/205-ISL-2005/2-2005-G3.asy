pair excenter(pair A=(0,0), pair B=(0,0), pair C=(0,0))
{ 
    pair P,Q; 
    P=rotate(-1*((angle(A-B)-angle(C-B))*90/pi+90),B)*A; 
    Q=rotate((angle(B-C)-angle(A-C))*90/pi+90,C)*A; 
    return extension(B,P,C,Q);
}

pair A = (0.8,3);
pair D = origin;
pair C = (4,0);
pair B = A + C;
pair X = extension(B,C,A,A+dir(-55));
pair Y = extension(D,C,A,A+dir(-55));

pair K = excenter(A,X,B);
pair L = excenter(A,D,Y);

pair S = extension(A,L,B,C);
pair T = extension(A,K,D,C);

pair Lfoot = foot(L,C,D);
pair Kfoot = foot(K,B,C);

draw(Circle(L,abs(L-Lfoot)));
draw(Circle(K,abs(K-Kfoot)));

draw(T--D--A--B--S);
draw(A--2*X-A);
draw(A--2*D-A);
draw(A--2*B-A);
draw(A--K);
draw(A--S);

dot(A^^B^^C^^D^^T^^S^^K^^L^^X^^Y);
label("$A$",A,dir(120));
label("$B$",B,dir(30));
label("$C$",C,dir(-50));
label("$D$",D,dir(-160));
label("$Y$",Y,dir(70));
label("$K$",K,E);
label("$L$",L,W);
label("$T$",T,dir(-120));
label("$X$",X,dir(100));
label("$S$",S,dir(-90));

/*
Source: Shortlist 2005 G3
Points: A B C D K L T S X Y
Item: A D L T
Item: A B K S
Item: S L C K T

Text: $ABCD$ is a parallelogram.
Text: $AX$ is an arbitrary line.
*/