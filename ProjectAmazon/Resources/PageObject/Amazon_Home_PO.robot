*** Settings ***
Library    SeleniumLibrary    


*** Variables ***
${URL} =  https://www.amazon.com
${SEARCH_BUTTON} =  css=input[value='Go']
${TEXT_BOX} =  id=twotabsearchtextbox

*** Keywords ***
Go to Homepage
    Go To    ${URL}
    
Verify the landing page
    Wait Until Page Contains  Amazon
    
Enter Search Term
    [Arguments]    ${AMAZON_PRODUCTS}
    Input Text    ${TEXT_BOX}    ${AMAZON_PRODUCTS}
    
Click Search Button
    Click Button    ${SEARCH_BUTTON}
    
