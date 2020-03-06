package member;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board.boardBean;


public class memberDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	DataSource ds = null;
	String sql = "";
    Statement stmt =null;
	memberBean mBean = new memberBean();
	
	//DB연결
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		ds = (DataSource)ctx.lookup("java:comp/env/jdbc/jspbeginner");
		return ds.getConnection();
	}
	
	//DB연결해제
	private void closeConnection(){
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
            if(stmt != null) stmt.close();
		} catch (SQLException e) {
			System.out.println("closeConnection()硫붿냼�뱶�뿉�꽌 �삤瑜�:" +e);
		}
	}
	
	//로그인 확인 
	public int userCheck(String id, String pw){
		
		int check = -1; 
		
		try{
		
			con = getConnection();
			sql = "select * from shopmember where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(pw.equals(rs.getString("pw"))){
					check = 1;
				}else {
					check = 0;  
				}	
			}else{
				check = -1;
			}
					
		}catch(Exception e){
			System.out.println("userCheck()에서 오류:"+e);
		}finally{
			closeConnection();
		}
		return check;
	
	}
	
	//아이디 중복확인
	public int idCheck(String id){		
		
		int check=0;
		
		try {
			con = getConnection();
			sql = "select * from shopmember where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				check = 1;
			}else{
				check = 0;
			}
			
			
		} catch (Exception e) {
			System.out.println("idCheck()에서 오류 : "+e);
		} finally {
			closeConnection();
		}
		return check; 
	}
	
	//회원추가
	public void insertMember(memberBean mBean){
		int cart_no;
		try {
			con = getConnection();
			sql = "insert into shopmember(id,pw,pwCheck,name,country,city,address,address1,address2)"
				  +"values(?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mBean.getId());
			pstmt.setString(2, mBean.getPw());
			pstmt.setString(3, mBean.getPwCheck());
			pstmt.setString(4, mBean.getName());
			pstmt.setString(5, mBean.getCountry());
			pstmt.setString(6, mBean.getCity());
			pstmt.setString(7, mBean.getAddress());
			pstmt.setString(8, mBean.getAddress1());
			pstmt.setString(9, mBean.getAddress2());
			pstmt.executeUpdate();
			
			sql = "select max(cart_no) from shopcart";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            if(rs.next()){
                cart_no = rs.getInt(1) + 1;
            }else{
                cart_no = 1;             
            }
            sql = "insert into shopcart values(?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cart_no);
			pstmt.setString(2, mBean.getId());
			pstmt.setInt(3, 0);
			pstmt.setInt(4, 0);
			pstmt.setInt(5, 0);
			pstmt.setInt(6, 0);
			pstmt.setInt(7, 0);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			pstmt.setInt(10, 0);
			pstmt.setInt(11, 0);
			pstmt.setInt(12, 0);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insertMember()에서 오류 :" + e);
		} finally {
			closeConnection();
		}		
	}
	
	//회원 수정
	public void updateMember(memberBean mBean){
		try {
			con = getConnection();
			sql = "update shopmember set pw=?,pwCheck=?,name=?,country=?,city=?,address=?,address1=?,address2=?"
					+ "where id=?";
			pstmt = con.prepareStatement(sql);		
			pstmt.setString(1, mBean.getPw());
			pstmt.setString(2, mBean.getPwCheck());
			pstmt.setString(3, mBean.getName());
			pstmt.setString(4, mBean.getCountry());
			pstmt.setString(5, mBean.getCity());
			pstmt.setString(6, mBean.getAddress());
			pstmt.setString(7, mBean.getAddress1());
			pstmt.setString(8, mBean.getAddress2());
			pstmt.setString(9, mBean.getId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateMember()에서 오류 : "+e);
		} finally {
			closeConnection();
		}	
	}
	
	//회원 삭제
	public int deleteMember(String id,String pw1){
		int check = 0;
        
        try{
            con = getConnection();      
            sql = "select pw from shopmember where id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if(rs.next()){
                if(pw1.equals(rs.getString("pw"))){
                    check=1;
                    sql = "delete from shopmember where id=?";
                    pstmt = con.prepareStatement(sql);
                    pstmt.setString(1, id);
                    pstmt.executeUpdate();  
                }else{
                    check = 0;
                }
            }
        }catch(Exception e){
            System.out.println("deleteMember()에서 오류 :" + e);
        }finally{
            closeConnection();
        }
        return check;
	}
	
	//회원 정보 조회
    public memberBean getMember(String id){
        try{
            con = getConnection();
            sql = "select * from shopmember where id='"+id+"'";
            stmt = con.createStatement();
            rs = stmt.executeQuery(sql);
            while(rs.next()){
                mBean.setId(rs.getString("id"));
                mBean.setName(rs.getString("name"));
                mBean.setCountry(rs.getString("country"));
                mBean.setCity(rs.getString("city"));
                mBean.setAddress(rs.getString("address"));
                mBean.setAddress1(rs.getString("address1"));
                mBean.setAddress2(rs.getString("address2"));
            }
                    
        }catch(Exception e){
                System.out.println("getMember()에서 오류 :"+e);
        }finally{
            closeConnection();  
        }
            return mBean;
        }
	
	
	
	                
}