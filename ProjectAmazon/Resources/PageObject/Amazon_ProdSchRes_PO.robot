*** Settings ***
Library  SeleniumLibrary    


*** Variables ***
#${PROD_IMAGE_LOCATOR} =    css:img[class='s-image']    #Basic
${PROD_IMAGE_LOCATOR} =    css=div[class='a-section a-spacing-medium']>span>a    #AbsolutePath
#${PROD_NAME_LOCATOR} =     css=a[class='a-link-normal a-text-normal']    #Basic
${PROD_NAME_LOCATOR} =     xpath=//div[@class='a-section a-spacing-none a-spacing-top-small']/h2/a    #AbsolutePath

*** Keywords ***    
Verify the results page
    [Arguments]    ${AMAZON_PRODUCTS}
    Wait Until Page Contains    results for "${AMAZON_PRODUCTS}"
    
"Product_Name"          
    Click Link  ${PROD_NAME_LOCATOR}
        
    
"Product_Image"
    ${prodimage_locator} =  Get WebElement    ${PROD_IMAGE_LOCATOR}
    Wait Until Element Is Visible    ${PROD_IMAGE_LOCATOR}       
    Click Element    ${prodimage_locator}
    
    
"Product"
    [Arguments]    ${AMAZON_Products}
    ${prodlocator_result} =    Run Keyword And Return Status    Page Should Contain Element    ${PROD_NAME_LOCATOR}        
    Log    ${prodlocator_result}
    Run Keyword If    ${prodlocator_result}==True    "Product_Name"  
    ...  ELSE IF   ${prodlocator_result}==False      "Product_Image"
        
