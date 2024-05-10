// Agent bob in project teste

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true
    <- .print("Sou uma van.");
       .date(Y,M,D); .time(H,Min,Sec,MilSec); // get current date & time
       +started(Y,M,D,H,Min,Sec).            // add a new belief
       //!pegar_passageiro.
       //committed(Ag,mPegar_passageiro,Scheme).

+!pegar_passageiro : true
    <- .print("Pegar passageiro na rua").    



{ include("$jacamo/templates/common-cartago.asl") }
{ include("$jacamo/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moise/asl/org-obedient.asl") }

// plans to handle obligations
// obligation to commit to a mission

{ include("$moiseJar/asl/org-obedient.asl") }