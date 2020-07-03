package productOrder;

import java.io.IOException;
import java.util.ArrayList;
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



import productCart.productCartService;
import productCart.productCartVO;
import productList.productListService;
import productList.productListVO;
import user.UserDAO;
import user.UserVO;





@WebServlet("/cartorder/*")
public class OrderController extends HttpServlet{
	
	
	@Override
	public void init() throws ServletException {
		
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		doHandle(request,response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		doHandle(request,response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		OrderVO vo= new OrderVO();
		HttpSession session = request.getSession();
		OrderService orderservice = new OrderService();
		String nextPage = "";
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		Map<String, Integer> totalPrice=null;
		productCartService procartservice=new productCartService();
		List<productCartVO> orderList = new ArrayList();
		String action = request.getPathInfo();
		System.out.println("action"+action);
		try {
			
			
			if(action == null ||action.equals("/order.do")) {//결제주문정보 
				 
				 totalPrice=new HashMap<String, Integer>();
				
				String userId=(String)session.getAttribute("userId");
				
				orderList=procartservice.allcartList(userId);
				//System.out.println(orderList);
				   totalPrice =procartservice.TotalPrice(userId);
				/* System.out.println(totalPrice); */
				int ordercount=orderservice.orderCount(userId);
				
			   	request.setAttribute("orderList", orderList);
				
			  request.setAttribute("ordercount", ordercount);//주문한 상품 총 개수
				
			    request.setAttribute("map", totalPrice);
			    
			      UserDAO dao=new UserDAO();
				  UserVO uservo= dao.findUser(userId); //회원정보DAO에서 배송주소 정보 얻어오기
				  
				 request.setAttribute("uservo", uservo);
				 
				
			   	nextPage="/order/checkout.jsp";
				
			}else if(action.equals("/pay.do")) {//상품정보랑 회원배송지 뿌려주는창
			      
			     
			
			     String userId=(String)session.getAttribute("userId");
			     String userEmail=request.getParameter("userEmail");
			     String productPayment1=request.getParameter("productPayment");// 총결제금액 
			     int productPayment=Integer.parseInt(productPayment1.split(",")[0]);
			     System.out.println(productPayment);
			     String userZipcode=request.getParameter("userZipcode"); 
				 System.out.println(userZipcode);
				 String userAddress1=request.getParameter("userAddress1"); 
				 String userAddress2=request.getParameter("userAddress2"); 
				 String userName=request.getParameter("userName");
				 String userPhone=request.getParameter("userPhone");
				 String userComment=request.getParameter("userComment");
				 int  productDelivery=Integer.parseInt(request.getParameter("productDelivery"));
				 System.out.println(userComment);
			     System.out.println(productDelivery);
			     String orderState="구매완료";
			     int orderNo=orderservice.orderNoCount();
			     
			     vo.setProductPayment(productPayment);
			     vo.setUserId(userId);
			     vo.setUserEmail(userEmail);
				 vo.setUserZipcode(userZipcode);
				 vo.setUserAddress1(userAddress1);
				 vo.setUserAddress2(userAddress2);
				 vo.setUserName(userName);
				 vo.setUserPhone(userPhone);
				 vo.setUserComment(userComment);
				 vo.setOrderState(orderState);
				 vo.setProductDelivery(productDelivery);
				 vo.setOrderNo(orderNo);
				 
	            List<productCartVO> orderList1=(List<productCartVO>)session.getAttribute("orderList");
	              
				  orderservice.addOrder(orderList1,vo);
			    
				 session.setAttribute("userId", userId); 
				 session.setAttribute("orderNo", orderNo);
				 System.out.println(orderNo);
				 
				 nextPage="/cartorder/paypro.do";
				 
			}else if(action.equals("/paypro.do")) {//실제 결제가되고 결제확인창으로 넘어감
				
				String userId=(String)session.getAttribute("userId");
				System.out.println(userId);
				int orderNo=(Integer)session.getAttribute("orderNo");
				System.out.println(orderNo);
				productCartService cartservice=new productCartService();
				 
				//cartservice.allDeleteCart(userId); 
			       
				List<OrderVO> orderlist= orderservice.orderList(userId,orderNo);
				
			     request.setAttribute("orderlist", orderlist);
			     
			     session.setAttribute("userId", userId);
			     
				nextPage="/order/orderInfo.jsp";
				
			}else if(action.equals("/orderDetail.do")) {
				
				int productNo=Integer.parseInt(request.getParameter("prodcutNo"));
				
				productListService listservice= new productListService();
				
				productListVO onepro=listservice.getOnePro(productNo);
				
				request.setAttribute("onepro", onepro);
				
				nextPage="/product/prodcutInfo.jsp";
				
			}else if(action.equals("/orderList.do")) {
				
			    String userId=(String)session.getAttribute("userId");
				
			    System.out.println(userId);
				
				List<OrderVO> payList=orderservice.payList(userId);
				List<OrderVO> orderNo=orderservice.orderNo(userId);
				
				System.out.println(payList);
				
				request.setAttribute("orderNo", orderNo);
				request.setAttribute("payList", payList);
				
				nextPage="/mypage/myOrderList.jsp";
			}else if(action.equals("/orderInfo.do")) {
				String userId=(String)session.getAttribute("userId");
				System.out.println(userId);
				int orderNo= Integer.parseInt(request.getParameter("orderNo"));
				System.out.println(orderNo);
				
				List<OrderVO> orderInfo=orderservice.orderInfo(userId, orderNo);
				
				request.setAttribute("orderInfo", orderInfo);
				
				nextPage="/mypage/myOrderInfo.jsp";
			}else if(action.equals("/orderDelete.do")) {
			
				int orderNo=Integer.parseInt(request.getParameter("orderNo"));
				String userId=(String)session.getAttribute("userId");
				
				orderservice.orderDelete(userId, orderNo);
				 session.setAttribute("userId", userId); 
				nextPage="/mypage/myOrderList.jsp";
		
			}
			
			
			 if(!nextPage.equals("")) {
				 
				 
			RequestDispatcher dispatch = 
					request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
			 }
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			
		}
		
	}
}
