*** Settings ***
documentation    use this layer to manage data from csv file
Library    ../CustomLibrary/login.py

*** Variables ***



*** Keywords ***
Get csv data
    [Arguments]    ${filepath}
    ${data} =  Read Csv File    ${filepath}
    [Return]    ${data}
