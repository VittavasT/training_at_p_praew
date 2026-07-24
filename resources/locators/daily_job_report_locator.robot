*** Variables ***
${daily_job_report_locator.chk_delivery_date}    css=.custom-control.custom-radio:has([name="lbFormatDateB"]) div ins
${daily_job_report_locator.txt_start_date}    css=#textStartDate
${daily_job_report_locator.txt_end_date}    css=#textEndDate
${daily_job_report_locator.btn_search}    css=#btSearch
${daily_job_report_locator.current_month}    css=.prev.available~.month:visible
${daily_job_report_locator.btn_next_month}    css=.prev.available~.month~.next.available
${daily_job_report_locator.btn_prev_month}    css=.prev.available
${daily_job_report_locator.date_no}    css=div.calendar-table td.available:text-is("{day}"):visible
${daily_job_report_locator.total_pages}      css=td [id*="ReportViewer1"][id$="TotalPages"]
${daily_job_report_locator.btn_next_page}    css=div[role="button"][title="Next Page"]
${daily_job_report_locator.current_page}    css=input[id$="CurrentPage"]
${daily_job_report_locator.loading_dialog}    css=[id$="AsyncWait_Wait"]