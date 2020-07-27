*** Settings ***
Library  String
Library  OperatingSystem

*** Variables ***
${my var1}  my var 1

*** Keywords ***
Fst第一个关键字
    [Arguments]  ${arg1}
    Log To Console  ${arg1}111
    [Return]  ${arg1}
Second关键字
    Log To Console	 12345
