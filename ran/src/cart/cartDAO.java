package cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class cartDAO {
     Connection con = null;
     PreparedStatement pstmt = null;
     ResultSet rs = null;
     DataSource ds = null;
     String sql = "";
     Statement stmt =null;
     
     cartBean cBean = new cartBean();
     
     //DB����
     private Connection getcartConnection() throws Exception {
         Context ctx = new InitialContext();
         ds = (DataSource)ctx.lookup("java:comp/env/jdbc/jspbeginner");
         return ds.getConnection();
     }
     
     //DB���� ����
     private void closecartConnection(){
         try {
             if(rs != null) rs.close();
             if(pstmt != null) pstmt.close();
             if(con != null) con.close();
             if(stmt != null) stmt.close();
           
         } catch (SQLException e) {
             System.out.println("closecartConnection()���� ����  : " +e);
         }
     }
     
     //��ٱ��� �߰�
     public void insertCart(cartBean cBean){
         try{
	             con = getcartConnection(); 
	             sql="select * from shopcart where cart_no="+cBean.getCart_no();
	             stmt = con.createStatement();
	             rs = stmt.executeQuery(sql);
	             while(rs.next()){
    	             if(rs.getInt("cart_product1")==0){
        	             sql="update shopcart set cart_product1="+cBean.getCart_product1()+" where cart_no=?";
        	             pstmt = con.prepareStatement(sql);
        	             pstmt.setInt(1, cBean.getCart_no());
        	             pstmt.executeUpdate();
    	             }else if(rs.getInt("cart_product2")==0){
        	             sql="update shopcart set cart_product2="+cBean.getCart_product1()+" where cart_no=?";
                         pstmt = con.prepareStatement(sql);
                         pstmt.setInt(1, cBean.getCart_no());
                         pstmt.executeUpdate();
    	             }else if(rs.getInt("cart_product3")==0){
                         sql="update shopcart set cart_product3="+cBean.getCart_product1()+" where cart_no=?";
                         pstmt = con.prepareStatement(sql);
                         pstmt.setInt(1, cBean.getCart_no());
                         pstmt.executeUpdate();
                     }else if(rs.getInt("cart_product4")==0){
                         sql="update shopcart set cart_product4="+cBean.getCart_product1()+" where cart_no=?";
                         pstmt = con.prepareStatement(sql);
                         pstmt.setInt(1, cBean.getCart_no());
                         pstmt.executeUpdate();
                     }else if(rs.getInt("cart_product5")==0){
                         sql="update shopcart set cart_product5="+cBean.getCart_product1()+" where cart_no=?";
                         pstmt = con.prepareStatement(sql);
                         pstmt.setInt(1, cBean.getCart_no());
                         pstmt.executeUpdate();
                     }else if(rs.getInt("cart_product6")==0){
                         sql="update shopcart set cart_product6="+cBean.getCart_product1()+" where cart_no=?";
                         pstmt = con.prepareStatement(sql);
                         pstmt.setInt(1, 1);
                         pstmt.executeUpdate();
                     }else if(rs.getInt("cart_product7")==0){
                         sql="update shopcart set cart_product7="+cBean.getCart_product1()+" where cart_no=?";
                         pstmt = con.prepareStatement(sql);
                         pstmt.setInt(1, cBean.getCart_no());
                         pstmt.executeUpdate();
                     }else if(rs.getInt("cart_product8")==0){
                         sql="update shopcart set cart_product8="+cBean.getCart_product1()+" where cart_no=?";
                         pstmt = con.prepareStatement(sql);
                         pstmt.setInt(1, cBean.getCart_no());
                         pstmt.executeUpdate();
                     }else if(rs.getInt("cart_product9")==0){
                         sql="update shopcart set cart_product9="+cBean.getCart_product1()+" where cart_no=?";
                         pstmt = con.prepareStatement(sql);
                         pstmt.setInt(1, cBean.getCart_no());
                         pstmt.executeUpdate();
                     }else{
                         sql="update shopcart set cart_product10="+cBean.getCart_product1()+" where cart_no=?";
                         pstmt = con.prepareStatement(sql);
                         pstmt.setInt(1, cBean.getCart_no());
                         pstmt.executeUpdate();
                     }
    	            
	             }
             }catch(Exception e){
                 System.out.println("insertCart()���� ���� :"+e);
             }finally{
                 closecartConnection();
             }
     }
     
     //��ٱ��� ��ǰ ����
     public void deleteCart(String cart_id,String cart_product){
         try{
             con = getcartConnection();
             sql = "update shopcart set "+cart_product+"=null where cart_id='"+cart_id+"'";
             stmt = con.createStatement();
             stmt.executeUpdate(sql);
             
         }catch(Exception e){
             System.out.println("deleteCart()���� ���� :" + e);
         }finally{
             closecartConnection();
         }
         
     }    
     
     //��ٱ��� ��ȸ
     public cartBean getCart(String cart_id){
         try{
             con = getcartConnection();
             sql = "select * from shopcart where cart_id='"+cart_id+"'";
             stmt = con.createStatement();
             rs = stmt.executeQuery(sql);
             
             while(rs.next()){
                 cBean.setCart_id(rs.getString("cart_id"));
                 cBean.setCart_no(rs.getInt("cart_no"));
                 cBean.setCart_product1(rs.getInt("cart_product1"));
                 cBean.setCart_product2(rs.getInt("cart_product2"));
                 cBean.setCart_product3(rs.getInt("cart_product3"));
                 cBean.setCart_product4(rs.getInt("cart_product4"));
                 cBean.setCart_product5(rs.getInt("cart_product5"));
                 cBean.setCart_product6(rs.getInt("cart_product6"));
                 cBean.setCart_product7(rs.getInt("cart_product7"));
                 cBean.setCart_product8(rs.getInt("cart_product8"));
                 cBean.setCart_product9(rs.getInt("cart_product9"));
                 cBean.setCart_product10(rs.getInt("cart_product10"));
             }
                     
         }catch(Exception e){
                 System.out.println("getCart()���� ���� :"+e);
         }finally{
             closecartConnection();  
         }
             return cBean;
         }
   
     //��ǰ ������ ��ٱ��Ͽ��� ��ǰ����
     public void deleteproductCart(int product_no){
    	 try{
             con = getcartConnection();
             for(int i=1;i<=10;i++){
             sql = "update shopcart set cart_product"+i+"=null where cart_product"+i+"="+product_no;
             stmt = con.createStatement();
             stmt.executeUpdate(sql);
             }
             
         }catch(Exception e){
             System.out.println("deleteproductCart()���� ���� :" + e);
         }finally{
             closecartConnection();
         }
     }
     
     
}
