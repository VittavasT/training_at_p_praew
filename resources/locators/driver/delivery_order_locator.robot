*** Variables ***
${delivery_order_locator.txt_calendar}    css=#TextDateSearch
${delivery_order_locator.btn_search_job}    css=#btSearchJob
${delivery_order_locator.btn_prev_month}        css=.prev.available
${delivery_order_locator.btn_next_month}        css=.prev.available~.month~.next.available
${delivery_order_locator.lbl_month}           css=.prev.available~.month
${delivery_order_locator.lbl_date_no}         css=div.calendar-table td.available:text-is("{day}"):visible
${delivery_order_locator.lbl_trip_number}    css=div[onclick]:has-text("{trip_no}")
${delivery_order_locator.card_order_ref}    css=div[onclick]:has-text("{order_no}")
${delivery_order_locator.btn_task_icon}    css=.fa-tasks
${delivery_order_locator.btn_home_icon}    css=.timeline-badge .fa-home
${delivery_order_locator.btn_camera_icon}    css=.timeline-badge.info .fa-camera
${delivery_order_locator.btn_people_carry_icon}    css=.timeline-badge.info .fa-people-carry
${delivery_order_locator.btn_checkout_icon}    css=.fa-map-marker-alt
${delivery_order_locator.btn_checkin_at_home}    css=#btnCheckInAtHome
${delivery_order_locator.btn_upload_image}        css=.dz-hidden-input >> nth=2
${delivery_order_locator.btn_comfirm_upload_image}    css=#btnUploadAfterImageAtHome
${delivery_order_locator.btn_comfirm_close_job}    css=#btnConfirmCloseJob
${delivery_order_locator.canvas_signature}    css=#newSignature:visible
${delivery_order_locator.btn_comfirm_signature}    css=#frmSignatureJobFinal2 #btnSave