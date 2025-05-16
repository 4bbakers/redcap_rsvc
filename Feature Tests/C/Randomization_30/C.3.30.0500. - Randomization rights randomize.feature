Feature: C.3.30.0500. User Interface: The system shall allow user rights configuration to enable the Randomization Randomize privilege.
  As a REDCap end user
  I want to see that Randomization is functioning as expected

  Scenario: #SETUP project with randomization enabled - "Project 3.30 randAM.xml"
    Given I login to REDCap with the user "Test_User1"
    And I create a new project named "C.3.30.0500" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project 3.30 randAM.REDCap.xml", and clicking the "Create Project" button

  Scenario: #SETUP Randomization User Rights (Give User all Rand Rights)
    When I click on the link labeled "User Rights"
    And I enter "Test_User1" into the field with the placeholder text of "Assign new user to role"
    And I click on the button labeled "Assign to role"
    And I select "1_FullRights" on the dropdown field labeled "Select Role" on the role selector dropdown
    When I click on the button labeled exactly "Assign" on the role selector dropdown
    Then I should see "Test User1" within the "1_FullRights" row of the column labeled "Username" of the User Rights table
  
  Scenario: ##VERIFY options Setup, Dashboard, and Randomize in user rights privilege setup page.
    When I click on the link labeled "User Rights"
    And I click on the link labeled "1_FullRights"
    Then I should see "Randomization"
    And I should see a checkbox labeled "Setup" that is checked
    And I should see a checkbox labeled "Dashboard" that is checked
    And I should see a checkbox labeled "Randomize" that is checked
    Then I click on the button labeled "Cancel"

  Scenario: #SETUP Randomization (Setup project with simple Randomization)
    When I click on the link labeled "Project Setup"
    And I click on the button labeled "Set up randomization"
    Then I should see "Randomization"

    When I click on the link labeled "Randomization"
    And I click on the icon in the column labeled "Setup" and the row labeled "1"
    When I click on the button labeled "Example #1 (basic)"
    # Then I should see a downloaded file named "RandomizationAllocationTemplate.csv"
    And I upload a "csv" format file located at "RandomizationAllocationTemplate.csv", by clicking the button near "for use in DEVELOPMENT status" to browse for the file, and clicking the button labeled "Upload File" to upload the file

    # When I upload a "csv" format file located at "import_files/RandomizationAllocationTemplate.csv", by clicking the button near "for use in DEVELOPMENT status" to browse for the file, and clicking the button labeled "Upload Files" to upload the file
    # Then I should see "Success! The randomization allocation table was created!"

  Scenario: C.3.30.0500.0100. User with Randomization Randomize rights can Randomize.
#FUNCTIONAL_REQUIREMENT C.3.30.0500.100: User with Randomization Randomize rights can Randomize.
    When I click on the link labeled "Add / Edit Records"
    And I click on a button labeled "Add new record"
    And I click the bubble for the row labeled "Randomization" instrument on the column labeled "Status"
    Then I should see "Randomization group"
    And I should see "Blinded randomization"
    And I should see "Automatic Randomization"
    And I should see "Randomize"
##VERIFY User with Randomization Randomize rights can Randomize.
    When I click on a button labeled "Randomize"
    # When I click on a button labeled "Randomize" for the field labeled " Randomization group"
    Then I should see the radio labeled "Do you describe yourself as a man, a woman, or in some other way?" with option "man" unselected
    And I select the radio option "man" for the field labeled "Do you describe yourself as a man, a woman, or in some other way?"
    And I click on the button labeled "Randomize"
    Then I should see	'Record ID "6" was randomized for the field "Randomization group" and assigned the value "Drug A" (1).'
    When I click on the button labeled "Close"
    Then I should see the radio labeled "Randomization group" with option "Drug A" selected

  Scenario: #SETUP User Rights (Takeaway User Rand - Setup Rights)
    When I click on the link labeled "User Rights"
    And I click on the link labeled "Test User1"
    And I click on the button labeled "Edit User Privileges"
    And I uncheck the User Right named "Randomize"
    And I save changes within the context of User Rights
    Then I should see 'User "test_user1" was successfully edited'

  Scenario: C.3.30.0500.0200. User without Randomization Randomize rights cannot Randomize.
#FUNCTIONAL_REQUIREMENT C.3.30.0500.200: User without Randomization Randomize rights cannot Randomize.
    When I click on the link labeled "Add / Edit Records"
    And I click on a button labeled "Add new record"
    And I click the bubble for the row labeled "Randomization" instrument on the column labeled "Status"
  ##VERIFY User without Randomization Randomize rights cannot Randomize.
    Then I should see "Randomization group"
    And I should NOT see a button labeled "Randomize"
#END
