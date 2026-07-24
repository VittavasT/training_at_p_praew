*** Keywords ***
Input package no
    [Arguments]    ${package_no}
    common_web.Fill text when element is ready    ${confirm_location_locator.txt_package_no}    ${package_no}
    common_web.Wait for UI to settle
    Browser.Keyboard Key    press    Enter

Input location
    common_web.Fill text when element is ready    ${confirm_location_locator.txt_location}    ${package_location}

Click save location button
    common_web.Click element when ready    ${confirm_location_locator.btn_save_location}