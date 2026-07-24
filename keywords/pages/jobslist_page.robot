*** Keywords ***
Input order for search job
    [Arguments]    ${order_number}
    common_web.Fill text when element is ready    ${jobslist_locator.txt_searchjob}    ${order_number}

Click search job button
    common_web.Click element when ready    ${jobslist_locator.btn_searchjob}

Click picker list
    common_web.Click element when ready    ${jobslist_locator.lbl_picker}

Select picker
    ${locator_picker_name}=    Replace String    ${jobslist_locator.lbl_picker_item}    {picker_name}    ${picker_name}
    common_web.Click element when ready    ${locator_picker_name}

Click save button
    common_web.Click element when ready    ${jobslist_locator.btn_save} 