*** Settings ***
Resource  ../resource/DemoTest.resource 
#Variables  ../resource/MyObject.py

*** Variables ***


*** Test Cases ***
Test res
    ${v}=  Fst第一个关键字  abc
    Log To Console  ${v} 
Test String
    ${string} =    Set Variable    abc
    Log To Console    ${string.upper()}      # Logs 'ABC'
    Log To Console   ${string * 2}          # Logs 'abcabc'
Test Variable
    #Log To Console    ${OBJECT.name}
    #Log To Console    ${OBJECT.eat('Cucumber')}
    Log To Console    ${DICTIONARY[2]}
Second关键字Test
    Second关键字
    Fst第一个关键字	[arg1]
    Fst第一个关键字	[arg1]


*** Keywords ***

