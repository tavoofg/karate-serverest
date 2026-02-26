@ignore
Feature: Helpers - Utilidades para generación de datos de prueba

  Scenario: Crear usuario administrador y retornar ID
    * def testData = call read('classpath:karate/test-data.js')
    Given url baseUrl
    And path '/usuarios'
    And request testData.usuarioAdmin
    When method POST
    Then status 201
    * def userId = response._id

  Scenario: Crear usuario normal y retornar ID
    * def testData = call read('classpath:karate/test-data.js')
    Given url baseUrl
    And path '/usuarios'
    And request testData.usuarioNormal
    When method POST
    Then status 201
    * def userId = response._id