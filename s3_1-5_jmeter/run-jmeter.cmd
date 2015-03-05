 rem --------- Invoke JMeter Test via JMeter GUI  -------------------------

rem C:\source\gitHub-ScholasticInc\soa-s3-consumers\testing\qa\s3_1-5_jmeter\src\test\jmeter\services
rem   -Jjmeter.save.saveservice.output_format=xml

rem jmeter -t .\src\test\jmeter\testcases\v1-2\S3_v1-2_tc_getversion_text-plain.jmx  -l .\target\jmeter\results\t.jtl  -j .\target\jmeter\logs\S3_v1-2_tc_getversion_text-plain.log  -q .\src\test\jmeter\jmeter.properties
rem jmeter -t .\src\test\jmeter\testcases\v1-2\S3_v1-2_tc_getversion_text-xml.jmx  -l .\target\jmeter\results\S3_v1-2_tc_getversion_text-xml.jtl  -j .\target\jmeter\logs\S3_v1-2_tc_getversion_text-xml.log  -q .\src\test\jmeter\jmeter.properties
rem jmeter -t .\src\test\jmeter\testcases\v1-2\S3_v1-2_tc_getversion_text-html.jmx  -l .\target\jmeter\results\S3_v1-2_tc_getversion_text-html.jtl  -j .\target\jmeter\logs\S3_v1-2_tc_getversion_text-html.log  -q .\src\test\jmeter\jmeter.properties
rem jmeter -t .\src\test\jmeter\testcases\v1-2\S3_v1-2_tc_getversion_application-xml.jmx  -l .\target\jmeter\results\S3_v1-2_tc_getversion_application-xml.jtl  -j .\target\jmeter\logs\S3_v1-2_tc_getversion_application-xml.log  -q .\src\test\jmeter\jmeter.properties
rem jmeter -t .\src\test\jmeter\testcases\v1-2\S3_v1-2_tc_getversion_application-json.jmx  -l .\target\jmeter\results\S3_v1-2_tc_getversion_application-json.jtl  -j .\target\jmeter\logs\S3_v1-2_tc_getversion_application-json.log  -q .\src\test\jmeter\jmeter.properties
rem jmeter -t .\src\test\jmeter\services\S3_v1-2_svc_GET-getversion.jmx  -l .\target\jmeter\results\S3_v1-2_svc_GET-getversion.jtl  -j .\target\jmeter\logs\S3_v1-2_svc_GET-getversion.log  -q .\src\test\jmeter\jmeter.properties

rem jmeter -t .\src\test\jmeter\services\S3_v1-2_svc_GET-getstatus.jmx  -l .\target\jmeter\results\S3_v1-2_svc_GET-getstatus.jtl  -j .\target\jmeter\logs\S3_v1-2_svc_GET-getstatus.log  -q .\src\test\jmeter\jmeter.properties
jmeter -t .\src\test\jmeter\testcases\v1-2\S3_v1-2_tc_getstatus_text-plain.jmx  -l .\target\jmeter\results\S3_v1-2_tc_getstatus_text-plain.jmx.jtl  -j .\target\jmeter\logs\S3_v1-2_tc_getstatus_text-plain.log  -q .\src\test\jmeter\jmeter.properties
rem jmeter -t .\src\test\jmeter\testcases\v1-2\S3_v1-2_tc_getstatus_text-html.jmx  -l .\target\jmeter\results\S3_v1-2_tc_getstatus_text-html.jmx.jtl  -j .\target\jmeter\logs\S3_v1-2_tc_getstatus_text-html.log  -q .\src\test\jmeter\jmeter.properties

rem jmeter -t .\src\test\jmeter\testcases\v1-2\S3_v1-2_tc_executesamcommand-s3id-command_application-json_connected-guid_contactcentral-command.jmx -q jmeter.properties  

rem ${__property(propurl,url,null)}
rem ${__property(propport,port,null)}
rem ${__property(proptimeout,timeout,null)}
rem ${__property(httpcode,httpcode,null)}