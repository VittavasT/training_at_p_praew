*** Keywords ***
Input order number
    [Arguments]    ${order_number}
    common_web.Fill text when element is ready    ${customer_info_locator.txt_order_no}    ${order_number}

Click search button
    common_web.Click element when ready    ${customer_info_locator.btn_search}

Get Order Status Text
    ${status_text}=    Browser.Get Text    ${customer_info_locator.lbl_order_status}
    RETURN    ${status_text}

Get Receipt No By Row
    ${receipt_no}=    Browser.Get Text    ${customer_info_locator.lbl_receipt_no}
    RETURN    ${receipt_no}

