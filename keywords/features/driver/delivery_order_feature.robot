*** Keywords ***
Select delivery job 
    [Arguments]    ${order_number}    ${trip_no}    ${delivery_date}
    delivery_order_page.Click calendar
    delivery_order_feature.Select calendar date    ${delivery_date}
    delivery_order_page.Click search button
    delivery_order_page.Click card by trip number    ${trip_no}
    delivery_order_feature.Click order ref card   ${order_number}
    common_web.Wait for UI to settle

Deliver order normal
    delivery_order_page.Click task icon
    delivery_order_page.Click home icon
    common_web.Wait for UI to settle
    delivery_order_page.Click checkin at home button
    delivery_order_page.Click camera icon
    delivery_order_page.Upload deliver order image
    delivery_order_page.Click confirm upload image
    delivery_order_page.Click people carry
    delivery_order_page.Click comfirm product amount
    common_web.Wait for UI to settle
    common_web.Draw Horizontal Line As Signature    ${delivery_order_locator.canvas_signature}
    delivery_order_page.Click confirm delivery

Deliver order short partial
    delivery_order_page.Click task icon
    delivery_order_page.Click home icon
    common_web.Wait for UI to settle
    delivery_order_page.Click checkin at home button
    delivery_order_page.Click camera icon
    delivery_order_page.Upload deliver order image
    delivery_order_page.Click confirm upload image
    delivery_order_page.Click people carry


Select calendar date
    [Arguments]    ${date}
    ${day}=      Evaluate    "${date}".split('/')[0]
    ${month}=    Evaluate    "${date}".split('/')[1]
    ${year}=     Evaluate    "${date}".split('/')[2]
    ${target_month_label}=    Evaluate
        ...    datetime.datetime.strptime("${month}/${year}", "%m/%Y").strftime("%b %Y")
        ...    modules=datetime

        WHILE    True
            ${current_month_label}=    Browser.Get Text    ${delivery_order_locator.lbl_month}
            IF    "${current_month_label}" == "${target_month_label}"
                BREAK
            END

            ${current_date}=    Evaluate    datetime.datetime.strptime("${current_month_label}", "%b %Y")    modules=datetime
            ${target_date}=     Evaluate    datetime.datetime.strptime("${target_month_label}", "%b %Y")    modules=datetime

            IF    $target_date > $current_date
                Browser.Click    ${delivery_order_locator.btn_next_month}
            ELSE
                Browser.Click    ${delivery_order_locator.btn_prev_month}
            END
        END

    ${day_no}=    Evaluate    str(int("${day}"))
    ${day_locator}=     Replace String    ${delivery_order_locator.lbl_date_no}    {day}    ${day_no}
    Browser.Click    ${day_locator}

Click order ref card
    [Arguments]    ${order_no}
    ${locator}=    Replace String    ${delivery_order_locator.card_order_ref}    {order_no}    ${order_no}
    common_web.Click element when ready    ${locator}