WSO2 Integration Control Plane
======================================================================

Welcome to the Integration Control plane 1.0.0 for WSO2 Micro Integrator 4.3.0.
This is a lightweight UI server that hosts a React application which is used to monitor the Micro Integrator runtime & ballerina services.

Configure the MI servers
======================================================================
To connect the MI servers with the dashboard, add the following configuration to the deployment.toml file (stored in the <MI_HOME>/conf/ folder) of each server instance.

[dashboard_config]
dashboard_url = "https://{hostname/ip}:{9743}/dashboard/api/"

More information regarding the dashboard configurations can be found at
(https://mi.docs.wso2.com/en/latest/observe-and-manage/working-with-monitoring-dashboard/)

Running the Integration Control Plane
======================================================================
1. Go to the ICP_HOME/bin directory and run the dashboard.sh file for Linux and Unix or the dashboard.bat file for Windows.
2. Access the dashboard login page found at https://localhost:9743/login

Known issues of WSO2 Micro Integrator 4.3.0
======================================================================

     - https://github.com/wso2/micro-integrator/issues

Support
======================================================================

WSO2 Inc. offers a variety of development and production support
programs, ranging from Web-based support up through normal business
hours, to premium 24x7 phone support.

For additional support information please refer to http://wso2.com/support/

For more information on WSO2 Micro Integrator, visit the GitHub page (https://github.com/wso2/micro-integrator)

--------------------------------------------------------------------------------
(c) Copyright 2021 WSO2 Inc.