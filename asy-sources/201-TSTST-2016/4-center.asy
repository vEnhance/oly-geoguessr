pair A=dir(120);
pair B=dir(210);
pair C=dir(330);
pair H=A+B+C;
pair E=extension(B,H,A,C);
pair F=extension(C,H,A,B);
pair N=(B+C)/2;
pair R=extension(E,F,B,C);
pair G=extension(-A,N,A,R);
pair Q=extension(R,H,A,N);
pair M=(A+H)/2;
pair P=extension(G,rotate(90,G)*M,0,M);
pair T=extension(P,N,R,M);

dot("$A$",A,A);
dot("$B$",B,B);
dot("$C$",C,C);
dot("$E$",E,dir(0));
dot("$F$",F,W);
dot("$R$",R,S);
dot("$N$",N,S);
dot("$T$",T,W);
dot("$M$",M,NE);

draw(A--B--C--cycle);
draw(circumcircle(A,B,C)^^circumcircle(A,E,F),dotted);
draw(B--R--E);
draw(arc(N,abs(B-N),-10,190),dotted);
/*
  Source: Center of the circle
  Points: A B C N E F R M T
  Item: R T M
  Item: B T M C
  Item: N E F T M
  Text: In addition to the previous points, we add $M$, the center of $(AEF)$.
*/
