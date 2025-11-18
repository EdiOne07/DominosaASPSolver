%GUESS
%Express each cell is paired with exactly one adjacent cell
adj(R,C,R1,C) :- cell(R,C,_) ,R1=R+1,cell(R1,C,_). 
adj(R,C,R,C1) :-cell(R,C,_), C1=C+1, cell(R,C1,_). 
{pair(R1,C1,R2,C2):adj(R1,C1,R2,C2)}=1 :-cell(R1,C1). % for each cell, we pick exactly one adjacent cell
pair(R2,C2,R1,C1):-pair(R1,C1,R2,C2).
% CHECK
% You need to check that all dominos are covered by some pair/4 atom in the solution.
% A domino is defined by two numbers (N1,N2) with N2 >= N. These numbers must not be hard-coded, but 
domino(N1,N2) :- N1<=N2,cell(_,_,N1), cell(_,_,N2).
covered(N1,N2) :-pair(X1,Y1,X2,Y2), cell(X1,Y1,N1), cell(X2,Y2,N2), N1<=N2.
:- domino(N1,N2), not covered(N1,N2).
% #show pair/4.

