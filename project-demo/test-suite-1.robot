*** Settings ***
Library     SeleniumLibrary
Library     XML


*** Variables ***
${BROWSER}      headlesschrome
${HOST}         https://staging.erp.fumui.my.id/login


*** Test Cases ***
# login

Login Success
    Open Browser    ${HOST}    ${BROWSER}
    Wait Until Element Is Visible    name:email    timeout=10s
    Input Text    name:email    superadmin@maskit.co.id
    Input Text    name:password    superadmin
    Click Element    xpath://button[@type='submit']    # Assuming your submit button is a <button> element
    Page Should Not Contain Element    xpath://a[@href='/']

Login Failed
    Open Browser    ${HOST}    ${BROWSER}
    Wait Until Element Is Visible    name:email    timeout=10s
    Input Text    name:email    superadmin@maskit.co.id
    Input Text    name:password    passwordsalah
    Click Element    xpath://button[@type='submit']
    Wait Until Element Is Visible    xpath://div[@class='Toastify__toast-body']/div    timeout=10s
    ${error_message}=    Get Text    xpath://div[@class='Toastify__toast-body']/div
    Log    ${error_message}
