Feature: GET /usuarios/{_id} - Buscar Usuario por ID

  Background:
    * url baseUrl
    * def testData = call read('classpath:karate/test-data.js')

  @smoke @positive
  Scenario: Buscar usuario por ID exitosamente
    # Primero creamos un usuario
    Given path '/usuarios'
    And request testData.usuarioAdmin
    When method POST
    Then status 201
    * def userId = response._id

    # Luego lo buscamos por ID
    Given path '/usuarios/' + userId
    When method GET
    Then status 200
    And match response._id == userId
    And match response == { _id: '#string', nome: '#string', email: '#string', password: '#string', administrador: '#string' }

  @negative
  Scenario: Buscar usuario con ID inexistente
    Given path '/usuarios/' + testData.idInexistente
    When method GET
    Then status 400
    And match response.message == 'Usuário não encontrado'