*** Keywords ***
Copy package number    
    [Arguments]    ${order_number}
    reprint_page.Input order no    ${order_number}
    reprint_page.Click search button
    ${package_no}=    Get Text    ${reprint_locator.lbl_package_no}
    Log To Console    package_no = ${package_no}
    RETURN    ${package_no}