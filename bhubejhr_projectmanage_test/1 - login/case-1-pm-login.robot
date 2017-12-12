*** Setting ***
Library          Selenium2Library
Test Setup       OpenProject
Test Teardown    Close Browser


*** Variables ***
${URL}    http://project.local


*** Keywords ***

OpenProject
      Open Browser                        ${URL}        googlechrome
      Wait Until Page Contains Element    id=username
      Wait Until Page Contains Element    id=password
      Wait Until Page Contains            เข้าสู่ระบบ

Login
      [Arguments]       ${user}           ${password}
      Input Text        id=username       ${user}
      Input Password    id=password       ${password}
      Press Key         id=password       \\13


*** Test Cases ***

scenario-1-user could Login
      Login             0969962245        dinsorsee
      Wait Until Page Contains            สร้างโครงการใหม่

scenario-2-user account not found
      Login             0969962245        xxxxx
      Alert Should Be Present            ระบบทำงานผิดพลาด กรุณาลองใหม่อีกครั้ง!

scenario-3-password null
      Input Text        id=username       0969962245
      Press Key         id=password       \\13
      Alert Should Be Present            คุณยังไม่ได้กรอกรหัสผ่าน!

*** comment ***
