@ignore
Feature: Helpers - Utilidades para generación de datos de prueba

  Background:
    * def testData = call read('classpath:karate/test-data.js')
    Given url baseUrl
    And path '/usuarios'

  @CrearAdmin
  Scenario: Crear usuario administrador y retornar ID
    And request testData.usuarioAdmin
    When method POST
    Then status 201
    * def userId = response._id

  @CrearNormal
  Scenario: Crear usuario normal y retornar ID
    And request testData.usuarioNormal
    When method POST
    Then status 201
    * def userId = response._id