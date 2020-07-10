package product;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import productCategory.ProductCategoryService;
import productCategory.ProductCategoryVO;

@SuppressWarnings("serial")
@WebServlet("/pro/*")
public class ProductController extends HttpServlet{
	
	ProductService productService;
	ProductVO productVO;	
	ProductCategoryService productCategoryService;
	ProductCategoryVO productCategoryVO;
	String realPath = "";
	
	@Override
	public void init() throws ServletException {
		productService = new ProductService();
		productVO = new ProductVO();
		productCategoryService = new ProductCategoryService();
		productCategoryVO = new ProductCategoryVO();
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
		String nextPage = "";
		realPath = request.getServletContext().getRealPath("/files/product");
		HttpSession session = request.getSession();		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String action = request.getPathInfo();
		System.out.println("action: " + action);

		if(action == null || action.equals("/listProduct.do")) {

			setPagination(request);
			
			Map<String, Object> searchMap = new HashMap<String, Object>();
			searchMap.put("pageNo", request.getAttribute("pageNo"));
			searchMap.put("searchKeyword", request.getAttribute("searchKeyword"));
			searchMap.put("searchCategoryNo", request.getAttribute("searchCategoryNo"));
			searchMap.put("sortType", request.getAttribute("sortType"));

			Map<String, Object> productListMap = productService.listProduct(searchMap);			
			request.setAttribute("productListMap", productListMap);
			
			List<ProductCategoryVO> productCategoryList = productCategoryService.listProductCategory();			
			request.setAttribute("productCategoryList", productCategoryList);

			if(request.getAttribute("alertMsg")!=null) {
				request.setAttribute("alertMsg", request.getAttribute("alertMsg"));
			}
			session.setAttribute("userId", session.getAttribute("userId"));
			nextPage = "/product/listProduct.jsp";
			
		}else if(action.equals("/readProduct.do")) {

			setPagination(request);
			
			int productNo = Integer.parseInt(request.getParameter("productNo"));			
			Map<String, Object> productMap = productService.readProduct(productNo);			
			request.setAttribute("productMap", productMap);
			
			if(request.getAttribute("alertMsg")!=null) {
				request.setAttribute("alertMsg", request.getAttribute("alertMsg"));
			}
			session.setAttribute("userId", session.getAttribute("userId"));
			nextPage = "/product/readProduct.jsp";
			
		}
		
		if(!nextPage.equals("")) {
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
		}
	}

	private void setPagination(HttpServletRequest request) {
		try {
			int pageNo = 1;
			if(request.getParameter("pageNo")!=null) {
				pageNo = Integer.parseInt(request.getParameter("pageNo"));
			}
			if(request.getAttribute("pageNo")==null) {
				request.setAttribute("pageNo", pageNo);
			}
			
			String searchKeyword = "";
			if(request.getParameter("searchKeyword")!=null) {
				searchKeyword = request.getParameter("searchKeyword");
			}
			if(request.getAttribute("searchKeyword")==null) {
				request.setAttribute("searchKeyword", searchKeyword);
			}
			
			int searchCategoryNo = 0;
			if(request.getParameter("searchCategoryNo")!=null) {
				searchCategoryNo = Integer.parseInt(request.getParameter("searchCategoryNo"));
			}
			if(request.getAttribute("searchCategoryNo")==null) {
				request.setAttribute("searchCategoryNo", searchCategoryNo);
			}		
			
			String sortType = "";
			if(request.getParameter("sortType")!=null) {
				sortType = request.getParameter("sortType");
			}
			if(request.getAttribute("sortType")==null) {
				request.setAttribute("sortType", sortType);
			}
			System.out.println("pageNo: " + pageNo);
			System.out.println("searchKeyword: " + searchKeyword);
			System.out.println("searchCategoryNo: " + searchCategoryNo);
			System.out.println("sortType: " + sortType);
		} catch (Exception e) {
			System.out.println("setPagination()메소드 내부에서 오류 : " + e.toString());
		}
	}
	
}
