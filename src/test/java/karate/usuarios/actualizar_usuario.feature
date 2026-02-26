Feature: PUT /usuarios/{_id} - Actualizar Usuario

  Background:
    * url baseUrl
    * def testData = call read('classpath:karate/test-data.js')

  @smoke @positive
  Scenario: Actualizar usuario exitosamente
    # Primero creamos un usuario
    Given path '/usuarios'
    And request testData.usuarioAdmin
    When method POST
    Then status 201
    * def userId = response._id

    # Luego lo actualizamos
    Given path '/usuarios/' + userId
    And request testData.usuarioActualizado
    When method PUT
    Then status 200
    And match response.message == 'Registro alterado com sucesso'

  @positive
  Scenario: Crear usuario via PUT con ID inexistente
    Given path '/usuarios/' + testData.idInexistente
    And request testData.usuarioNormal
    When method PUT
    Then status 201
    And match response.message == 'Cadastro realizado com sucesso'

  @negative
  Scenario: Actualizar usuario con email ya existente
    # Primero creamos un usuario
    Given path '/usuarios'
    And request testData.usuarioAdmin
    When method POST
    Then status 201
    * def userId = response._id

    # Intentamos actualizar con email ya existente
    Given path '/usuarios/' + userId
    And request testData.usuarioEmailExistente
    When method PUT
    Then status 400
    And match response.message == 'Este email já está sendo usado'