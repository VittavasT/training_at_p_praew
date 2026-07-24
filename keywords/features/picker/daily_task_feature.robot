*** Keywords ***
# Select job from daily task
#     Browser.Scroll To Element    ${daily_task_locator.lbl_job_card_by_order_1}  
#     ${count_job}    Get Element Count    ${daily_task_locator.lbl_job_card_by_order}
#     RETURN    ${count_job}
#     #Log To Console    count_job =${count_job}
#     IF    ${count_job} >= 1
#         daily_task_page.Click select job card by order
#     ELSE IF    ${count_job} == 0
#         home_page.Click menu save location
#     END

# Picker go to daily task and packing product
#     home_page.Click daily task menu
#     daily_task_page.Click total job tab
#     daily_task_feature.Select job from daily task
#     daily_task_page.Click receive job

####---------------------------------------------

Count job from daily task
    Browser.Scroll To Element    ${daily_task_locator.lbl_job_card_by_order_1}
    ${count_job}    Get Element Count    ${daily_task_locator.lbl_job_card_by_order}
    RETURN    ${count_job}

Go to total job tab
    home_page.Click daily task menu
    daily_task_page.Click total job tab

Picker go to daily task and packing product
    daily_task_feature.Go to total job tab
    ${job_card}    daily_task_feature.Count job from daily task

    FOR    ${item}    IN RANGE    ${job_card}
        daily_task_page.Click select job card by order
        daily_task_page.Click receive job
        confirm_pick_feature.Create new box
        ##Copy package number
        Browser.Switch Page    ${WEB_ROLE_ADMIN}
        home_feature.Go to reprint packge number
        ${package_no}    reprint_feature.Copy package number    ${order_no}
        #Picker packing order
        Browser.Switch Page    ${WEB_ROLE_PICKER}
        confirm_pick_feature.Pick item
        pack_item_feature.Packing item product    ${package_no}
        confirm_location_feature.Input package location    ${package_no}
        IF    ${item} < ${job_card} - 1
            daily_task_feature.Go to total job tab
        END
    END