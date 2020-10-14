*** Settings ***
Library  SeleniumLibrary    


*** Variables ***
${BUYING_OPTIONS_BUTTON} =  id=buybox-see-all-buying-choices-announce
${ADDTOCART_RESPG} =  css=input[id='add-to-cart-button']
${ADDCART_BUYOPTPG} =  css=#a-autoid-2 > span > input
${BUYVID_LOCATOR} =  css=#tvod-btn-B07PF1FG98-ab > span > button

*** Keywords *** 
Verify Product Description Page
    Wait Until Page Contains    ${AMAZON_PRODUCTS}
     
AddCart_BuyingOpt
    Wait Until Page Contains Element    ${BUYING_OPTIONS_BUTTON}    
    Click Link    ${BUYING_OPTIONS_BUTTON}
    Wait Until Page Contains Element    ${ADDCART_BUYOPTPG}
    ${addtocart_buyoptpg} =  Get WebElement    ${ADDCART_BUYOPTPG}
    Click Link      ${addtocart_buyoptpg}
    Wait Until Page Contains    Added to Cart
    
AddtoCart
    ${addtocart_respg} =  Get WebElement    ${ADDTOCART_RESPG}
    Click Link      ${addtocart_respg}
    Wait Until Page Contains    Added to Cart    
    
Checkout "Video"
    Wait Until Page Contains Element    ${BUYVID_LOCATOR}
    Click Button    ${BUYVID_LOCATOR}
    Wait Until Page Contains    Sign-In            
       
Click "Add to Cart" button 
    ${result} =    Run Keyword And Return Status    Wait Until Page Contains Element    ${BUYING_OPTIONS_BUTTON}
    Log    ${result}
    Run Keyword If    ${result}==True    AddCart_BuyingOpt    
    ...    ELSE IF    ${result}==False   AddtoCart 

Add or Checkout Product
    ${vidloc_sta} =  Run Keyword And Return Status    Wait Until Page Contains Element    ${BUYVID_LOCATOR}        
    Run Keyword If    ${vidloc_sta}==True    Checkout "Video"
    ...    ELSE IF    ${vidloc_sta}==False    Click "Add to Cart" button    

