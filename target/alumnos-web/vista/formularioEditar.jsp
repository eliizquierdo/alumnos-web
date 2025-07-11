<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="modelo.vo.PersonaVO" %>
        <% String baseURL=request.getContextPath(); PersonaVO persona=(PersonaVO) request.getAttribute("persona"); %>
            <!DOCTYPE html>
            <html lang="es">

            <head>
                <meta charset="UTF-8">
                <title>Editar Persona</title>
                <link rel="stylesheet" href="<%= baseURL %>/css/estilos.css">
            </head>

            <body>

                <div class="contenedor">
                    <header>
                        <h1>Registro de Personas</h1>
                    </header>

                    <section>
                        <h2>Editar Persona</h2>

                        <form action="<%= baseURL %>/persona?action=editar" method="post">
                            <div>
                                <label for="codigo">Código:</label>
                                <input type="number" name="codigo" id="codigo" value="<%= persona.getCodigo() %>"
                                    readonly>
                            </div>

                            <div>
                                <label for="nombre">Nombre:</label>
                                <input type="text" name="nombre" id="nombre" value="<%= persona.getNombre() %>"
                                    required>
                            </div>

                            <button type="submit">Actualizar</button>
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