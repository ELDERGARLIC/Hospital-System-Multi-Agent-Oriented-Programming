
+!vote_patient : my_priorities(V) <- vote(V).

+!treatment_process : medical_condition(X) <- .print("Helping on condition ",X); !send_preference.

+!send_preference(R)
    <-
    -+recipient_agent(R);
    !send_preference;
.

+!send_preference:
    preferred_heart_rate_range(H) &
    recipient_agent(R)
    <-
    .log(warning,"Sending preference for heart rate range ", H);
    .send(R,achieve,add_preference(H));
.

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }








