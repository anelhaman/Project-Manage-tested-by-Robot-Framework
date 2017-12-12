*** Setting ***
Library          Selenium2Library
Test Setup       GotoProject
Test Teardown

*** Variables ***

${URL}       http://project.local/
${BROWSER}    googlechrome
@{Container}    ${URL}    ${BROWSER}

*** Keywords ***

GotoProject
      OpenProject
      Login            0969962245         dinsorsee


OpenProject
      Open Browser                        @{Container}[0]        @{Container}[1]

Login
      [Arguments]       ${user}           ${password}
      Input Text        id=username       ${user}
      Input Password    id=password       ${password}
      Press Key         id=password       \\13



*** Test Cases ***
*** comment ***
case-1-add new project
    Wait Until Page Contains            สร้างโครงการใหม่
    Click Element                       id=btnCreate
    Input Text         id=name          สร้างโครงการใหม่ from Robot#Robot
    Input Text         id=desc          สร้างโครงการใหม่ from Robot#Robot
    Press Key          id=btnSubmit          \\13
    Wait Until Page Contains            Robot#Robot         timeout=10s


case-2-click edit
    [Argument]                          ${id}
    Wait Until Page Contains            สร้างโครงการใหม่
    Click Element                       xpath=(//*[@data-id=""]/*[@class='edit'])
    ClickLink                           xpath=(//a[@href="project/setting/"])

*** Test Cases ***
case-3-delete

    Wait Until Page Contains            สร้างโครงการใหม่
    Click Element                       xpath=(//*[@data-id="20015"]/*[@class='edit'])
    Mouse Over                          xpath=(//div[@class="items btn-delete delete"])
    Press Key          xpath=(//div[@class="delete"])          \\13
