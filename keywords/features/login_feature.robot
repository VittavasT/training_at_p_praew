*** Keywords ***
Log in web url success
    [Arguments]    ${username}    ${password}
    login_page.Verify form login
    login_page.Input username    ${username}
    login_page.Input password    ${password}
    login_page.Click login button

Open web and login sts as admin role
    common_web.Open web browser    ${url.web_sts}  
    ${web_ids}=     Browser.Get page ids
    BuiltIn.Set global variable     ${WEB_ROLE_ADMIN}       ${web_ids}[-1]  
    login_feature.Log in web url success    ${admin.username}    ${admin.password}

Open web and login ops as picker role
    common_web.Open web browser    ${url.web_ops}
    ${web_ids}=     Browser.Get page ids
    BuiltIn.Set global variable     ${WEB_ROLE_PICKER}       ${web_ids}[-1]
    login_feature.Log in web url success    ${picker.username}    ${picker.password}

Open web and login sts as driver role
    common_web.Open web browser  ${url.web_sts}
    ${web_ids}=     Browser.Get page ids
    BuiltIn.Set global variable     ${WEB_ROLE_DRIVER}       ${web_ids}[-1]
    login_feature.Log in web url success    ${driver.username}    ${driver.password}
