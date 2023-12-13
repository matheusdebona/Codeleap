*** Settings ***
Documentation    This is a test for the CodeLeap Network
Resource    codeleap_resources.robot
Test Setup    Open browser and maximize window
Test Teardown    Close browser and quit

*** Test Cases ***
Test Case 1 - Matheus de Bona
    [Documentation]    Sign in with Matheus de Bona
    [Tags]    Matheus de Bona
    Access the homepage
    Write the username "Matheus de Bona" in the field "Username"
    Click on the button "Enter"
    Write the title "Hello World! I'm John Doe!" in the field "Title"
    Write the content "This is my first post!" in the field "Content"
    Click on the button "Create"
    Verify if the page contains the text "Hello World! I'm John Doe!"
    Write the title "New post to be deleted" in the field "Title"
    Write the content "Can I delete this?" in the field "Content"
    Click on the button "Create"
    Write the title "Post 3" in the field "Title"
    Write the content "Update?" in the field "Content"
    Click on the button "Create"
    Verify if the page contains the text "New post to be deleted"
    Verify if the page contains the text "Update?"
    Edit post with title "Post 3"
    Write new content "ATUALIZOU" in the field "Content" with old content "Update?"
    Verify if the page contains the text "Update?"
    Delete post with title "New post to be deleted"
    Verify if the page dont contains the text "New post to be deleted"



