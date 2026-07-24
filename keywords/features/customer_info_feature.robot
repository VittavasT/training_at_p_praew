*** Keywords ***
Get delivery date
    ${raw_date}=    Browser.Get Text    ${customer_info_locator.lbl_driver_date}
    ${delivery_date}=     Evaluate    "${raw_date}".split()[0]
    Log To Console    deliver_date = ${delivery_date}
    RETURN    ${delivery_date}