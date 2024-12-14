*** Settings ***
Documentation    Tests for Flames
Resource    ../Resources/kw_flames.resource

Suite Setup      kw_flames.Suite Setup
Test Setup      kw_flames.Test Setup

Suite Teardown      kw_flames.Suite Teardown

*** Test Cases ***
Longer First Name
    [Documentation]    Test with the name1 longer than name2
    ${code_result}      kw_flames.Calculate Code Result      Nachiket     Aditi
    ${web_result}      kw_flames.Calculate Web Result      Nachiket     Aditi
    kw_flames.Assert Results      ${code_result}      ${web_result}