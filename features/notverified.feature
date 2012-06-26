Feature: Default install
  Scenario: Clean install
    Given I am on the Lockss homepage
    Then It should return a forbidden error
      """
      403: Forbidden
      """
    Then It should show an url
      """
      Error loading: http://props.lockss.org:8001/daemon/lockss.xml
      """
    Then It should tell me what to do
      """
      Please make sure the LOCKSS team has added the IP address of your LOCKSS
      """

