*** Keywords ***
Create new box
    confirm_pick_page.Click create new box button
    confirm_pick_page.Input box qty
    confirm_pick_page.Click confirm button

Pick item
    confirm_pick_page.Click pack icon
    confirm_pick_page.Select item