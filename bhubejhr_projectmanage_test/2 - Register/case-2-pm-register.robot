*** Setting ***
Library          Selenium2Library
Variables        Resources/variables.py
Test Setup       OpenProject
Test Teardown    Close Browser


*** Variables ***

${URL}       http://project.local
${BROWSER}    googlechrome
@{Container}    ${URL}    ${BROWSER}


*** Keywords ***

OpenProject
      Open Browser                        @{Container}[0]        @{Container}[1]
      Click Element                       xpath=(//div['login']/div['note']/a)
      Wait Until Page Contains Element    id=username
      Wait Until Page Contains Element    id=password
      Wait Until Page Contains Element    id=bio
      Wait Until Page Contains Element    id=btnSubmit

Register
      [Arguments]       ${fullname}       ${username}       ${bio}        ${password}
      Input Text        id=fullname       ${fullname}
      Input Text        id=username       ${username}
      Input Text        id=bio            ${bio}
      Input Password    id=password       ${password}
      Press Key         id=password       \\13




*** comment ***
scenario-1-user could register
      Register    ${USR[0]}    ${USR[1]}    ${USR[2]}    ${USR[3]}
      Wait Until Page Contains                ไม่พบรายการ...
      Wait Until Page Contains                ออกจากระบบ

scenario-2-bypass logon registered
      Register    ${USR[0]}    ${USR[1]}    ${USR[2]}    ${USR[3]}
      Wait Until Page Contains                ออกจากระบบ

scenario-3-duplicate register
      Register    ${USR[0]}    ${USR[1]}    ${USR[2]}    123456
      Alert Should Be Present                 ระบบทำงานผิดพลาด กรุณาลองใหม่อีกครั้ง!




*** Test Cases ***

scenario-5-shorter password
      Register    ${USR[1]}    ${USR[2]}    ${USR[3]}    1
      Alert Should Be Present                 ระบบทำงานผิดพลาด กรุณาลองใหม่อีกครั้ง!


*** comment ***

scenario-4-invalid username
      Register    @{USR}[0]    098989    @{USR}[2]    @{USR}[3]
      Alert Should Be Present                 ระบบทำงานผิดพลาด กรุณาลองใหม่อีกครั้ง!

scenario-1

scenario-2

scenario-3
