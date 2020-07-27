*** Settings ***
Documentation   自动化模式演示

*** Variables ***

*** Test Cases ***
my新测试用例1
  [Documentation]  关键字驱动加法测试
  [Tags]  关键字驱动  HAND  Tag123
  ${res}=  取得和  1  2
  Should Be Equal As Integers  ${res}  3
  ${res}=  取得和  1  2
  
my新测试用例901
  [Documentation]  关键字驱动加法测试
  [Tags]  关键字驱动  HAND  Tag123
  ${res}=  取得和  1  2
  Should Be Equal As Integers  ${res}  3
  ${res}=  取得和  1  2
  
my新测试用例902
  [Documentation]  关键字驱动加法测试
  [Tags]  关键字驱动  HAND  Tag123
  ${res}=  取得和  1  2
  Should Be Equal As Integers  ${res}  3
  ${res}=  取得和  1  2

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
