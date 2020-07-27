*** Settings ***
Documentation  自动化模式演示
*** Variables ***
*** Test Cases ***
01关键字驱动
    [Documentation]  关键字驱动加法测试
    ...              DOC2hang
    ...              Doc3hang
    [Tags]   关键字驱动
    ${res}=  取得和  1  2
    Should Be Equal As Integers  ${res}  3 
02数据驱动
    [Tags]   数据驱动
    [Template]  Input ${a} + ${b} Should be out ${c}
    1  2  3
    4  5  9
03验收驱动
    [Tags]  ATDD  BDD
    Given 打开程序
    When 输入 1 + 2
    Then 输出结果 1 + 2 = 3
    
*** Keywords ***
取得和
    [Arguments]  ${a}  ${b}
    ${res}=  Evaluate  ${a}+${b}
    [Return]  ${res}
Input ${a} + ${b} Should be out ${c}
    ${res}=  Evaluate  ${a}+${b}
    Should Be Equal As Integers  ${res}  ${c}
打开程序
    Log To Console  打开被测程序
输入 ${a} + ${b}
    Log To Console  输入 ${a} + ${b}
输出结果 ${a} + ${b} = ${3}
    ${res}=  Evaluate  ${a}+${b}
    Log To Console  ${a} + ${b} = ${res}
