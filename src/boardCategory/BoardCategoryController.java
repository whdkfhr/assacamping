package boardCategory;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/boardCategory/*")
public class BoardCategoryController extends HttpServlet {
	
	BoardCategoryService boardCategoryService;
	BoardCategoryVO boardCategoryVO;

	@Override
	public void init() throws ServletException {
		boardCategoryService = new BoardCategoryService();
		boardCategoryVO = new BoardCategoryVO();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	
}






















