
import java.io.File;
import java.io.FileInputStream;

import org.apache.jmeter.engine.StandardJMeterEngine;
import org.apache.jmeter.reporters.ResultCollector;
import org.apache.jmeter.reporters.Summariser;
import org.apache.jmeter.save.SaveService;
import org.apache.jmeter.util.JMeterUtils;
import org.apache.jorphan.collections.HashTree;

public class JMeterFromExistingJMX {

    public static void main(String[] argv) throws Exception {
        // JMeter Engine
        StandardJMeterEngine jmeter = new StandardJMeterEngine();

        String slash = System.getProperty("file.separator");
        
        String jMeterHome = "/dev-tools/jakarta-jmeter-2.5.1";
        //String jMeterScriptName = "./src/test/jmeter/services/" + "S3_v1-2_svc_GET-getstatus" + ".jmx";
        //String jMeterScriptName = "ForEachTest2.jmx";
        String jMeterScriptName = "S3_v1-2_svc_GET-getstatus.jmx";
       
        // Initialize Properties, logging, locale, etc.
        JMeterUtils.loadJMeterProperties("./src/test/jmeter/jmeter.properties");
        JMeterUtils.setJMeterHome(jMeterHome);
        //JMeterUtils.initLogging();// you can comment this line out to see extra log messages of i.e. DEBUG level
        JMeterUtils.initLocale();

        // Initialize JMeter SaveService
        SaveService.loadProperties();

        // Load existing .jmx Test Plan
        FileInputStream in = new FileInputStream( jMeterScriptName );
        //FileInputStream in = new FileInputStream("S3_v1-2_svc_GET-getstatus.jmx");
        //FileInputStream in = new FileInputStream("./src/test/jmeter/services/" + jMeterScriptName + ".jmx");
        HashTree testPlanTree = SaveService.loadTree(in);        
        in.close();
        
        //add Summarizer output to get test progress in stdout like:
        // summary =      2 in   1.3s =    1.5/s Avg:   631 Min:   290 Max:   973 Err:     0 (0.00%)
        Summariser summer = null;
        String summariserName = JMeterUtils.getPropDefault("summariser.name", "summary");
        //System.out.println("summariserName : " + summariserName); 
        if (summariserName.length() > 0) {
          summer = new Summariser(summariserName);
          //System.out.println("summer.getName() " + summer.);          
        }

        // Store execution results into a .jtl file
        String logFile = "." + "/" + jMeterScriptName + ".jtl";
        ResultCollector logger = new ResultCollector(summer);
        logger.setFilename(logFile);
        System.out.println("testPlanTree : " + testPlanTree.getArray().length);
        testPlanTree.add(testPlanTree.getArray()[0], logger);       
       
        // Run JMeter Test
        jmeter.configure(testPlanTree);
        jmeter.run();

        System.out.println("Test completed. See " + "." + "/" + jMeterScriptName + ".jtl file for results");
        System.out.println("JMeter .jmx script is available at " + jMeterHome + "/" + jMeterScriptName );
        
        //File outputFile = new File(logFile);
        //int millisPerBucket = 500;
        //JMeterSummary myJMeterSummary = new JMeterSummary(outputFile,millisPerBucket);
        //myJMeterSummary.run();
        //myJMeterSummary.printUsage();
        
        System.exit(0);

        
    }
}