Feature: Control Center: The system shall support enabling or disabling the use of external storage solutions (i.e., Amazon S3, Google Cloud Storage, and Microsoft Azure Blob Storage).

    As a REDCap end user
    I want to see that external storage is functioning as expected

    Scenario: D.3.28.0200.100 external storage solutions Microsoft Azure Blob Storage

        #FUNCTIONAL_REQUIREMENT
        ##ACTION: Configure the File Vault
        When I click on the link labeled "Control Center"
        And I click on the link labeled "File Upload Settings "
        Then I should see "Microsoft Azure Blob Storage"
        #Manual: REDCap Administrators may need to work with their Azure Administrator to get the Account Name, Account Key, and Blob Container information
        And I click on the button labeled "Save Changes"
        And I should see "Your configuration values have now been changed"

        #SETUP
        Given I login to REDCap with the user "Test_Admin"
        And I create a new project named " A.3.28.0200.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "24ConsentWithSetup.xml", and clicking the "Create Project" button

    ##ACTION: add record to get participant signature
    Scenario: Add record to get participant signature
        When I click on the link labeled "Add/Edit Records"
        And I click on the button labeled "Add new record for the arm selected above"
        And I click the bubble to select a record for the "Participant Consent" instrument on event "Event 1"
        Then I should see "Adding new Record ID 1"

        When I click on the button labeled "Save & Stay"
        And I click on the button labeled "Okay" in the dialog box
        And I click on the button labeled "Survey options"
        And I click on the survey option label containing "Open survey" label
        And I enter "FirstName" into the input field labeled "First Name"
        And I enter "LastName" into the input field labeled "Last Name"
        And I enter "email@test.edu" into the input field labeled "Email"
        And I enter "01-01-2000" into the input field labeled "DOB"
        And I enter "MyName" into the input field labeled "Participant's Name Typed"
        
        Given I click on the link labeled "Add signature"
        And I see a dialog containing the following text: "Add signature"
        And I draw a signature in the signature field area
        When I click on the button labeled "Save signature" in the dialog box
        Then I should see a link labeled "Remove signature"

        And I click on the button labeled "Submit"
        Then I should see "Close survey"

        When I click on the button labeled "Close survey"
        And I click on the button labeled "Leave without saving changes" in the dialog box
        ##VERIFY_RSD
        Then I should see "Record Home Page"
        And I should see "Completed Survey Response" icon for the bubble labeled "Participant Consent" for event "Event 1"

        ##VERIFY_FiRe
        ##e-Consent Framework not used, and PDF Snapshot is used
        When I click on the link labeled "File Repository"
        Then I should see a table header and rows containing the following values in the file repository table:
            | Name | PDF utilized e-Consent Framework | Record | Survey Completed                             |
            | .pdf | icon                             | 2      | Participant Consent (Event 1 (Arm 1: Arm 1)) |
            | .pdf | -                                | 1      | Participant Consent (Event 1 (Arm 1: Arm 1)) |

        When I click on the link labeled "PDF Survey Archive"
        And I click on the link on the PDF link for record "1"
        Then I should have a pdf file with the following values in the header: "PID xxxx - LastName"
        And I should have a pdf file with the following values in the footer: "Type: Participant"
#Manual: Close document

##VERIFY_PDF Snapshot Specific File Location
#Manual: REDCap Administrators may need to work with their Azure Administrator to get a screenshot that the PDF file exists
#END