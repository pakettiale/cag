
printWidth = 150

R = QQ[x,y,MonomialOrder=>GRevLex];
f = x^7*y^2+x^3*y^2-y+1;
x1 = x*y^2-x;
x2 = x - y^3;
polys = new MutableList from {x1, x2};
a = new MutableList from {0, 0};
r = 0;
p=f;
while p != 0 do (
  i = 0;
  divDone = false;
  while i < #polys and divDone == false do (
    if leadTerm(p)//leadTerm(polys#i) != 0 then (
      a#i = a#i+leadTerm(p)//leadTerm(polys#i);
      p = p-(leadTerm(p)//leadTerm(polys#i))*(polys#i);
      divDone = true;
    ) else (
      i = i+1;
    )
  );
  if divDone == false then (
    r = r+leadTerm(p);
    p = p-leadTerm(p);
  )
);

peek(a)
r
polys#1*a#1+polys#0*a#0+r == f
