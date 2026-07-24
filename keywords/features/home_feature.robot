*** Keywords ***
Go to order pick task page
    home_page.Click menu product manage
    home_page.Click sub menu order product

Go to jobs list page
    home_page.Click menu product manage
    home_page.Click sub menu jobs list

Go to reprint packge number
    home_page.Click menu reprint
    home_page.Click sub menu reprint package number

Go to customer info
    [Arguments]    ${order_number}
    home_page.Click menu customer info
    customer_info_page.Input order number    ${order_number}
    customer_info_page.Click search button

Go to manage delivery
    home_page.Click menu manage delivery
    home_page.Click sub menu manage routing

Go to confirm truck
    home_page.Click menu manage delivery
    home_page.Click sub menu confirm truck

Go to daily job report page
    home_page.Click menu report
    home_page.Click sub menu daily job report