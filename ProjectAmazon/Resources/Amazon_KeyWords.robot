*** Settings ***
Library  SeleniumLibrary
Resource    PageObject/Amazon_Home_PO.robot
Resource    PageObject/Amazon_ProdSchRes_PO.robot
Resource    PageObject/Amazon_ProdDesc_PO.robot
Resource    PageObject/Amazon_CartPO.robot


*** Variables ***

${AMAZON_PRODUCTS} =  mustang

*** Keywords ***  
Homepage
    Amazon_Home_PO.Go to Homepage
    Amazon_Home_PO.Verify the landing page
         
Search for Product
    Amazon_Home_PO.Enter Search Term  ${AMAZON_PRODUCTS}
    Amazon_Home_PO.Click Search Button  
    Amazon_ProdSchRes_PO.Verify the results page    ${AMAZON_PRODUCTS}
    
Click ProductName 
    Amazon_ProdSchRes_PO."Product_Name"
    Amazon_ProdDesc_PO.Verify Product Description Page
    
Click ProductImage
    Amazon_ProdSchRes_PO."Product_Image"  
    Amazon_ProdDesc_PO.Verify Product Description Page
        
Add product to Shopping Cart
     Amazon_ProdDesc_PO.Add or Checkout Product
     
Proceed to Checkout
    Amazon_CartPO.Click "Proceed Checkout" Button
         
            
          
    