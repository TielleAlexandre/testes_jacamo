// Agent bob in project teste

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true
    <- .print("Sou o táxi.");
       .date(Y,M,D); .time(H,Min,Sec,MilSec); // get current date & time
       +started(Y,M,D,H,Min,Sec);           // add a new belief
       .wait(10000);
       !buscar_passageiro.


+!buscar_passageiro : true
    <- .print("Passageiro embarcou no táxi.").    


{ include("$jacamo/templates/common-cartago.asl") }
{ include("$jacamo/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moise/asl/org-obedient.asl") }

// plans to handle obligations
// obligation to commit to a mission
+obligation(Ag,Norm,committed(Ag,Mission,Scheme),Deadline)[artifact_id(ArtId),workspace(_,W)]
    : .my_name(Ag)
   <- .random(R);
      .wait(R*100);
      !commit(Mission,Scheme,W).

+!commit(Mission, Scheme, WorkspaceId) 
   : obligation(Ag,Norm,committed(Ag,Mission,Scheme),Deadline)[artifact_id(ArtId),workspace(_,W)]
     & .my_name(Ag)
   <- .print("I am obliged to commit to ",Mission," on ",Scheme,"... doing so");
      commitMission(Mission)[artifact_name(Scheme), wid(W)].
     
+!commit(Mission, Scheme, WorkspaceId).     

{ include("$moiseJar/asl/org-obedient.asl") }