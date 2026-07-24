*** Keywords ***
Search pick task
    [Arguments]    ${order_number}
    picktask_page.Input order number    ${order_number}
    common_web.Wait for UI to settle
    picktask_page.Click show pick list button

Select order and print ticket
    picktask_page.Click checkbox order
    picktask_page.Click checkbox print pick ticket
    picktask_page.Click checkbox print pick ticket by zone
    picktask_page.Click print button
    picktask_page.Click save button
    picktask_page.Verfy successful popup