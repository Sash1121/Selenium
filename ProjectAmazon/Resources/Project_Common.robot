*** Settings ***
Library  SeleniumLibrary    


*** Variables ***
&{Browsers}  googlechrome=Chrome  mozillafirefox=ff  


*** Keywords ***

Launch_Test
    [Arguments]  ${Browser}
    #${driver} =  Create Webdriver   Chrome    
    Open Browser    about:blank  ${Browsers.${BROWSER}}
    Maximize Browser Window
    
End_Test
    Close Browser