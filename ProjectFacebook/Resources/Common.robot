*** Settings ***
Library    SeleniumLibrary    


*** Variables ***
&{Browsers}  googlechrome=Chrome  mozillafirefox=ff


*** Keywords ***
Begin Test
    [Arguments]    ${Browser}
    Open Browser    about:blank  ${Browsers.${Browser}} 
    Maximize Browser Window 
    
End Test
    Close Browser  