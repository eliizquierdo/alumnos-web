package controlador;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.dao.PersonaDAO;
import modelo.vo.PersonaVO;

@WebServlet("/persona")
public class PersonaControladorServlet extends HttpServlet {

    private PersonaDAO dao = new PersonaDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null)
            action = "listar";

        switch (action) {
            case "cargarEditar":
                cargarEditar(request, response);
                break;
            case "eliminar":
                eliminar(request, response);
                break;
            default:
                listar(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ✅ Establecer la codificación al inicio del POST
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        switch (action) {
            case "agregar":
                agregar(request, response);
                break;
            case "editar":
                editar(request, response);
                break;
        }
    }

    private void agregar(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        PersonaVO p = new PersonaVO();

        try {
            p.setCodigo(Integer.parseInt(request.getParameter("codigo")));
        } catch (NumberFormatException e) {
            response.sendRedirect("formularioAgregar.jsp?error=codigo_invalido");
            return;
        }

        p.setNombre(request.getParameter("nombre"));
        dao.agregar(p);

        response.setContentType("text/html;charset=UTF-8");
        response.sendRedirect("persona?action=listar");
    }

    private void editar(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        PersonaVO p = new PersonaVO();
        p.setCodigo(Integer.parseInt(request.getParameter("codigo")));
        p.setNombre(request.getParameter("nombre"));

        dao.actualizar(p);

        response.setContentType("text/html;charset=UTF-8");
        response.sendRedirect("persona?action=listar");
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int codigo = Integer.parseInt(request.getParameter("codigo"));
        dao.eliminar(codigo);

        response.setContentType("text/html;charset=UTF-8");
        response.sendRedirect("persona?action=listar");
    }

    private void cargarEditar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int codigo = Integer.parseInt(request.getParameter("codigo"));
        PersonaVO persona = dao.obtenerXCodigo(codigo);

        if (persona != null) {
            request.setAttribute("persona", persona);
            request.getRequestDispatcher("vista/formularioEditar.jsp").forward(request, response);
        } else {
            response.setContentType("text/html;charset=UTF-8");
            response.sendRedirect("persona?action=listar");
        }
    }

    private void listar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<PersonaVO> listaPersonas = dao.getLista();
        request.setAttribute("personas", listaPersonas);
        request.getRequestDispatcher("vista/listar.jsp").forward(request, response);
    }
}
