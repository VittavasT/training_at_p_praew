*** Keywords ***
Input username
    [Arguments]    ${username}
    common_web.Fill text when element is ready    ${login_locator.txt_username}    ${username}

Input password
    [Arguments]    ${password}
    common_web.Fill text when element is ready    ${login_locator.txt_password}    ${password}

Click login button
    common_web.Click element when ready    ${login_locator.btn_login}

Verify form login
    Browser.Wait For Elements State    ${login_locator.txt_login}    visible    timeout=10s