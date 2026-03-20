// Legacy olympiad.asy command
real markscalefactor = 0.03;
picture pathticks(path g, int n=1, real r=.5, real spacing=6, real s=8, pen p=currentpen)
{
    picture pict;
    pair A,B,C,direct;
    real t,l=arclength(g), space=spacing*markscalefactor, halftick=s*markscalefactor/2, startpt;
    if (n>0)
    {
        direct=unit(dir(g,arctime(g,r*l)));
        startpt=r*l-(n-1)/2*space;
        for (int i=0; i<n; ++i)
        {
            t=startpt+i*space;
            B=point(g,arctime(g,t))+(0,1)*halftick*direct;
            C=B+2*(0,-1)*halftick*direct;
            draw(pict,B--C,p);
        }
    }
    return pict;
}

pair A = dir(110);
pair B = dir(210);
pair C = dir(330);
dot("$A$", A, A);
dot("$B$", B, B);
dot("$C$", C, C);
draw(A--B--C--cycle);

pair H = A+B+C;

pair bisect(pair X, pair Y, int n=2, real r=0.5, real spacing=4, real s=1, pen p=currentpen) {
	pair M = midpoint(X--Y);
	add(pathticks(X--M, n, r, spacing, s, p));
	add(pathticks(Y--M, n, r, spacing, s, p));
	return M;
}

dot("$H$", H, 2*dir(65));
pair X = 2*foot(A,B,C)-H;
dot("$X$", X, dir(-135));
pair Y = 2*midpoint(B--C)-H;
dot("$Y$", Y, dir(-45));
draw(A--X);
draw(H--Y);
bisect(H,X,1);
bisect(H,Y,2);
draw(B--foot(B,A,C));
draw(C--foot(C,A,B));
dot(foot(A,B,C));
dot(midpoint(B--C));

pair O = origin;
dot("$O$", O, dir(45));

/*
  Source: Orthocenter Reflection
  Points: A B C H X Y O
  Item: A B C X Y
  Item: A O Y
  Text: Points $H$ and $O$ are as usual, and $X$ and $Y$ are reflections as shown.
*/
