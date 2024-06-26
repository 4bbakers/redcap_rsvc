Feature: Form Creation: The system shall support the ability to copy data collection instruments and add a suffix to each variable name in the new instrument.

    As a REDCap end user
    I want to see that project Designer is functioning as expected

    Scenario: B.6.7.400.100 Copy instrument

        ##SETUP
        Given I login to REDCap with the user "Test_Admin"
        #Manual: Append project name with the current version (i.e. "X.X.X.XXX.XXX - LTS X.X.X")
        And I create a new project named "B.6.7.400.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_1.xml", and clicking the "Create Project" button

        ##SETUP_PRODUCTION
        When I click on the button labeled "Project Setup"
        And I click on the button labeled "Move project to production"
        And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
        And I click on the button labeled "YES, Move to Production Status" in the dialog box
        Then I should see "Project Status: Production"

        When I click on the link labeled "Designer"
        And I click on the button labeled "Enter Draft Mode"
        Then I should see "The project is now in Draft Mode"

        #FUNCTIONAL_REQUIREMENT
        ##ACTION
        When I select the dropdown option labeled "Copy" from the dropdown labeled "Choose action" for the instrument labeled "Text Validation"
        And click on the button labeled "Copy instrument"
        Then I should see "SUCCESS! The instrument was successfully copied."
        And I click on the button labeled "Close" in the dialog box

        ##VERIFY
        When I click on the link labeled "Text Validation 2"
        Then I should see the variable labeled "name_v2"
        And I should see the variable labeled "email_v2"

        When I click on the button labeled "Return to the list of instruments"
        And I click on the button labeled "Submit Changes for Review"
        And I click on the button labeled "Submit" in the dialog box
        Then I should see "Changes Were Made Automatically"
        And I click on the button labeled "Close" in the dialog box

        ##VERIFY_CODEBOOK
        And I click on the link labeled "Codebook"
        Then I should see "Instrument: Text Validation 2 (text_validation_2)"

        #VERIFY_LOG
        When I click on the link labeled "Logging"
        Then I should see a table header and rows including the following values in the logging table:
            | Username   | Action        | List of Data Changes OR Fields Exported |
            | test_admin | Manage/Design | Copy data collection instrument         |
#END