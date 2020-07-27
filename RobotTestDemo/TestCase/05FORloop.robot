*** Settings ***
*** Variables ***
@{NUMBERS}      ${1}    ${2}    ${5}
@{NAMES}        one     two     five

*** Test Cases ***
Iterate over two lists manually
    ${length}=    Get Length    ${NUMBERS}
    FOR    ${idx}    IN RANGE    ${length}
        Log To Console    ${NUMBERS}[${idx}] name: ${NAMES}[${idx}]
    END

For-in-zip
    FOR    ${number}    ${name}    IN ZIP    ${NUMBERS}    ${NAMES}
        Log To Console    ${number} name: ${name}
    END
Only upper limit
    [Documentation]    Loops over values from 0 to 9
    FOR    ${index}    IN RANGE    10
        Log    ${index}
    END

Start and end
    [Documentation]    Loops over values from 1 to 10
    FOR    ${index}    IN RANGE    1    11
        Log    ${index}
    END

Also step given
    [Documentation]    Loops over values 5, 15, and 25
    FOR    ${index}    IN RANGE    5    26    10
        Log    ${index}
    END

Negative step
    [Documentation]    Loops over values 13, 3, and -7
    FOR    ${index}    IN RANGE    13    -13    -10
        Log    ${index}
    END

Arithmetic
    [Documentation]    Arithmetic with variable
    ${var}=  Set Variable  3
    FOR    ${index}    IN RANGE    ${var} + 1
        Log    ${index}
    END

Float parameters
    [Documentation]    Loops over values 3.14, 4.34, and 5.54
    FOR    ${index}    IN RANGE    3.14    6.09    1.2
        Log    ${index}
    END
For-in-enumerate with two values per iteration
    FOR    ${index}    ${en}    ${fi}    IN ENUMERATE
    ...    cat      kissa
    ...    dog      koira
    ...    horse    hevonen
        Log To Console    "${en}" in English is "${fi}" in Finnish (index: ${index})
    END
Exit Example
    ${text} =    Set Variable    ${EMPTY}
    FOR    ${var}    IN    one    two
        Run Keyword If    '${var}' == 'two'    Exit For Loop
        ${text} =    Set Variable    ${text}${var}
    END
    Should Be Equal    ${text}    one   
Continue Example
    ${text} =    Set Variable    ${EMPTY}
    FOR    ${var}    IN    one    two    three
        Continue For Loop If    '${var}' == 'two'
        ${text} =    Set Variable    ${text}${var}
    END
    Should Be Equal    ${text}    onethree
Example Repeate 
    Repeat Keyword    5    Log To Console  I'm repeated.
