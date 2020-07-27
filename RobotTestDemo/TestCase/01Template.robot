*** Settings ***
Documentation  This is do
Library  String
*** Variables ***
@{animals}  dog  cat  鸡  恐龙  冠状病毒

*** Test Cases ***
游园小记
    [Documentation]  假期的一天 
    [Template]  有一只${animal}走了过来   #我的注释top
    FOR  ${i}  IN  @{animals}
        ${i}
    END
    
尾声
    ${action}=  What To Do    #我的注释1
    Log To Console  后来我们 ${action} ...  #我的注释2
    Should Be Equal As Strings	 ${action}  Run back home
*** Keywords ***
有一只${animal}走了过来
    Log To Console  老公，来了一只${animal}
What To Do
    [return]   Run back home
    