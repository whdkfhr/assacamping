package productCart;

import java.util.List;
import java.util.Map;

public class productCartService {
	productCartDAO dao=new productCartDAO();
	                         
	public List<productCartVO> allcartList(String userId){//전제창바구니 조회
		System.out.println(userId+"Service");
		return dao.allcartList(userId);
	}
	

   public List<Integer> allDeleteCart(String userId) {//전체 장바구니 삭제
	  
	   List<Integer> productNoList=dao.selectRemoveCart(userId);
	   
	   dao.allDeleteCart(userId);
	   
	   return productNoList;
   }
   
   public void update(productCartVO vo) {//장바구니수량 수정
	 
	   dao.cartUpdate(vo);
   }
   
   public void deleteCart(String userId,int productNo ) {//한개의 상품 삭제
	   dao.deleteCart(userId, productNo);
   }
   
   public void addcart(productCartVO vo) {
	   dao.addCartList(vo);
   }
   
  public Map<String,Integer> TotalPrice(String userId) {
	  return dao.TotalPrice(userId);
  }
  
  public Integer cartTotalCount(String userId) {
	  
	  return dao.cartTotalCount(userId);
	  
  }
}
