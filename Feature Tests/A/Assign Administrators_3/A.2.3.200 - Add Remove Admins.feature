Feature: A.2.3.200 Assign administrators and account managers

  As a REDCap end user
  I want to see that Assign Super Users / Account Managers is functioning as expected

  Scenario: A.2.3.200.100 Give/remove user admin user rights

Feature: A.2.3.200 Assign administrators and account managers

  As a REDCap end user
  I want to see that Assign Super Users / Account Managers is functioning as expected

  Scenario: A.2.3.200.100 Give/remove user admin user rights
    #FUNCTIONAL REQUIREMENT A.2.3.100.100 View administrator accounts
    ##ACTION A.2.3.100.100 View administrator accounts
    Given I login to REDCap with the user "Test_Admin"
    When I click on the link labeled "Control Center"
    And I click on the link labeled "Administrator Privileges"

    #VERIFY A.2.3.100.100 View administrator accounts
    Then I should see "Set administrator privileges"
    And I should see a table header and rows containing the following values in the administrators table:
      | Administrators          |
      | Test_Admin (Admin User) |

    #FUNCTIONAL REQUIREMENT A.2.3.200 Assign administrators and account managers
    ##ACTION Add administrator account no privileges
    Given I enter "Test_User1" into the field with the placeholder text of "Search users to add as admin"
    And I click on the button labeled "Add"
    #VERIFY: Required privileges to be selected
    Then I should see a dialog containing the following text: "check one or more"
    And I close the popup

    #FUNCTIONAL REQUIREMENT A.2.3.200 Assign administrators
    Given I enter "Test_User1" into the field with the placeholder text of "Search users to add as admin"
    And I enable the Administrator Privilege "Set administrator privileges" for a new administrator
    And I click on the button labeled "Add"

    #VERIFY A.2.3.200 Assign administrators
    Then I should see 'The user "Test_User1" has now been granted one or more administrator privileges'
    When I click on the button labeled "OK"
    Then I should see a table header and rows containing the following values in the administrators table:
      | Administrators | Set administrator privileges | Access to all projects and data with maximum user privileges | Manage user accounts | Modify system configuration pages | Install, upgrade, and configure External Modules | Perform REDCap upgrades | Access to Control Center dashboards |
      | Test_User1     | Enable                       | Disable                                                      | Disable              | Disable                           | Disable                                          | Disable                 | Disable                             |

    Given I logout
    Then I login to REDCap with the user "Test_User1"
    And I click on the link labeled "Control Center"
    And I click on the link labeled "Administrator Privileges"

    Then I should see a table header and rows containing the following values in the administrators table:
      | Administrators | Set administrator privileges | Access to all projects and data with maximum user privileges | Manage user accounts | Modify system configuration pages | Install, upgrade, and configure External Modules | Perform REDCap upgrades | Access to Control Center dashboards |
      | Test_User1     | Enable                       | Disable                                                      | Disable              | Disable                           | Disable                                          | Disable                 | Disable                             |

    #FUNCTIONAL REQUIREMENT A.2.3.300 & A.2.3.400 Modify by Enable Administrator Privileges
    When I enable the Administrator Privilege "Set administrator privileges" for the administrator "Test_User1"
    And I enable the Administrator Privilege "Access to all projects and data with maximum user privileges" for the administrator "Test_User1"
    And I enable the Administrator Privilege "Manage user accounts" for the administrator "Test_User1"
    And I enable the Administrator Privilege "Modify system configuration pages" for the administrator "Test_User1"
    And I enable the Administrator Privilege "Install, upgrade, and configure External Modules" for the administrator "Test_User1"
    And I enable the Administrator Privilege "Perform REDCap upgrades" for the administrator "Test_User1"
    And I enable the Administrator Privilege "Access to Control Center dashboards" for the administrator "Test_User1"

    Then I should see a table header and rows containing the following values in the administrators table:
      | Administrators | Set administrator privileges | Access to all projects and data with maximum user privileges | Manage user accounts | Modify system configuration pages | Install, upgrade, and configure External Modules | Perform REDCap upgrades | Access to Control Center dashboards |
      | Test_User1     | Enable                       | Enable                                                       | Enable               | Enable                            | Enable                                           | Enable                  | Enable                              |

    #VERIFY Administrator Privileges
    When I click on the link labeled "Control Center"
    Then I should see "Administrator privileges"
    And I should see "Browse Projects"
    And I should see "Edit Project Settings"
    And I should see "Add Users"
    And I should see "General Configurations"
    And I should see "User Settings"

    #FUNCTIONAL REQUIREMENT A.2.3.300 & A.2.3.400 Modify by Disable Administrator Privileges
    When I enable the Administrator Privilege "Set administrator privileges" for the administrator "Test_User1"
    And I disable the Administrator Privilege "Access to all projects and data with maximum user privileges" for the administrator "Test_User1"
    And I disable the Administrator Privilege "Manage user accounts" for the administrator "Test_User1"
    And I disable the Administrator Privilege "Modify system configuration pages" for the administrator "Test_User1"
    And I disable the Administrator Privilege "Install, upgrade, and configure External Modules" for the administrator "Test_User1"
    And I disable the Administrator Privilege "Perform REDCap upgrades" for the administrator "Test_User1"
    And I disable the Administrator Privilege "Access to Control Center dashboards" for the administrator "Test_User1"

    Then I should see a table header and rows containing the following values in the administrators table:
      | Administrators | Set administrator privileges | Access to all projects and data with maximum user privileges | Manage user accounts | Modify system configuration pages | Install, upgrade, and configure External Modules | Perform REDCap upgrades | Access to Control Center dashboards |
      | Test_User1     | Enable                       | Disable                                                      | Disable              | Disable                           | Disable                                          | Disable                 | Disable                             |

    #VERIFY Administrator Privileges
    When I click on the link labeled "Control Center"
    Then I should see "Administrator privileges"
    And I should see "Browse Projects"
    And I should NOT see "Edit Project Settings"
    And I should NOT "Add Users"
    And I should see "General Configurations"
    And I should NOT "User Settings"
    Given I logout

    #ACTION Remove admin #A.2.3.200.100
    Given I login to REDCap with the user "Test_Admin"
    When I click on the link labeled "Control Center"
    And I click on the link labeled "Administrator Privileges"
    And I disable the Administrator Privilege "Set administrator privileges" for the administrator "Test_User1"

    Then I should see a dialog containing the following text: "Please be aware that you have unchecked ALL the administrator privileges for this user"

    When Given I click on the button labeled "Close" in the dialog box
    When I click on the link labeled "Administrator Privileges"
    Then I should see "Set administrator privileges"
    And I should NOT see "Test_User1"
    Given I logout

    ##VERIFY user is no longer admin.
    When I login to REDCap with the user "Test_User1"
    Then I should NOT see a link labeled "Control Center"
    #End