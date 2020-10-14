*** Settings ***
Library  SeleniumLibrary    
Resource    ../Resources/Amazon_KeyWords.robot
Resource    ../Resources/Project_Common.robot        

Test Setup  Project_Common.Launch_Test  googlechrome
Test Teardown    Project_Common.End_Test


*** Keywords ***


*** Variables *** 



*** Test Cases ***  

Verify if Amazon "HomePage" is loaded successfully
    Amazon_KeyWords.Homepage 
    
Verify if Amazon "Product_Search" is successful and results page is loaded
    Amazon_KeyWords.Homepage  
    Amazon_KeyWords.Search for Product    
    
Verify if user is able to select the product by clicking on "ProductName"
    Amazon_KeyWords.Homepage  
    Amazon_KeyWords.Search for Product
    Amazon_KeyWords.Click ProductName   
    
Verify if user is able to select the product by clicking on "ProductImage"
    Amazon_KeyWords.Homepage  
    Amazon_KeyWords.Search for Product
    Amazon_KeyWords.Click ProductImage    
    
Verify if user is able to add the product to "Add product to Shopping Cart" after making the selection by clicking on "Product_Name"
    Amazon_KeyWords.Homepage  
    Amazon_KeyWords.Search for Product   
    Amazon_KeyWords.Click ProductName
    Amazon_KeyWords.Add product to Shopping Cart
    
Verify if user is able to "Add product to Shopping Cart" after making the selection by clicking on "Product_Image"
    Amazon_KeyWords.Homepage  
    Amazon_KeyWords.Search for Product   
    Amazon_KeyWords.Click ProductImage
    Amazon_KeyWords.Add product to Shopping Cart
    
Verify if user is required to "Sign_In" to checkout
    Amazon_KeyWords.Homepage  
    Amazon_KeyWords.Search for Product   
    Amazon_KeyWords.Click ProductName
    Amazon_KeyWords.Add product to Shopping Cart 
    Amazon_KeyWords.Proceed to Checkout


    
    