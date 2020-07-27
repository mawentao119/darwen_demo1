*** Settings ***
*** Variables ***
*** Test Cases ***
Test using KW
    @{list} =    Create List    foo    baz
    ${index} =    Find Index    baz    @{list}
    Should Be Equal    ${index}    ${1}
    ${index} =    Find Index    non existing    @{list}
    Should Be Equal    ${index}    ${-1}

*** Keywords ***
Find Index
    [Arguments]    ${element}    @{items}
    ${index} =    Set Variable    ${0}
    FOR    ${item}    IN    @{items}
        Return From Keyword If    '${item}' == '${element}'    ${index}
        ${index} =    Set Variable    ${index + 1}
    END
    Return From Keyword    ${-1}    # Could also use [Return]

