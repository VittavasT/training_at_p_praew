*** Keywords ***
Search jobs by order number
    [Arguments]    ${order_number}
    jobslist_page.Input order for search job    ${order_number}
    jobslist_page.Click search job button

Edit picker by store
    Wait For Elements State    ${jobslist_locator.lbl_task_wrapper}        visible    timeout=10s
    ${count_task}=    Get Element Count    ${jobslist_locator.lbl_card_orderno}
    FOR    ${index}    IN RANGE    ${count_task}
        Browser.Click With Options   ${jobslist_locator.lbl_task_card}>>nth=${index}    clickCount=2
        jobslist_page.Click picker list
        common_web.Wait for UI to settle
        jobslist_page.Select picker
        jobslist_page.Click save button
    END
    
    
    