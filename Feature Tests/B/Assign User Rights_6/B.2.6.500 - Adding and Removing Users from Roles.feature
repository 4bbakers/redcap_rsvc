Feature: Project Level:  The system shall support adding and removing users from user roles.

    As a REDCap end user
    I want to see that assign user rights is functioning as expected

    Scenario: B.2.6.500.100 Cancel, Assign, Re-assign, & Remove User Roles
        #SETUP
        Given I login to REDCap with the user "Test_Admin"
        #Manual: Append project name with the current version (i.e. "X.X.X.XXX.XXX - LTS X.X.X")
        And I create a new project named "B.2.6.500.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_1.xml", and clicking the "Create Project" button

        #SETUP_USER_RIGHTS
        When I click on the link labeled "User Rights"
        And I upload a "csv" format file located at "import_files/user list for project 1.csv", by clicking the button near "Select your CSV" to browse for the file, and clicking the button labeled "Upload" to upload the file
        ##VERIFY
        Then I should see a dialog containing the following text: "Upload users (CSV) - Confirm"
        And I should see a table header and rows containing the following values in the table:
            | Role name | Username   |
            |           | test_admin |
            |           | test_user1 |
            |           | test_user2 |
            |           | test_user3 |
            |           | test_user4 |

        Given I click on the button labeled "Upload"
        Then I should see a dialog containing the following text: "SUCCESS!"

        When I close the popup
        Then I should see a table header and rows including the following values in the table:
            | Role name               | Username   |
            |                         | test_admin |
            |                         | test_user1 |
            |                         | test_user2 |
            |                         | test_user3 |
            |                         | test_user4 |
            | 1_FullRights            |            |
            | 2_Edit_RemoveID         |            |
            | 3_ReadOnly_Deidentified |            |
            | 4_NoAccess_Noexport     |            |
            | TestRole                |            |


        #FUNCTIONAL REQUIREMENT
        ##ACTION: Cancel assign to role
        When I click on the link labeled "Test_User1"
        And I click on the button labeled "Assign to role"
        And I should see the dropdown field labeled "Assign to role" with the option "TestRole" selected
        And I click on the button labeled "Cancel"
        ##VERIFY
        Then I should see a table header and rows including the following values in the table:
            | Role name               | Username   |
            |                         | test_admin |
            |                         | test_user1 |
            |                         | test_user2 |
            |                         | test_user3 |
            |                         | test_user4 |
            | 1_FullRights            |            |
            | 2_Edit_RemoveID         |            |
            | 3_ReadOnly_Deidentified |            |
            | 4_NoAccess_Noexport     |            |
            | TestRole                |            |

        ##ACTION: Assign to role
        When I click on the link labeled "Test_User1"
        And I click on the button labeled "Assign to role"
        And I should see the dropdown field labeled "Select Role" with the option "TestRole" selected
        And I click on the button labeled "Assign"
        ##VERIFY
        Then I should see a table header and rows including the following values in the table:
            | Role name               | Username   |
            |                         | test_admin |
            |                         | test_user2 |
            |                         | test_user3 |
            |                         | test_user4 |
            | 1_FullRights            |            |
            | 2_Edit_RemoveID         |            |
            | 3_ReadOnly_Deidentified |            |
            | 4_NoAccess_Noexport     |            |
            | TestRole                | test_user1 |

        ##ACTION: Re-assign to role
        When I click on the link labeled "Test_User1"
        And I click on the button labeled "Re-assign to role"
        And I should see the dropdown field labeled "Select Role" with the option "1_FullRights" selected
        And I click on the button labeled "Assign"
        ##VERIFY
        Then I should see a table header and rows including the following values in the table:
            | Role name               | Username   |
            |                         | test_admin |
            |                         | test_user2 |
            |                         | test_user3 |
            |                         | test_user4 |
            | 1_FullRights            | test_user1 |
            | 2_Edit_RemoveID         |            |
            | 3_ReadOnly_Deidentified |            |
            | 4_NoAccess_Noexport     |            |
            | TestRole                |            |

        ##ACTION: Remove from role
        When I click on the link labeled "Test_User1"
        And I click on the button labeled "Remove from role"
        And I click on the button labeled "Close in the dialog box"

        ##VERIFY
        Then I should see a table header and rows including the following values in the table:
            | Role name               | Username   |
            |                         | test_admin |
            |                         | test_user1 |
            |                         | test_user2 |
            |                         | test_user3 |
            |                         | test_user4 |
            | 1_FullRights            |            |
            | 2_Edit_RemoveID         |            |
            | 3_ReadOnly_Deidentified |            |
            | 4_NoAccess_Noexport     |            |
            | TestRole                |            |
#End