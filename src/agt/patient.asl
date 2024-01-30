
+chosen(healthcare_team) : .my_name(Me) & play(Me,normal,Org) <-
    .findall(C,play(C,normal,Org),CS);
    ?medical_condition(T);
    .send(CS, tell, medical_condition(T));
	adoptRole(pathological)[artifact_name(Org)]. 
    
+!tell_condition : medical_condition(X) <- .print("I'm having the condition ",X).

+!treatment_process : medical_condition(X) <- .print("I'm getting treatment on condition ",X); !set_heart_rate.

+!set_heart_rate: heart_rate(H) <- .print("My heart rate is ",H); setHeartRate(H);.

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }




