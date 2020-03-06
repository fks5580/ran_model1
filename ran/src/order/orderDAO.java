package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class orderDAO {
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DataSource ds = null;
    String sql = "";
    Statement stmt =null;
    
    orderBean oBean = new orderBean();
    
    //DB연결
    private Connection getorderConnection() throws Exception {
        Context ctx = new InitialContext();
        ds = (DataSource)ctx.lookup("java:comp/env/jdbc/jspbeginner");
        return ds.getConnection();
    }
    
    //DB연결 해제
    private void closeorderConnection(){
        try {
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
            if(con != null) con.close();
            if(stmt != null) stmt.close();
        } catch (SQLException e) {
            System.out.println("closeConnection()硫붿냼�뱶�뿉�꽌 �삤瑜�:" +e);
        }
    }
  //주문
    public void insertOrder(orderBean oBean){
        int order_no;
        try{
            con = getorderConnection();
            sql = "select max(order_no) from shoporder";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            if(rs.next()){
                order_no = rs.getInt(1) + 1;
            }else{
                order_no = 1;             
            }
            sql = "insert into shoporder values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, order_no);
            pstmt.setString(2, oBean.getOrder_id());
            pstmt.setString(3, oBean.getOrder_name());
            pstmt.setString(4, oBean.getOrder_country());
            pstmt.setString(5, oBean.getOrder_city());
            pstmt.setString(6, oBean.getOrder_address());
            pstmt.setString(7, oBean.getOrder_address1());
            pstmt.setString(8, oBean.getOrder_address2());
            pstmt.setString(9, oBean.getDelivery_option());
            pstmt.setString(10, oBean.getOrder_payment());
            pstmt.setString(11, oBean.getOrder_card_name());
            pstmt.setString(12, oBean.getOrder_card_number());
            pstmt.setString(13, oBean.getOrder_expiration_date());
            pstmt.setString(14, oBean.getOrder_card_cvc());
            pstmt.setString(15, oBean.getShipping_option());
            pstmt.setString(16, oBean.getOrder_total());
            pstmt.setInt(17,oBean.getCart_product1());
            pstmt.setInt(18,oBean.getCart_product2());
            pstmt.setInt(19,oBean.getCart_product3());
            pstmt.setInt(20,oBean.getCart_product4());
            pstmt.setInt(21,oBean.getCart_product5());
            pstmt.setInt(22,oBean.getCart_product6());
            pstmt.setInt(23,oBean.getCart_product7());
            pstmt.setInt(24,oBean.getCart_product8());
            pstmt.setInt(25,oBean.getCart_product9());
            pstmt.setInt(26,oBean.getCart_product10());
            pstmt.executeUpdate();
            if(oBean.getCart_product1()!=0){
                sql="select * from shopproduct where product_no=?";
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1,oBean.getCart_product1());   
                rs = pstmt.executeQuery();
                if(rs.next()){
                    sql = "update shopproduct set product_count=product_count-1 where product_no=?";
                    pstmt = con.prepareStatement(sql);
                    pstmt.setInt(1,oBean.getCart_product1()); 
                    pstmt.executeUpdate();
                }
            }
            if(oBean.getCart_product2()!=0){
                sql="select * from shopproduct where product_no=?";
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1,oBean.getCart_product2());   
                rs = pstmt.executeQuery();
                if(rs.next()){
                    sql = "update shopproduct set product_count=product_count-1 where product_no=?";
                    pstmt = con.prepareStatement(sql);
                    pstmt.setInt(1,oBean.getCart_product2()); 
                    pstmt.executeUpdate();
                }
            }
            if(oBean.getCart_product3()!=0){
                sql="select * from shopproduct where product_no=?";
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1,oBean.getCart_product3());   
                rs = pstmt.executeQuery();
                if(rs.next()){
                    sql = "update shopproduct set product_count=product_count-1 where product_no=?";
                    pstmt = con.prepareStatement(sql);
                    pstmt.setInt(1,oBean.getCart_product3()); 
                    pstmt.executeUpdate();
                }
            }
            if(oBean.getCart_product4()!=0){
                sql="select * from shopproduct where product_no=?";
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1,oBean.getCart_product4());   
                rs = pstmt.executeQuery();
                if(rs.next()){
                    sql = "update shopproduct set product_count=product_count-1 where product_no=?";
                    pstmt = con.prepareStatement(sql);
                    pstmt.setInt(1,oBean.getCart_product4()); 
                    pstmt.executeUpdate();
                }
            }
            if(oBean.getCart_product5()!=0){
                sql="select * from shopproduct where product_no=?";
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1,oBean.getCart_product5());   
                rs = pstmt.executeQuery();
                if(rs.next()){
                    sql = "update shopproduct set product_count=product_count-1 where product_no=?";
                    pstmt = con.prepareStatement(sql);
                    pstmt.setInt(1,oBean.getCart_product1()); 
                    pstmt.executeUpdate();
                }
            }
            if(oBean.getCart_product6()!=0){
                sql="select * from shopproduct where product_no=?";
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1,oBean.getCart_product6());   
                rs = pstmt.executeQuery();
                if(rs.next()){
                    sql = "update shopproduct set product_count=product_count-1 where product_no=?";
                    pstmt = con.prepareStatement(sql);
                    pstmt.setInt(1,oBean.getCart_product1()); 
                    pstmt.executeUpdate();
                }
            }
            if(oBean.getCart_product7()!=0){
                sql="select * from shopproduct where product_no=?";
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1,oBean.getCart_product7());   
                rs = pstmt.executeQuery();
                if(rs.next()){
                    sql = "update shopproduct set product_count=product_count-1 where product_no=?";
                    pstmt = con.prepareStatement(sql);
                    pstmt.setInt(1,oBean.getCart_product1()); 
                    pstmt.executeUpdate();
                }
            }
            if(oBean.getCart_product8()!=0){
                sql="select * from shopproduct where product_no=?";
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1,oBean.getCart_product8());   
                rs = pstmt.executeQuery();
                if(rs.next()){
                    sql = "update shopproduct set product_count=product_count-1 where product_no=?";
                    pstmt = con.prepareStatement(sql);
                    pstmt.setInt(1,oBean.getCart_product1()); 
                    pstmt.executeUpdate();
                }
            }
            if(oBean.getCart_product9()!=0){
                sql="select * from shopproduct where product_no=?";
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1,oBean.getCart_product9());   
                rs = pstmt.executeQuery();
                if(rs.next()){
                    sql = "update shopproduct set product_count=product_count-1 where product_no=?";
                    pstmt = con.prepareStatement(sql);
                    pstmt.setInt(1,oBean.getCart_product9()); 
                    pstmt.executeUpdate();
                }
            }
            if(oBean.getCart_product10()!=0){
                sql="select * from shopproduct where product_no=?";
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1,oBean.getCart_product10());   
                rs = pstmt.executeQuery();
                if(rs.next()){
                    sql = "update shopproduct set product_count=product_count-1 where product_no=?";
                    pstmt = con.prepareStatement(sql);
                    pstmt.setInt(1,oBean.getCart_product10()); 
                    pstmt.executeUpdate();
                }
            }
            sql = "update shopcart set cart_product1=0,cart_product2=0,cart_product3=0,"
                    + "cart_product4=0,cart_product5=0,cart_product6=0,cart_product7=0,"
                    + "cart_product8=0,cart_product9=0,cart_product10=0 "
                    + "where cart_id='"+oBean.getOrder_id()+"'";
            stmt = con.createStatement();
            stmt.executeUpdate(sql);
            
            }catch(Exception e){
                System.out.println("insertOrder()에서 오류 :"+e);
            }finally{
                closeorderConnection();
            }
        }
}
