 *** Settings ***
Resource    ../Resources/Common.robot
Resource    ../Resources/FacebookKeywords.robot
Resource    ../Resources/datamanager.robot

Test Setup    Common.Begin Test    googlechrome
Test Teardown    Common.End Test


*** Test Cases ***
#Verify if Facebook Login Page is loaded
    #FacebookKeywords.Go to Facebook Login Page
    #FacebookKeywords.Verify Facebook Login Page
    
#Verify the error messages displayed for various login scenarios with invalid credentials
    #[Template]    Invalid Login Scenarios
    #${Invalid_Credentials}
    #${Null_Credentials}
    
Verify error messages
    ${invalidloginscenarios} =  datamanager.Get csv data    ${filepath}
    Log    ${invalidloginscenarios}
    FacebookKeywords.Login with various credentials    ${invalidloginscenarios}