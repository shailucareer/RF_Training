*** Settings ***
Library    SeleniumLibrary
Library    Collections


*** Test Cases ***
Element Current State
    Open Browser    https://www.google.com  chrome  alias=A
    ${at}   Get Dom Attribute    q    role
    Log    ${at}
    ${at}   Get Dom Attribute    q    style
    Log    ${at}
    ${at}   Evaluate    type(${at})
    Log    ${at}
    ${at}    Get Element Attribute    SIvCob    textContent
    Log    ${at}
    ${at}    Get Element Attribute    SIvCob    innerHTML
    Log    ${at}
    ${at}    Get Element Attribute    SIvCob    outerHTML
    Log    ${at}
    ${at}    Get Dom Attribute    SIvCob    textContent
    Log    ${at}
    ${at}    Get Dom Attribute    SIvCob    innerHTML
    Log    ${at}
    ${at}    Get Dom Attribute    SIvCob    outerHTML
    Log    ${at}


Element Count Size
    Open Browser    https://www.google.com  chrome  alias=A
    ${at}   Get Element Count    tag:textarea
    Log    ${at}
    ${at}   Get Element Count    tag:a
    Log    ${at}
    ${w}    ${h}   Get Element Size    q
    Log    ${w}
    Log    ${h}
    ${w}        Get Horizontal Position    q
    Log    ${w}
    ${w}        Get Vertical Position    q
    Log    ${w}
    Maximize Browser Window

    ${w}        Get Horizontal Position    q
    Log    ${w}
    ${w}        Get Vertical Position    q
    Log    ${w}


    ${at}    Get Property    SIvCob    innerText
    Log    ${at}

    ${at}    Get Property    SIvCob    text_length
    Log    ${at}

    ${at}    Get Element Attribute    SIvCob    text_length
    Log    ${at}

Get Webelement
    Open Browser    https://www.google.com  chrome  alias=A
    ${at}   Get WebElement    q
    Log    ${at}
    ${at}   Get WebElements    q1
    Log    ${at}
    Set Focus To Element    link:हिन्दी
    Capture Element Screenshot    css:*:focus
    Get Text    css:*:focus
    Click Element    css:*:focus


Click element at coord demo
    Open Browser    https://www.google.com  chrome  alias=A
    ${w}    ${h}   Get Element Size    q
    Log    ${w}
    Log    ${h}
    Click Element At Coordinates    q   445  10

Table Demo
    Open Browser    https://letcode.in/advancedtable    chrome
    ${data}      Get Table Row With Cell Text    //table[@id='advancedtable']    Aga Khan University
    Log    ${data}
    ${data}      Get Table Row Count    //table[@id='advancedtable']
    Log    ${data}
    ${data}      Get Table Column Count    //table[@id='advancedtable']      2
    Log    ${data}
    ${data}      Get Table Cell Element    //table[@id='advancedtable']    1    1
    Click Element   ${data}
    Sleep    2s
    Go To    https://the-internet.herokuapp.com/tables
    ${data}      Get Table Cell Child Element    //table[@id='table1']    2    6    a    1
    Click Element   ${data}
    Sleep    2s

Table Demo 2
    ${data}      Get Table Cell Child Element    //table[@id='table1']      2       1       a       1

Table Demo GRID/TABLE
    Open Browser    https://letcode.in/advancedtable    chrome
    ${data}      Get Table Row Count    //table[@id='advancedtable']
    Log    ${data}
    Go To    https://getbootstrap.com/docs/4.2/layout/grid/
    ${data}      Get Grid Row Count    (//div[@class='container'])[4]
    Log    ${data}


List Demo
    Open Browser    https://letcode.in/dropdowns    chrome
    ${data}     Get List Items    id:fruits     values=True
    Log    ${data}


Dropdowns Simple and multiselect
    Open Browser    https://letcode.in/dropdowns    chrome
    Select From List By Index    id:fruits      1
    Sleep    2s
    Select From List By Label    id:fruits      Pine Apple
    Sleep    2s
    Select From List By Value    id:fruits      2
    Sleep    2s
    Select From List By Index    id:superheros      1
    Sleep    2s
    Select From List By Label    id:superheros      Batman
    Sleep    2s
    Select From List By Value    id:superheros     ta
    Sleep    2s


Dropdowns Get List Items
    Open Browser    https://letcode.in/dropdowns    chrome
    ${items}     Get List Items    id:fruits
    Log    ${items}


Dropdowns Get Selected List Items
    Open Browser    https://letcode.in/dropdowns    chrome
    Select From List By Index    id:superheros      1
    #Sleep    2s
    Select From List By Label    id:superheros      Batman
    #Sleep    2s
    Select From List By Value    id:superheros     ta
    #Sleep    2s
    ${items}     Get Selected List Label    id:superheros
    Log    ${items}

    ${items}     Get Selected List Value    id:superheros
    Log    ${items}

    ${items}     Get Selected List Values    id:superheros
    Log    ${items}

    ${items}     Get Selected List Labels    id:superheros
    Log    ${items}
    List Should Contain Value       ${items}    Aquaman
    #List Selection Should Be    id:superheros   Aquaman (aq)
    List Should Have No Selections    id:fruits


Dropdowns Page should contain list
    Open Browser    https://letcode.in/dropdowns    chrome
    Page Should Contain List    id:superheros
    Page Should Not Contain List    id:superheros1


Dropdowns Select All and Deselect
    Open Browser    https://letcode.in/dropdowns    chrome
    Select All From List    id:superheros
    Unselect From List By Index    id:superheros      1
    Sleep    1s
    UnSelect From List By Label    id:superheros      Batman
    Sleep    1s
    UnSelect From List By Value    id:superheros     ta
    Sleep    1s
    Unselect All From List    id:superheros
    Sleep    1s

Select a option using partial visible text
    Open Browser    https://letcode.in/dropdowns    chrome
    Click Element    id:fruits
    Click Element    //option[contains(.,'ana')]
    Click Element    id:fruits
    Sleep    1s
    Click Element    //option[contains(.,'Avenger')]
    Sleep    1s

Custom dropdowns single select
    Open Browser    https://semantic-ui.com/modules/dropdown.html   chrome
    Click Element    xpath:(//div[@class='ui selection dropdown'])[1]//i
    Sleep    1s
    Click Element    xpath://div[contains(@class,'visible')]//div[@data-value][contains(.,'Male')]
    Sleep    2s

    Click Element    xpath:(//div[@class='ui fluid selection dropdown'])[1]//i
    Sleep    1s
    Click Element    xpath://div[contains(@class,'visible')]//div[@data-value][contains(.,'Elliot')]
    Sleep    2s
    
    Click Element    xpath:(//div[@class='ui fluid search selection dropdown']//i)[1]
    Sleep    1s
    Input Text    xpath:(//div[contains(@class,'ui fluid search selection dropdown')])//input[@class='search']      india
    Sleep    1s
    Press Keys      ${None}     RETURN      #ARROW_DOWN

Dropdown multi select
    Open Browser    https://semantic-ui.com/modules/dropdown.html   chrome
    Click Element    xpath:(//div[@class='ui fluid multiple search selection dropdown']//i)[1]
    Sleep    1s
    Input Text    xpath:(//div[contains(@class,'ui fluid multiple search selection dropdown')])//input[@class='search']    India
    Sleep    1s
    Click Element    xpath:((//div[contains(@class,'ui fluid multiple search selection dropdown')])//div[@data-value][contains(.,'India')])[1]
    Sleep    1s
    Input Text    xpath:(//div[contains(@class,'ui fluid multiple search selection dropdown')])//input[@class='search']    Indian
    Sleep    1s
    Click Element    xpath:((//div[contains(@class,'ui fluid multiple search selection dropdown')])//div[@data-value][contains(.,'Indian')])[1]
    Sleep    1s

    # Removing all selected values
    ${bool}     Set Variable    ${True}
    WHILE       ${bool}      limit=NONE
        ${elem}     Get WebElements    xpath:((//div[contains(@class,'ui fluid multiple search selection dropdown')])[1]//a//i[contains(@class,'delete')])[1]
        ${count}     Get Length    ${elem}
        IF    ${count}>0
            Click Element    ${elem[0]}
        ELSE
            ${bool}         Set Variable    ${False}
        END
        Sleep    1s
    END

    Sleep    1s

ITRA DEMO
    # Lang=en;
    # .AspNetCore.Antiforgery.KYulInBaheU=CfDJ8BAkgdDaPARDugoSWjfo-Pyni5rnDCqZEJynP33M_0ULv-50NkQrrIv2AhoH6FZN-hFm59KvouLf-QrN8zbni0vhwz_sf7z80NYCFVFjMjUhymHFtxMirN-hMpIwAy2TtUzaHMEdn7JM0W6PQwkRVTY
    Open Browser  https://itra.run/api/RunnerSpace/GetRunnerSpace?runnerString=CzHQn5MLDMpDxm2kBIrGSA%3D%3D   browser=chrome
    Add Cookie    Lang    en
    Add Cookie    .AspNetCore.Antiforgery.KYulInBaheU    CfDJ8BAkgdDaPARDugoSWjfo-Pyni5rnDCqZEJynP33M_0ULv-50NkQrrIv2AhoH6FZN-hFm59KvouLf-QrN8zbni0vhwz_sf7z80NYCFVFjMjUhymHFtxMirN-hMpIwAy2TtUzaHMEdn7JM0W6PQwkRVTY
    Go To    https://itra.run/api/RunnerSpace/GetRunnerSpace?runnerString=CzHQn5MLDMpDxm2kBIrGSA%3D%3D
    Sleep    2s

Wait Demos
    Open Browser    https://the-internet.herokuapp.com/dynamic_controls   chrome
    Wait For Condition    document.querySelector("form input").disabled == False

*** Keywords ***

Get Table Cell Child Element
    [Arguments]         ${TableLocatorXpath}            ${RowNumber}        ${ColNumber}            ${Tag}        ${ElementPosition}
    #$x("(//table[@id='table1']//tr)[2]//td[6]//a[1]")
    ${locator}      Catenate    (${TableLocatorXpath}//tr)[${RowNumber}]//td[${ColNumber}]//    ${Tag}  [${ElementPosition}]    | (${TableLocatorXpath}//tr)[${RowNumber}]//th[${ColNumber}]//  ${Tag}  [${ElementPosition}]
    Log    ${locator}
    ${ElementInCell}      Get WebElement    ${locator}
    RETURN  ${ElementInCell}



Get Table Row With Cell Text
    [Arguments]     ${TableLocatorXpath}     ${CellText}
    ${Len}  Get Table Row Count     ${TableLocatorXpath}
    FOR    ${counter}    IN RANGE    1    ${Len}+1
        TRY
            #Table Row Should Contain    ${TableLocatorXpath}    ${counter}    ${CellText}
            ${txt}     Get Text    (${TableLocatorXpath}//tr)[${counter}]
            Should Contain    ${txt}    ${CellText}     ignore_case=True
            RETURN  ${counter}
        EXCEPT
            Log    ${None}
        END
    END
    RETURN  -1

Get Grid Row Count
    [Arguments]     ${GridLocatorXpath}
    ${count}    Custom Get Row Count    GRID    ${GridLocatorXpath}
    RETURN  ${count}

Get Table Row Count
    [Arguments]     ${TableLocatorXpath}
    ${count}    Custom Get Row Count    TABLE    ${TableLocatorXpath}
    RETURN  ${count}

Custom Get Row Count
    [Arguments]     ${GridOrTable}      ${TableLocatorXpath}
    IF    "${GridOrTable}" == "TABLE"
        ${RowList}      Get WebElements    ${TableLocatorXpath}//tr
    ELSE
        ${RowList}      Get WebElements    ${TableLocatorXpath}/div[contains(@class,'row')]
    END
    ${Len}  Get Length    ${RowList}
    Log    ${Len}
    RETURN  ${Len}

Get Table Column Count
    [Arguments]     ${TableLocatorXpath}    ${RowNumber}
    ${CellList}      Get WebElements    (${TableLocatorXpath}//tr)[${RowNumber}]//td | (${TableLocatorXpath}//tr)[${RowNumber}]//th
    ${Len}  Get Length    ${CellList}
    Log    ${Len}
    RETURN  ${Len}

Get Table Cell Element
    [Arguments]     ${TableLocatorXpath}    ${RowNumber}    ${ColNumber}
    #$x("(//table[@id='table1']//tr)[2]//td[6]//a[1]")
    ${ElementCell}      Get WebElement    (${TableLocatorXpath}//tr)[${RowNumber}]//td[${ColNumber}] | (${TableLocatorXpath}//tr)[${RowNumber}]//th[${ColNumber}]
    RETURN  ${ElementCell}