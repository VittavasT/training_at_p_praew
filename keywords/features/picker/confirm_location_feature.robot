*** Keywords ***
Input package location
    [Arguments]    ${package_no}
    confirm_location_page.Input package no    ${package_no}
    confirm_location_page.Input location
    confirm_location_page.Click save location button