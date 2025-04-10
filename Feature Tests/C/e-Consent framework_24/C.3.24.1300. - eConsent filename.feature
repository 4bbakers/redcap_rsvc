Feature: User Interface: The system shall support the e-Consent Framework to customize the file name for PDF snapshots using static text or piping, appended with the date-time of the snapshot generation.
   As a REDCap end user
   I want to see that eConsent is functioning as expected

  Scenario: C.3.24.1300.100 e-Consent Framework custom file name
      #SETUP
    Given I login to REDCap with the user "Test_Admin"
    And I create a new project named "C.3.24.1300.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "24EConsentNoSetup.xml", and clicking the "Create Project" button
      #SETUP_PRODUCTION
    When I click on the link labeled "Project Setup"
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
    And I click on the button labeled "YES, Move to Production Status" in the dialog box
    Then I should see Project status: "Production"
      #SETUP_eConsent for participant consent process
      #SETUP_eConsent for participant consent process
    When I click on the link labeled "Designer"
    And I click on the button labeled "e-Consent"
    And I click on the button labeled "Enable the e-Consent Framework for a survey"
    And I select '"Participant Consent" (participant_consent)' in the dropdown field labeled "Enable e-Consent for a Survey" in the dialog box
    Then I should see "Enable e-Consent" in the dialog box
    And I should see "Primary settings"
      #C.3.24.1300.100 e-Consent Framework custom file name
    When I enter "Custom" into the input field labeled "File name:"
      #C.3.24.1400.100 - eConsent Framework custom note
    And I enter "My custom note" into the input field labeled "Notes:"
    And I click on the button labeled "Save settings"
    Then I should see a table header and rows containing the following values in a table:
            | e-Consent active? | Survey              |
            | [✓]               | Participant Consent |
    Then I should see a table header and rows containing the following values in a table:
      | e-Consent active? | Survey                                      | Location(s) to save the signed consent snapshot    | Custom tag/category | Notes          |
      | [✓]               | "Participant Consent" (participant_consent) | File Repository Specified field:[event_1_arm_1][participant_file] | Participant         | My custom note |

  Scenario: Test e-Consent by adding record
      ##ACTION: add record to get participant signature
    When I click on the link labeled "Add/Edit Records"
    And I click on the button labeled "Add new record for the arm selected above"
    And I click the bubble to select a record for the "Participant Consent" instrument on event "Event 1"
    Then I should see "Adding new Record ID 1."
    When I click on the button labeled "Save & Stay"
    And I click on the button labeled "Okay" in the dialog box
    And I click on the button labeled "Survey options"
    And I click on the survey option label containing "Open survey" label
    Then I should see "Participant Consent"
    When I enter "FirstName" into the input field labeled "First Name"
    And I enter "LastName" into the input field labeled "Last Name"
    And I enter "email@test.edu" into the input field labeled "Email"
    And I enter "2000-01-01" into the input field labeled "DOB"
    And I enter "MyName" into the input field labeled "Participant's Name Typed"
    Given I click on the link labeled "Add signature"
    And I see a dialog containing the following text: "Add signature"
    And I draw a signature in the signature field area
    When I click on the button labeled "Save signature" in the dialog box
    Then I should see a link labeled "Remove signature"
    When I click on the button labeled "Next Page"
    Then I should see "Displayed below is a read-only copy of your survey responses."
    And I should see a checkbox for the field labeled "I certify that all of my information in the document above is correct."
    When I check the checkbox labeled "I certify that all of my information in the document above is correct."
    And I click on the button labeled "Submit"
    Then I should see "Thank you for taking the survey."
    When I click on the button labeled "Close survey"
    And I click on the button labeled "Leave without saving changes" in the dialog box
    Then I should see the "Completed Survey Response" icon for the "Consent" longitudinal instrument on event "Event 1"
      ##ACTION: add Coordinator Signature
    When I click on the bubble labeled "Coordinator Signature" for event "Event 1 and Record 1"
    Then I should see "Coordinator Signature."
    And I click on the button labeled "Survey options"
    And I click on the survey option label containing "Open survey" label
    Then I should see " Coordinator Signature "
    And I enter "Coordinator Name" into the input field labeled "Coordinator Name Typed"
    And I enter a signature in the field labeled "Coordinator'sSignature"
    And I click on the button labeled "Save signature" in the dialog box
    When I click on the button labeled "Next Page"
    Then I should see "Displayed below is a read-only copy of your survey responses."
    And I should see a checkbox for the field labeled "I certify that all of my information in the document above is correct"
    When I click on the button labeled "Close survey"
    And I click on the button labeled "Leave without saving changes" in the dialog box
    Then I should see a Completed Survey Response icon for the Data Collection Instrument labeled "Coordinator Signature" for event "Event 1"
    And I should see an Incomplete Survey Response icon for the Data Collection Instrument labeled "PDF And Combined Signatures PDF" for event "Event 1"
    When I click on the bubble labeled "PDF And Combined Signatures PDF" for event "Event 1"
    Then I should see "Participant Consent file."
    And I should see a file uploaded to the field labeled "Coordinator Signature file."
    And I should see a file uploaded to the field labeled "PDF And Combined Signatures PDF."

  Scenario: Verification e-Consent saved and logged correctly
      ##VERIFY_FiRe
    When I click on the link labeled "File Repository"
    And I click on the link labeled "PDF Snapshot Archive"
    Then I should see a table header and rows containing the following values in a table:
      | Name                         | PDF utilized e-Consent Framework | Record | Survey Completed                             | Identifier (Name, DOB) | Version | Type                  |
      | custom_xxxx-xx-xx_xxxxxx.pdf | YES                              |      1 | Participant Consent (Event 1 (Arm 1: Arm 1)) |                        |         | e-Consent Participant |
      ##VERIFY_Logging
      ##e-Consent Framework not used, and PDF Snapshot is used
    When I click on the link labeled "Logging"
    Then I should see a table header and rows containing the following values in the logging table:
      | Username            | Action                    | List of Data Changes OR Fields Exported                                                                                                         |
      | [survey respondent] | e-Consent Certification 1 | e-Consent Certification record = "1"  event = "event_1_arm_1" instrument = "participant_consent" snapshot_file = "custom_xxxx-xx-xx_xxxxxx.pdf" |
#END
