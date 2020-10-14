*** Settings ***
Library    SeleniumLibrary    



*** Variables ***
${Username_Locator} =    css:#email
${Password_Locator} =    css:#pass
${Login_Button} =    css:button[class='_42ft _4jy0 _6lth _4jy6 _4jy1 selected _51sy']
${ErrorMessage_Locator} =    css:div[class='_4rbf _53ij']
&{Invalid_Credentials}    username=chandler@gmail.com    password=pass    expectederrormessage=The password you’ve entered is incorrect. Forgot Password?   
&{Null_Credentials}    username=    password=    expectederrormessage=The email or phone number you’ve entered doesn’t match any account. Sign up for an account.   
${filepath} =  C:\\Development\\robot-scripts\\ProjectFacebook\\Data\\Login_Data.csv


*** Keywords ***
Go to Facebook Login Page
    Go to    https://www.facebook.com
    
Verify Facebook Login Page
    Wait Until Page Contains    Facebook 
    
Enter Username
    [Arguments]    ${credentials}
    Element Should Be Focused    ${Username_Locator}
    #Input Text      ${Username_Locator}    ${credentials.username}    #buil-in method data
    Input Text      ${Username_Locator}    ${credentials[0]}    #data from csv file
    log    ${credentials[0]}
Enter Password
    [Arguments]    ${credentials}
    #Input Password    ${Password_Locator}    ${credentials.password}
    Input Text      ${Password_Locator}    ${credentials[1]}
    
Click Login Button
    Click Button    ${Login_Button}
    
Verify loaded page
    Wait Until Page Contains    Log Into Facebook
    
Verify error message
    [Arguments]    ${credentials}
    ${errormessage_actual} =    Get Text    ${ErrorMessage_Locator} 
    Log    ${errormessage_actual}
    #Run Keyword If    '${errormessage_actual}'=='${credentials.expectederrormessage}'    Log  Error message present!  
    Run Keyword If    '${errormessage_actual}'=='${credentials[2]}'    Log  Error message present!  
                 
    
Invalid Login Scenarios
    [Arguments]    ${credentials}
    Go to Facebook Login Page
    Verify Facebook Login Page
    Enter Username    ${credentials}
    Enter Password    ${credentials}
    Click Login Button
    Set Selenium Implicit Wait    5s
    #Verify loaded page
    Verify error message    ${credentials}  
    
Login with various credentials
    [Arguments]    ${invalidloginscenarios}
    :FOR  ${loginscenario}  IN  @{invalidloginscenarios}
    \  Go to Facebook Login Page
    \  Verify Facebook Login Page
    \  Enter Username    ${loginscenario}
    \  Enter Password    ${loginscenario}
    \  Click Login Button
    \  Set Selenium Implicit Wait    5s
    \  Verify loaded page
    \  Verify error message    ${loginscenario}
     