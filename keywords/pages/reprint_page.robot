*** Keywords ***
Input order no
    [Arguments]    ${order_number}
    common_web.Fill text when element is ready    ${reprint_locator.txt_order_no}    ${order_number}

Click search button
    common_web.Click element when ready    ${reprint_locator.btn_search}


