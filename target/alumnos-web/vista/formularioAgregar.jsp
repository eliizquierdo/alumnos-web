<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="es">

    <head>
        <meta charset="UTF-8">
        <title>Agregar Persona</title>

        <%-- Variable Java pura para obtener la ruta base del proyecto --%>
            <% String baseURL=request.getContextPath(); %>
                <link rel="stylesheet" href="<%= baseURL %>/css/estilos.css">
    </head>

    <body>
        <div class="contenedor">
            <header>
                <h1>Registro de Personas</h1>
            </header>
            <section>
                <h2>Formulario para agregar una nueva persona</h2>

                <form action="<%= baseURL %>/persona?action=agregar" method="post">
                    <div>
                        <label for="codigo">Código:</label>
                        <input type="number" name="codigo" id="codigo" required>
                    </div>
                    <div>
                        <label for="nombre">Nombre:</label>
                        <input type="text" name="nombre" id="nombre" required>
                    </div>
                    <button type="submit">Guardar</button>
                </form>
            </section>

            <div class="volver">
                <a href="<%= baseURL %>/persona?action=listar">Volver al listado</a>
            </div>
            <footer>
                <p>&copy; 2025 - Proyecto alumnos-web</p>
            </footer>
        </div>
    </body>

    </html>