*** Keywords ***
Get trip number
    [Arguments]    ${delivery_date}    ${web_order_no}
    daily_job_report_page.Click check box delivery date
    daily_job_report_page.Click start date
    daily_job_report_feature.Select calendar date    ${delivery_date}
    daily_job_report_page.Click end date
    daily_job_report_feature.Select calendar date    ${delivery_date}
    daily_job_report_page.Click search button
    Switch Page    NEW
    Browser.Set Viewport Size    1600    900
    ${trip_number}    daily_job_report_feature.Get trip number by order no    ${web_order_no}
    RETURN    ${trip_number}

Select calendar date
    [Arguments]    ${date}    
    ${day}=      Evaluate    "${date}".split('/')[0]
    ${month}=    Evaluate    "${date}".split('/')[1]
    ${year}=     Evaluate    "${date}".split('/')[2]
    ${target_month_label}=    Evaluate
        ...    datetime.datetime.strptime("${month}/${year}", "%m/%Y").strftime("%b %Y")
        ...    modules=datetime

    WHILE    True
        ${current_month_label}=    Browser.Get Text    ${daily_job_report_locator.current_month}
        IF    "${current_month_label}" == "${target_month_label}"
            BREAK
        END

        ${current_date}=    Evaluate    datetime.datetime.strptime("${current_month_label}", "%b %Y")    modules=datetime
        ${target_date}=     Evaluate    datetime.datetime.strptime("${target_month_label}", "%b %Y")    modules=datetime

        IF    $target_date > $current_date
            Browser.Click    ${daily_job_report_locator.btn_next_month}
        ELSE
            Browser.Click    ${daily_job_report_locator.btn_prev_month}
        END
    END

    ${day_no}=    Evaluate    str(int("${day}"))
    ${day_locator}=     Replace String    ${daily_job_report_locator.date_no}    {day}    ${day_no}
    Browser.Click    ${day_locator}

Get trip number by order no
    [Arguments]    ${web_order_no}
    Browser.Wait For Elements State    ${daily_job_report_locator.total_pages}    visible    timeout=50s
    ${total_pages}=    Get Text    ${daily_job_report_locator.total_pages}
    ${total_pages}=    Convert To Integer    ${total_pages}

    ${layout}=    Evaluate JavaScript    ${daily_job_report_locator.total_pages}
    ...    (element) => {
    ...        const doc = element.ownerDocument;
    ...        const cells = Array.from(doc.querySelectorAll("table td, table th")).map(c => c.innerText.trim());
    ...        const headerStart = cells.indexOf("No.");
    ...        if (headerStart === -1) return null;
    ...        const tripOffset = cells.indexOf("Trip Number", headerStart) - headerStart;
    ...        const webOrderOffset = cells.indexOf("Web Order No.", headerStart) - headerStart;
    ...        return webOrderOffset - tripOffset;
    ...    }
    ${trip_to_web_order_gap}=    Set Variable    ${layout}

    FOR    ${page}    IN RANGE    1    ${total_pages + 1}
        ${match_args}=    Create List    ${trip_to_web_order_gap}    ${web_order_no}
        ${trip_number}=    Evaluate JavaScript    ${daily_job_report_locator.total_pages}
        ...    (element, args) => {
        ...        const [gap, webOrderNo] = args;
        ...        const doc = element.ownerDocument;
        ...        const cells = Array.from(doc.querySelectorAll("table td, table th")).map(c => c.innerText.trim());
        ...        const idx = cells.indexOf(webOrderNo);
        ...        if (idx === -1 || idx - gap < 0) return null;
        ...        return cells[idx - gap];
        ...    }
        ...    arg=${match_args}

        IF    "${trip_number}" != "None" and "${trip_number}" != "${EMPTY}"
            RETURN    ${trip_number}
        END

        IF    ${page} < ${total_pages}
            Fill Text    ${daily_job_report_locator.current_page}    ${page + 1}
            Keyboard Key    press    Enter
            Run Keyword And Ignore Error
            ...    Browser.Wait For Elements State    ${daily_job_report_locator.loading_dialog}    visible    timeout=2s
            Browser.Wait For Elements State    ${daily_job_report_locator.loading_dialog}    hidden    timeout=15s
            Browser.Wait For Elements State    ${daily_job_report_locator.total_pages}    visible    timeout=15s
        END
    END

    Fail    ไม่พบ Trip Number ของ Web Order No. "${web_order_no}" ในทุก ${total_pages} หน้า