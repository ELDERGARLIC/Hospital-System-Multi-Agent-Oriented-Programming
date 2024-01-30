package tools;

import java.util.List;
import java.util.ArrayList;

import cartago.*;
import jason.asSyntax.ASSyntax;
import jason.asSyntax.ListTerm;
import jason.asSyntax.parser.ParseException;

public class PatientCareSystem extends Artifact {

	List<String> voters;
	List<Object[]> result = new ArrayList<Object[]>();

    public void init() {
        defineObsProperty("status", "closed");
    }

	@OPERATION public void open(Object[] patients, Object[] voters) {
        this.voters  = new ArrayList<String>();

		ListTerm cs = ASSyntax.createList();
		for (Object o: patients)
			try {
				cs.add(ASSyntax.parseTerm(o.toString()));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		for (Object o: voters)
			this.voters.add(o.toString());

		defineObsProperty("patients", cs);
        getObsProperty("status").updateValue("open");

	}

	@OPERATION void vote(Object[] vote) {
        if (getObsProperty("status").getValue().equals("close")) {
            failed("the voting machine is closed!");
        }
		if (voters.remove(getCurrentOpAgentId().getAgentName())) {
				result.add(vote);
		} else {
			failed("you voted already!");
		}
	}

    @OPERATION void close() {
		ListTerm final_result = ASSyntax.createList();
		for (Object[] i: result) {
			ListTerm l = ASSyntax.createList();
			for (Object j : i) {
				try {	
					l.add(ASSyntax.parseTerm(j.toString()));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			final_result.add(l);
		}
        getObsProperty("status").updateValue("closed");
		defineObsProperty("ballots", final_result);
	}

}



