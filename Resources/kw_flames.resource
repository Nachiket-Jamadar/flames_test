*** Settings ***
Documentation    Keywords for flames tests
Resource    locators.resource
Library    SeleniumLibrary
Library    FlamesLibrary
Library    String

*** Keywords ***
Suite Setup
    [Documentation]    Open The Website in Chrome
    Open browser    https://www.mymathtables.com/calculator/fun/F-L-A-M-E-S-calculator.html      Chrome

Test Setup
    [Documentation]    Clear the input fields and verify if they are cleared
    Clear element text      ${xpaths}[name1]
    Clear element text      ${xpaths}[name2]
    Click element    ${xpaths}[calculate_button]
    Alert should be present    Enter Your and Your Partner Name      ACCEPT

Calculate Code Result
    [Documentation]    Calculates the flames result using python code
    [Arguments]    ${name1}      ${name2}
    ${code_result}      Find Code Relation      ${name1}      ${name2}
    RETURN    ${code_result}

Calculate Web Result
    [Documentation]    Calculates the flames result using website
    [Arguments]    ${name1}      ${name2}
    Input text    ${xpaths}[name1]    ${name1}
    Input text    ${xpaths}[name2]    ${name2}
    Click element    ${xpaths}[calculate_button]
    Wait until element is visible    ${xpaths}[result]
    ${res_img_nm}     Get element attribute    ${xpaths}[result]      src
    ${res_img_nm}     Fetch from right    ${res_img_nm}    /
    ${code_result}     Fetch from left    ${res_img_nm}    .
    RETURN    ${code_result}

Assert Results
    [Documentation]    Compare the results and pass if same
    [Arguments]    ${code_result}      ${web_result}
    ${code_result}      Convert to lower case    ${code_result}
    Should be equal    ${code_result}      ${web_result}

Suite Teardown
    [Documentation]    Close the Browser
    Close all browsers


