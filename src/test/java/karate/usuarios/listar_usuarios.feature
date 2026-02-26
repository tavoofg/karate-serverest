Feature: GET /usuarios - Listar Usuarios

  Background:
    * url baseUrl
    * def testData = call read('classpath:karate/test-data.js')

  @smoke @positive
  Scenario: Listar todos los usuarios exitosamente
    Given path '/usuarios'
    When method GET
    Then status 200
    And match response == { quantidade: '#number', usuarios: '#array' }
    And match response.quantidade >= 0

  @positive
  Scenario: Listar usuarios con filtro por nombre
    Given path '/usuarios'
    And param nome = testData.usuarioEmailExistente.nome
    When method GET
    Then status 200
    And match response == { quantidade: '#number', usuarios: '#array' }

  @positive
  Scenario: Listar usuarios con filtro por administrador
    Given path '/usuarios'
    And param administrador = 'true'
    When method GET
    Then status 200
    And match response == { quantidade: '#number', usuarios: '#array' }