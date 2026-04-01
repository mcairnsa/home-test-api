Feature: Inventory API tests

  Background:
    # url defined in the config file
    url baseUrl
    # generates a unique id each run, would be good to break out into a separate asset
    * def newItem = { "id": "#('' + java.lang.System.currentTimeMillis())", "name": "Hawaiian", "price": "$14", "image": "hawaiian.png" }

  # 1️⃣ Get all menu items
  Scenario: Get all menu items
    Given url baseUrl + '/inventory'
    When method get
    Then status 200
    And assert response.data.length >= 9
    And match each response.data contains { "id": "#string", "name": "#string", "price": "#string", "image": "#string" }

  # 2️⃣ Filter by id
  Scenario: Filter inventory by id
    Given url baseUrl + '/inventory/filter'
    And param id = 3
    When method get
    Then status 200
    # can be broken out into separate asset
    And match response == { "id": "3", "name": "Baked Rolls x 8", "price": "$10", "image": "roll.png" }

  # 3️⃣ Add item with new id
  Scenario: Add new inventory item
    Given url baseUrl + '/inventory/add'
    #break out into independant json
    And request newItem
    When method POST
    Then status 200

  # 4️⃣ Add item with existing id
  Scenario: Add duplicate inventory item
    Given url baseUrl + '/inventory/add'
    And request newItem
    When method POST
    Given url baseUrl + '/inventory/add'
    And request newItem
    When method POST
    Then status 400

  # 5️⃣ Add item with missing info
  Scenario: Add item with missing data
    Given url baseUrl + '/inventory/add'
    # missing id and image
    And request { "name": "Hawaiian", "price": "$14" }  
    When method POST
    Then status 400
    And match response == 'Not all requirements are met'

  # 6️⃣ Verify recently added item is present
  Scenario: Verify new item in inventory
    Given url baseUrl + '/inventory'
    When method get
    Then status 200
    And match response.data contains { "id": "10", "name": "Hawaiian", "image": "hawaiian.png", "price": "$14" }