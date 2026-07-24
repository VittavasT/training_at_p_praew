*** Keywords ***
Select calendar date
    [Arguments]    ${date}
    ${day}=      Evaluate    "${date}".split('/')[0]
    ${month}=    Evaluate    "${date}".split('/')[1]
    ${year}=     Evaluate    "${date}".split('/')[2]
    ${target_month_label}=    Evaluate
        ...    datetime.datetime.strptime("${month}/${year}", "%m/%Y").strftime("%b %Y")
        ...    modules=datetime

        WHILE    True
            ${current_month_label}=    Browser.Get Text    ${manage_routing_locator.lbl_month}
            IF    "${current_month_label}" == "${target_month_label}"
                BREAK
            END

            ${current_date}=    Evaluate    datetime.datetime.strptime("${current_month_label}", "%b %Y")    modules=datetime
            ${target_date}=     Evaluate    datetime.datetime.strptime("${target_month_label}", "%b %Y")    modules=datetime

            IF    $target_date > $current_date
                Browser.Click    ${manage_routing_locator.btn_next_month}
            ELSE
                Browser.Click    ${manage_routing_locator.btn_prev_month}
            END
        END

    ${day_no}=    Evaluate    str(int("${day}"))
    ${day_locator}=     Replace String    ${manage_routing_locator.lbl_date_no}    {day}    ${day_no}
    Browser.Click    ${day_locator}

Assign task to driver
    [Arguments]    ${delivery_date}
    manage_routing_page.Click calendar icon
    manage_routing_page.Click date
    manage_routing_feature.Select calendar date    ${delivery_date}
    common_web.Wait for UI to settle
    manage_routing_page.Click close icon
    manage_routing_page.Click search icon
    common_web.Wait for UI to settle
    manage_routing_page.Click select driver dropdown
    common_web.Wait for UI to settle
    manage_routing_page.Click select driver
    common_web.Wait for UI to settle
    manage_routing_page.Click select driver name dropdown
    common_web.Wait for UI to settle
    manage_routing_page.Click select driver name
    manage_routing_page.Click check box order
    manage_routing_page.Click add job button
    manage_routing_page.Verify alert success