*** Settings ***
*** Variables ***
*** Test Cases ***
Test1
    Run Keyword	  Log To Console	我是参数
Test2
    Run Keyword If  ${true}  Log To Console	我是参数
    Run Keyword If  ${false}  Log To Console	我是不应该出现的
Test3
    ${some}=   Set Variable  Log To Console
    Run Keyword If	${true}  ${some}  I'm an argument.
    Run Keyword Unless	${false}  ${some}  I'm an argument too.
*** Keywords ***


