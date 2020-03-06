package replyboard;

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


public class replyboardDAO {
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DataSource ds = null;
    String sql = "";
    Statement stmt =null;
    
    replyboardBean rBean = new replyboardBean();
    
    //DB연결
    private Connection getreplyConnection() throws Exception {
        Context ctx = new InitialContext();
        ds = (DataSource)ctx.lookup("java:comp/env/jdbc/jspbeginner");
        return ds.getConnection();
    }
    
    //DB연결 해제
    private void closereplyConnection(){
        try {
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
            if(con != null) con.close();
            if(stmt != null) stmt.close();
        } catch(SQLException e) {
            System.out.println("closereplyConnection()硫붿냼�뱶�뿉�꽌 �삤瑜�:" +e);
        }
    }
    
    
    //댓글 조회
    public List<replyboardBean> getreplyBoardList(int no){
        List<replyboardBean> replyboardList = new ArrayList<replyboardBean>();
        try{    
            con = getreplyConnection();
            sql = "select * from replyshopboard where no=?";
            pstmt = con.prepareStatement(sql);  
            pstmt.setInt(1, no);
            rs =pstmt.executeQuery();
            
            
            while(rs.next()){
                replyboardBean rBean = new replyboardBean();
                rBean.setNo(rs.getInt("no"));
                rBean.setReply_no(rs.getInt("reply_no"));
                rBean.setReply_writer(rs.getString("reply_writer"));
                rBean.setReply_pw(rs.getString("reply_pw"));
                rBean.setReply_date(rs.getTimestamp("reply_date"));
                rBean.setReply_content(rs.getString("reply_content"));
                replyboardList.add(rBean);
            }
            
            
        }catch(Exception e){
                System.out.println("getreplyBoard()에서 오류 :"+e);
        }finally{
            closereplyConnection();  
        }
            return replyboardList;
    }
    
    //댓글 추가
    public void insertreplyBoard(replyboardBean rBean){
        int reply_no;
        
        try{
            con = getreplyConnection();
            sql = "select max(reply_no) from replyshopboard";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            if(rs.next()){
                reply_no = rs.getInt(1) + 1;
            }else{
                reply_no = 1;             
            }
            sql = "insert into replyshopboard(reply_no,no,reply_writer,reply_pw,reply_date,reply_content) values(?,?,?,?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, reply_no);
            pstmt.setInt(2, rBean.getNo());
            pstmt.setString(3, rBean.getReply_writer());
            pstmt.setString(4, rBean.getReply_pw());
            pstmt.setTimestamp(5, rBean.getReply_date());
            pstmt.setString(6, rBean.getReply_content());
            pstmt.executeUpdate();
            
            }catch(Exception e){
                System.out.println("insertreplyBoard()에서 오류 :"+e);
            }finally{
                closereplyConnection();
            }
        }
    
    //댓글 삭제
    public int deletereplyBoard(int no,int reply_no,String reply_pw1){
    int check = 0;
    
    try{
        con = getreplyConnection();      
        sql = "select reply_pw from replyshopboard where no=? and reply_no=?";
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, no);
        pstmt.setInt(2, reply_no);
        rs = pstmt.executeQuery();
        if(rs.next()){
            if(reply_pw1.equals(rs.getString("reply_pw"))){
                check=1;
                sql = "delete from replyshopboard where no=? and reply_no=?";
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, no);
                pstmt.setInt(2, reply_no);
                pstmt.executeUpdate();  
            }else{
                check = 0;
            }
        }
    }catch(Exception e){
        System.out.println("deletereplyBoard()에서 오류 :" + e);
    }finally{
        closereplyConnection();
    }
    return check;
    }
    
    //댓글 조회
    public replyboardBean getReply(int no,int reply_no){
        try{
                
            con = getreplyConnection();
            sql = "select * from replyshopboard where no=? and reply_no=?";
            pstmt = con.prepareStatement(sql);  
            pstmt.setInt(1, no);
            pstmt.setInt(2, reply_no);
            rs =pstmt.executeQuery();   
            
            if(rs.next()){
                rBean.setNo(rs.getInt("no"));
                rBean.setReply_no(rs.getInt("reply_no"));
                rBean.setReply_content(rs.getString("reply_content"));
                rBean.setReply_pw(rs.getString("reply_pw"));
                rBean.setReply_writer(rs.getString("reply_writer"));
                rBean.setReply_date(rs.getTimestamp("reply_date"));
            }
                    
        }catch(Exception e){
                System.out.println("getReply()에서 오류 :"+e);
        }finally{
            closereplyConnection(); 
        }
            return rBean;
        }
    
    //댓글 수정
    public int updateReply(replyboardBean rBean){
        int check=0;
        try{
            con = getreplyConnection();
            sql = "select reply_pw from replyshopboard where no=? and reply_no=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, rBean.getNo());
            pstmt.setInt(2, rBean.getReply_no());
            rs = pstmt.executeQuery();
            if(rs.next()){
                if(rBean.getReply_pw().equals(rs.getString("reply_pw"))){
                    check=1;
                    sql = "update replyshopboard set reply_content=?,reply_date=? where no=? and reply_no=?";
                    pstmt = con.prepareStatement(sql);
                    pstmt.setString(1, rBean.getReply_content());
                    pstmt.setTimestamp(2, rBean.getReply_date());
                    pstmt.setInt(3, rBean.getNo());
                    pstmt.setInt(4, rBean.getReply_no());
                    pstmt.executeUpdate();
                }else{
                    check = 0;
                }
            }
        }catch(Exception e){
            System.out.println("updateReply()에서 오류 :"+e);
        }finally{
            closereplyConnection();
        }
        return check;
    }
}
