Feature: DELETE /usuarios/{_id} - Eliminar Usuario

  Background:
    * url baseUrl
    * def testData = call read('classpath:karate/test-data.js')

  @smoke @positive
  Scenario: Eliminar usuario exitosamente
    # Primero creamos un usuario
    Given path '/usuarios'
    And request testData.usuarioAdmin
    When method POST
    Then status 201
    * def userId = response._id

    # Luego lo eliminamos
    Given path '/usuarios/' + userId
    When method DELETE
    Then status 200
    And match response.message == 'Registro excluído com sucesso'

  @negative
  Scenario: Eliminar usuario con ID inexistente
    Given path '/usuarios/' + testData.idInexistente
    When method DELETE
    Then status 200
    And match response.message == 'Nenhum registro excluído'