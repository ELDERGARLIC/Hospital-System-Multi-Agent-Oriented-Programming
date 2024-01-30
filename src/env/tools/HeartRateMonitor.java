package tools;

import cartago.*;

@ARTIFACT_INFO(outports = { @OUTPORT(name = "out-1") })
public class HeartRateMonitor extends Artifact {

    void init(double initialHeartRate){
        defineObsProperty("state","idle");
        defineObsProperty("heart_rate", initialHeartRate);
        log("Heart Rate: "+ getObsProperty("heart_rate").doubleValue());
    }

    @OPERATION void setHeartRate(double heartRate){
        getObsProperty("heart_rate").updateValue(heartRate);
        log("Heart Rate: "+ getObsProperty("heart_rate").doubleValue());
    }

    @OPERATION void startMonitoring(){
        log("startMonitoring");
        getObsProperty("state").updateValue("monitoring");
        this.execInternalOp("updateHeartRateProc", -1.0); // Simulates heart rate changes
    }

    @OPERATION void stopMonitoring(){
        log("stopMonitoring");
        getObsProperty("state").updateValue("idle");
    }

    @INTERNAL_OPERATION void updateHeartRateProc(double step){
        ObsProperty heartRate = getObsProperty("heart_rate");
        ObsProperty state = getObsProperty("state");
        while (!state.stringValue().equals("idle")){
            heartRate.updateValue(heartRate.doubleValue() + step);
            log("Heart Rate: "+ heartRate.doubleValue());
            this.await_time(1000); // Adjust time interval as needed
        }
    }
}



