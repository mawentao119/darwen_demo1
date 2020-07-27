*** Settings ***

*** Variables ***

*** Test Cases ***
1Testdir11
    [Tags]    333    111
    Log    dir1 case11

2Testdir11
    [Tags]    222
    Log    dir1 case2

3Testlog
    [Tags]    ${EMPTY}
    Log    Dir

*** Keywords ***
