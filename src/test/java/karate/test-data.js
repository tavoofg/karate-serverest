function fn() {
    var timestamp = new Date().getTime();

    return {
        // Usuario válido administrador
        usuarioAdmin: {
            nome: 'QA Admin Test',
            email: 'admin_' + timestamp + '@qa.com',
            password: 'teste123',
            administrador: 'true'
        },
        // Usuario válido no administrador
        usuarioNormal: {
            nome: 'QA User Test',
            email: 'user_' + timestamp + '@qa.com',
            password: 'teste123',
            administrador: 'false'
        },
        // Usuario con email ya existente en ServeRest
        usuarioEmailExistente: {
            nome: 'Fulano Beltrano',
            email: 'fulano@qa.com',
            password: 'teste',
            administrador: 'true'
        },
        // Datos actualizados
        usuarioActualizado: {
            nome: 'Usuario Actualizado QA',
            email: 'updated_' + timestamp + '@qa.com',
            password: 'newPass123',
            administrador: 'false'
        },
        // ID inexistente para pruebas negativas
        idInexistente: 'id_inexistente_qa_123'
    };
}