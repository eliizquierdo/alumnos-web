<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="java.util.List" %>
        <%@ page import="modelo.vo.PersonaVO" %>
            <% String baseURL=request.getContextPath(); List<PersonaVO> personas = (List<PersonaVO>)
                    request.getAttribute("personas");
                    %>
                    <!DOCTYPE html>
                    <html lang="es">

                    <head>
                        <meta charset="UTF-8">
                        <title>Listado de Personas</title>
                        <link rel="stylesheet" href="<%= baseURL %>/css/estilos.css">
                    </head>

                    <body>
                        <div class="contenedor">
                            <header>
                                <h1>Listado de personas registradas</h1>
                            </header>

                            <table>
                                <thead>
                                    <tr>
                                        <th>Código</th>
                                        <th>Nombre</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% if (personas !=null) { for (PersonaVO p : personas) { %>
                                        <tr>
                                            <td>
                                                <%= p.getCodigo() %>
                                            </td>
                                            <td>
                                                <%= p.getNombre() %>
                                            </td>

                                            <td>
                                                <a
                                                    href="<%= baseURL %>/persona?action=cargarEditar&codigo=<%= p.getCodigo() %>">Editar</a>
                                                <a href="<%= baseURL %>/persona?action=eliminar&codigo=<%= p.getCodigo() %>"
                                                    onclick="return confirm('¿Estás seguro que deseas eliminar esta persona?');">Eliminar</a>
                                            </td>
                                        </tr>
                                        <% } } %>
                                </tbody>
                            </table>

                            <div class="volver">
                                <a href="<%= baseURL %>/vista/formularioAgregar.jsp">Agregar nueva persona</a>
                            </div>

                            <footer>
                                <p>&copy; 2025 - Proyecto alumnos-web</p>
                            </footer>
                        </div>
                    </body>

                    </html>