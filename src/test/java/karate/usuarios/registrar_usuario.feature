Feature: POST /usuarios - Registrar Usuario

  Background:
    * url baseUrl
    * def testData = call read('classpath:karate/test-data.js')

  @smoke @positive
  Scenario: Registrar un nuevo usuario administrador exitosamente
    Given path '/usuarios'
    And request testData.usuarioAdmin
    When method POST
    Then status 201
    And match response.message == 'Cadastro realizado com sucesso'
    And match response._id == '#string'

  @positive
  Scenario: Registrar un nuevo usuario no administrador exitosamente
    Given path '/usuarios'
    And request testData.usuarioNormal
    When method POST
    Then status 201
    And match response.message == 'Cadastro realizado com sucesso'
    And match response._id == '#string'

  @negative
  Scenario: Registrar usuario con email ya existente
    Given path '/usuarios'
    And request testData.usuarioEmailExistente
    When method POST
    Then status 400
    And match response.message == 'Este email já está sendo usado'

  @negative
  Scenario: Registrar usuario sin campo nombre
    Given path '/usuarios'
    And request { nome: '', email: #(testData.usuarioAdmin.email), password: 'teste123', administrador: 'true' }
    When method POST
    Then status 400
    And match response.nome == '#string'

  @negative
  Scenario: Registrar usuario sin campo email
    Given path '/usuarios'
    And request { nome: 'Test User', email: '', password: 'teste123', administrador: 'true' }
    When method POST
    Then status 400
    And match response.email == '#string'