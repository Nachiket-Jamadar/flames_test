*** Settings ***
Documentation    xpaths for use in web result calculation

*** Variables ***
&{xpaths}      name1=myn1
...      name2=myn2
...      calculate_button=//input[@onclick='calculate1();']
...      result=//*[@id="myresult1"]/fieldset/p[1]/img
