package web.app.eng;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.app.eng.NewsBean;

/**
 * Servlet implementation class ControlServlet
 */
@WebServlet(urlPatterns="/control", displayName="ControlServlet")
public class ControlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControlServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String tagName       = request.getParameter("tagName");
		String searchValue   = request.getParameter("searchValue");
		String keywords      = request.getParameter("keywords");
		String people        = request.getParameter("people");
		String organizations = request.getParameter("organizations");
		String locations     = request.getParameter("locations");
		NewsBean news = (NewsBean) request.getSession().getAttribute("news");
		news.setSearchedIndexes(tagName, searchValue, keywords, people, organizations, locations);
		
		RequestDispatcher rd = request.getRequestDispatcher("results.jsp?idx=0");
		rd.forward(request, response);
	}

}
