*** Settings ***
Library    SeleniumLibrary    


*** Variables ***
${PROCEED_CHECKOUT_BUTTON_CARTPAGE} =  id=hlb-ptc-btn-native
${PROCEED_CHECKOUT_BUTTON_RESPAGE} =  css=#attach-sidesheet-checkout-button > span > input


*** Keywords ***
Checkout from cart page
    ${proceed_chkoutbutton_cartpg} =  Get WebElement    ${PROCEED_CHECKOUT_BUTTON_CARTPAGE}
    Wait Until Page Contains Element    ${proceed_chkoutbutton_cartpg}        
    Click Button    ${proceed_chkoutbutton_cartpg}
    
Checkout from product description page
    ${procedd_chkoutbutton_proddescpg} =  Get WebElement    ${PROCEED_CHECKOUT_BUTTON_RESPAGE}
    Wait Until Page Contains Element    ${procedd_chkoutbutton_proddescpg}     
    Click Button    ${procedd_chkoutbutton_proddescpg} 
    
Verify checkout locator and checkout
    ${chkoutlocator_status} =    Run Keyword And Return Status    Wait Until Page Contains Element    ${PROCEED_CHECKOUT_BUTTON_CARTPAGE}
    Run Keyword If    ${chkoutlocator_status}==True      Checkout from cart page
    ...    ELSE IF    ${chkoutlocator_status}==False     Checkout from product description page

Select the appropriate checkout locator
    ${pagetitle} =  Get Title
    Run Keyword If    '${pagetitle}'=='Amazon.com Shopping Cart'    Checkout from cart page
    ...    ELSE IF    '${pagetitle}'!='Amazon.com Shopping Cart'    Checkout from product description page
    
Click "Proceed Checkout" Button
    ${page_title} =  Get Title
     Run Keyword If    '${page_title}'=='Amazon.com Shopping Cart'     Select the appropriate checkout locator
     ...    ELSE IF    '${page_title}'=='Amazon Sign-In'    Wait Until Page Contains Element    Sign-In


               