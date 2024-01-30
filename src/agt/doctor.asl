/* Initial beliefs and rules */

chosen(W) :- ballots(B) & borda(B,R) & .max(R,count(_,W)).

borda(B,R) :- patients(C) & .length(C,N) & borda_count(B,[],N,R).

borda_count([],R,_,R).
borda_count([V|T],I,N,R) :- count_vote(V,I,1,N,J) & borda_count(T,J,N,R).

count_vote([],R,_,_,R).
count_vote([C|T],L,X,Y,R) :- .member(count(Z,C),L) & .delete(count(Z,C),L,L1) & count_vote(T,[count(Z+(Y-X),C)|L1],X+1,Y,R).
count_vote([C|T],L,X,Y,R) :- count_vote(T,[count((Y-X),C)|L],X+1,Y,R).


 
/* Initial goals */

+!open <- open([patient1,patient2,patient3],[nurse1,nurse2]).
+!close <- .wait(1000); close; !declare_chosen.

+!declare_chosen: chosen(W) <- .print("The chosen patient is: ",W); .send(W,tell,chosen(healthcare_team)).


{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }






