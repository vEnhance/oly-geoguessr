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
dot("$G$",G,G);
dot("$Q$",Q,SE);
dot("$R$",R,S);
dot("$N$",N,S);
dot("$P$",P,NW);
dot("$T$",T,dir(0));

draw(A--B--C--cycle);
draw(circumcircle(A,B,C)^^circumcircle(A,E,F),dotted);
draw(A--N^^B--R--E);draw(P--A^^P--G);

/*
  Source: Two new points
  Points: A B C N Q G P R T
  Item: P T N
  Item: R G T Q N
  Item: A G R
  Text: In the same diagram as before, $PA$ and $PG$ are tangents to $(AEFGQ)$, and $T$ is the inverse of $R$ with respect to that circle.
*/
