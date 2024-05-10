// CArtAgO artifact code for project teste

package example;

import cartago.*;

public class Road extends Artifact {
	void init(int initialValue) {
		defineObsProperty("road", initialValue);
	}

	@OPERATION
	void inc() {
		ObsProperty prop = getObsProperty("road");
		prop.updateValue(prop.intValue()+1);
		signal("tick");
	}

	@OPERATION
	void inc_get(int inc, OpFeedbackParam<Integer> newValueArg) {
		ObsProperty prop = getObsProperty("road");
		int newValue = prop.intValue()+inc;
		prop.updateValue(newValue);
		newValueArg.set(newValue);
	}

}

