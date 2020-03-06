package product;

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

import board.boardBean;



public class productDAO {
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DataSource ds = null;
    String sql = "";
    Statement stmt =null;
    
    productBean pBean = new productBean();
    
    //DB연결
    private Connection getproductConnection() throws Exception {
        Context ctx = new InitialContext();
        ds = (DataSource)ctx.lookup("java:comp/env/jdbc/jspbeginner");
        return ds.getConnection();
    }
    
    //DB연결 해제
    private void closeproductConnection(){
        try {
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
            if(con != null) con.close();
            if(stmt != null) stmt.close();
        } catch (SQLException e) {
            System.out.println("closeproductConnection()에서 오류 :" +e);
        }
    }
    
  //상품 추가
    public void insertProduct(productBean pBean){
        int product_no;
        
        try{
            con = getproductConnection();
            sql = "select max(product_no) from shopproduct";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            if(rs.next()){
                product_no = rs.getInt(1) + 1;
            }else{
                product_no = 1;             
            }
                   
            sql = "insert into shopproduct(product_no,product_name,product_price,product_count,product_photo) values(?,?,?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, product_no);
            pstmt.setString(2, pBean.getProduct_name());
            pstmt.setInt(3, pBean.getProduct_price());
            pstmt.setInt(4, pBean.getProduct_count());
            pstmt.setString(5, pBean.getProduct_photo());
            pstmt.executeUpdate();
            
            }catch(Exception e){
                System.out.println("insertProduct()�뿉�꽌 �삤瑜� :"+e);
            }finally{
                closeproductConnection();
            }
        }
    

   //상품목록 조회
    public List<productBean> getProductList(int startRow, int pageSize){
        List<productBean> productList = new ArrayList<productBean>();
            try{
                con = getproductConnection();
                sql = "select * from shopproduct order by product_no desc limit ?,?";
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, startRow);
                pstmt.setInt(2, pageSize);
                rs = pstmt.executeQuery();
                    
                while(rs.next()){
                    productBean pBean = new productBean();
                    pBean.setProduct_no(rs.getInt("product_no"));
                    pBean.setProduct_name(rs.getString("product_name"));
                    pBean.setProduct_price(rs.getInt("product_price"));
                    pBean.setProduct_count(rs.getInt("product_count"));
                    pBean.setProduct_photo(rs.getString("product_photo"));
                    productList.add(pBean);
                    }
                }catch(Exception e){
                    System.out.println("getProductList()에서 오류 :" +e);
                }finally{
                    closeproductConnection();
                }
                return productList;                       
            }
  
   
    //상품삭제
    public void deleteProduct(int product_no){
        try{
            con = getproductConnection();   
            sql = "delete from shopproduct where product_no=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, product_no);
            pstmt.executeUpdate();  
            
        }catch(Exception e){
            System.out.println("deleteProduct()에서 오류 :" + e);
        }finally{
            closeproductConnection();
        }
        
    }                           
    


    //상품수정
    public void updateProduct(productBean pBean){
        
        try{
            con = getproductConnection();
           
                    sql = "update shopproduct set product_name=?,product_price=?,product_count=?,product_photo=? where product_no=?";
                    pstmt = con.prepareStatement(sql);
                    pstmt.setString(1,pBean.getProduct_name());
                    pstmt.setInt(2, pBean.getProduct_price());
                    pstmt.setInt(3, pBean.getProduct_count());
                    pstmt.setString(4, pBean.getProduct_photo());
                    pstmt.setInt(5, pBean.getProduct_no());
                    pstmt.executeUpdate();         
        }catch(Exception e){
            System.out.println("updateProduct()에서 오류 :"+e);
        }finally{
            closeproductConnection();
        }
    
    }
    //상품 전체 개수
    public int getProductCount(){
        int count = 0;
        try{
            con = getproductConnection();
            sql = "select count(*) from shopproduct";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
                    
            if(rs.next()){
                count = rs.getInt(1);
            }
        }catch(Exception e){
            System.out.println("getProductCount()에서 오류 :"+e);
        }finally{
            closeproductConnection();
        }
            return count;
    }
    
    //상품 정렬(신상품순, 낮은가격순, 높은가격순)
    public List<productBean> sequenceProduct(int startRow, int pageSize,int product_seq){
        List<productBean> productList = new ArrayList<productBean>();
        
        try{
        	con = getproductConnection();
        	if(product_seq == 1){	
        		sql = "select * from shopproduct order by product_no desc limit ?,?";
        		 pstmt = con.prepareStatement(sql);
                 pstmt.setInt(1, startRow);
                 pstmt.setInt(2, pageSize);
                 rs = pstmt.executeQuery();
        	}else if(product_seq == 2){
                sql = "select * from shopproduct order by product_price desc limit ?,?";
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, startRow);
                pstmt.setInt(2, pageSize);
                rs = pstmt.executeQuery();
        	}else{
                sql = "select * from shopproduct order by product_price asc limit ?,?";
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, startRow);
                pstmt.setInt(2, pageSize);
                rs = pstmt.executeQuery();
        	}
            
                
            while(rs.next()){
                productBean pBean = new productBean();
                pBean.setProduct_no(rs.getInt("product_no"));
                pBean.setProduct_name(rs.getString("product_name"));
                pBean.setProduct_price(rs.getInt("product_price"));
                pBean.setProduct_count(rs.getInt("product_count"));
                pBean.setProduct_photo(rs.getString("product_photo"));
                productList.add(pBean);
                }
            }catch(Exception e){
                System.out.println("sequenceProduct()에서 오류 :" +e);
            }finally{
                closeproductConnection();
            }
            return productList;                       
        }
    //상품정보 조회
    public productBean getProduct_cart(int no){
        try{
        	
            con = getproductConnection();
            sql = "select * from shopproduct where product_no=?";
            pstmt = con.prepareStatement(sql);  
            pstmt.setInt(1, no);
            rs =pstmt.executeQuery();   
            
            if(rs.next()){
            	pBean = new productBean();
            	pBean.setProduct_no(rs.getInt("product_no"));
                pBean.setProduct_name(rs.getString("product_name"));
                pBean.setProduct_price(rs.getInt("product_price"));
                pBean.setProduct_count(rs.getInt("product_count"));
                pBean.setProduct_photo(rs.getString("product_photo"));                
            }
                    
        }catch(Exception e){
                System.out.println("getProduct_cart()에서 오류:"+e);
        }finally{
            closeproductConnection(); 
        }
            return pBean;
        }
    
  //상품 검색
    public List<productBean> selqProduct(int startRow, int pageSize,String qorder){
        List<productBean> productList1 = new ArrayList<productBean>();
        try{
            con = getproductConnection();
            Statement st = null;
            sql = "select * from shopproduct where product_name like '%"+qorder+"%' order by product_no desc limit "+startRow +","+pageSize ;
            st = con.createStatement();
            rs = st.executeQuery(sql);
                
            while(rs.next()){
                productBean pBean1 = new productBean();
                pBean1.setProduct_no(rs.getInt("product_no"));
                pBean1.setProduct_name(rs.getString("product_name"));
                pBean1.setProduct_price(rs.getInt("product_price"));
                pBean1.setProduct_count(rs.getInt("product_count"));
                pBean1.setProduct_photo(rs.getString("product_photo"));
                productList1.add(pBean1);
                }
            }catch(Exception e){
                System.out.println("selqProduct()에서 오류 : " +e);
            }finally{
                closeproductConnection();
            }
            return productList1;                       
        } 
}
