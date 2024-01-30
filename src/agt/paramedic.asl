
now_is_unsafe_rate(R) :- heart_rate(H) & H > R.

+!heart_rate(R): 
    now_is_unsafe_rate(R) &
    heart_rate(H)
    <-  
    if (not state("monitoring")) {
        startMonitoring;
        .log(warning, H, " is outside safe range -> monitoring until ", R);
    }
    !heart_rate(R);
.

+!heart_rate(R):
    state("monitoring")
    <-  
    stopMonitoring;
    .log(warning,"Heart rate is now within the safe range.");
    !heart_rate(R);
.

+!heart_rate(R)
    <-
    !heart_rate(R);
.

+!add_preference(R)[source(S)]
    <-
    .abolish(preference(S,_));
    +preference(S,R);
    .findall(X,preference(_,X),L);
    .drop_desire(heart_rate(_));
    !heart_rate(math.mean(L));
.

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }



