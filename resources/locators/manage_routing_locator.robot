*** Variables ***
${manage_routing_locator.btn_calendar}        css=.dropdown>a>i.fa-calendar-alt
${manage_routing_locator.lbl_date}            css=#TextDateDelivery
${manage_routing_locator.btn_prev_month}        css=.prev.available
${manage_routing_locator.btn_next_month}        css=.prev.available~.month~.next.available
${manage_routing_locator.lbl_month}           css=.prev.available~.month
${manage_routing_locator.lbl_date_no}         css=div.calendar-table td.available:text-is("{day}"):visible
${manage_routing_locator.btn_search}          css=#btSearchDateDelivery1_1>.fa-search
${manage_routing_locator.txt_select_driver}    css=#select2-selDriver1-container
${manage_routing_locator.lbl_select_driver}    css=li[id^="select2-selDriver1-result-"][id$="-XX-DRI"]
${manage_routing_locator.txt_select_driver_name}    css=#select2-selDriver2-container
${manage_routing_locator.lbl_select_driver_name}    css=li.select2-results__option:has-text("{name}")
${manage_routing_locator.btn_close}            css=#Popover-calendar>h4>.close.pull-right
${manage_routing_locator.chk_order}            css=table:has(tr:has-text("{order}")) .icheckbox_flat-red
${manage_routing_locator.btn_add_job}            css=#btnAddJobChoose
${manage_routing_locator.lbl_alert_success}      css=.alert-success