package board;

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
public class boardDAO {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        DataSource ds = null;
        String sql = "";
        Statement stmt =null;
        
        boardBean bBean = new boardBean();
        
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
                System.out.println("closeConnection()에서오류:" +e);
            }
        }
        
        //게시글
        public List<boardBean> getBoardList(int startRow, int pageSize){
            List<boardBean> boardList = new ArrayList<boardBean>();
                try{
                    con = getConnection();
                    sql = "select * from shopboard order by main_seq desc, sub_seq asc limit ?,?";
                    pstmt = con.prepareStatement(sql);
                    pstmt.setInt(1, startRow);
                    pstmt.setInt(2, pageSize);
                    rs = pstmt.executeQuery();
                        
                    while(rs.next()){
                        boardBean bBean = new boardBean();
                        bBean.setNo(rs.getInt("no"));
                        bBean.setTitle(rs.getString("title"));
                        bBean.setWriter(rs.getString("writer"));
                        bBean.setWriterpw(rs.getString("writerpw"));
                        bBean.setDate(rs.getTimestamp("date"));     
                        bBean.setReadcount(rs.getInt("readcount")); 
                        bBean.setMain_tab(rs.getInt("main_tab"));
                        bBean.setMain_seq(rs.getInt("main_seq"));
                        bBean.setSub_seq(rs.getInt("sub_seq"));
                        
                        boardList.add(bBean);
                        }
                    }catch(Exception e){
                        System.out.println("getBoardList()에서 오류:" +e);
                    }finally{
                        closeConnection();
                    }
                    return boardList;                       
                }
        
        //게시글 추가
        public void insertBoard(boardBean bBean){
            int no;
            
            try{
                con = getConnection();
                sql = "select max(no) from shopboard";
                pstmt = con.prepareStatement(sql);
                rs = pstmt.executeQuery();
                
                if(rs.next()){
                    no = rs.getInt(1) + 1;
                }else{
                    no = 1;             
                }
                        
                sql = "insert into shopboard(no,title,writer,writerpw,content,date,main_seq,main_tab,sub_seq,readcount) values(?,?,?,?,?,?,?,?,?,?)";
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, no);
                pstmt.setString(2, bBean.getTitle());
                pstmt.setString(3, bBean.getWriter());
                pstmt.setString(4, bBean.getWriterpw());
                pstmt.setString(5, bBean.getContent());
                pstmt.setTimestamp(6, bBean.getDate());
                pstmt.setInt(7, no);
                pstmt.setInt(8, 0);
                pstmt.setInt(9, 0);
                pstmt.setInt(10, 0);
                pstmt.executeUpdate();
                
                }catch(Exception e){
                    System.out.println("insertBoard()에서 오류 :"+e);
                }finally{
                    closeConnection();
                }
            }

        
        //게시글 삭제
        public int deleteBoard(int no,String writerpw){
            int check = 0;
            
            try{
                con = getConnection();      
                sql = "select writerpw from shopboard where no=?";
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, no);
                rs = pstmt.executeQuery();
                if(rs.next()){
                    if(writerpw.equals(rs.getString("writerpw"))){
                        check=1;
                        sql = "delete from shopboard where no=?";
                        pstmt = con.prepareStatement(sql);
                        pstmt.setInt(1, no);
                        pstmt.executeUpdate();  
                    }else{
                        check = 0;
                    }
                }
            }catch(Exception e){
                System.out.println("deleteBoard()에서 오류:" + e);
            }finally{
                closeConnection();
            }
            return check;
        }                           
        


        //게시글 수정
        public int updateBoard(boardBean bBean){
            int check=0;
            try{
                con = getConnection();
                sql = "select writerpw from shopboard where no=?";
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, bBean.getNo());
                rs = pstmt.executeQuery();
                if(rs.next()){
                    if(bBean.getWriterpw().equals(rs.getString("writerpw"))){
                        check=1;
                        sql = "update shopboard set title=?,content=?,date=? where no=?";
                        pstmt = con.prepareStatement(sql);
                        pstmt.setString(1, bBean.getTitle());
                        pstmt.setString(2, bBean.getContent());
                        pstmt.setInt(3, bBean.getNo());
                        pstmt.setTimestamp(4, bBean.getDate());
                        pstmt.executeUpdate();
                    }else{
                        check = 0;//鍮꾨�踰덊샇 ��由�
                    }
                }
            }catch(Exception e){
                System.out.println("updateBoard()에서 오류:"+e);
            }finally{
                closeConnection();
            }
            return check;
        }
        
        //답글 추가
        public void reInsertBoard(boardBean bBean){
            int no = 0;
            try{     
                con = getConnection();  
                sql = "select max(no) from shopboard";
                pstmt = con.prepareStatement(sql);
                rs = pstmt.executeQuery();
                if(rs.next()){
                    no = rs.getInt(1) +1 ;
                }else{
                    no = 1;
                }   
                sql = "update shopboard set sub_seq = sub_seq+1 where main_seq=? and sub_seq > ?";
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, bBean.getMain_seq());
                pstmt.setInt(2, bBean.getSub_seq());
                pstmt.executeUpdate();
                        
                sql = "insert into shopboard values(?,?,?,?,?,?,?,?,?,?)";
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1,no);
                pstmt.setString(2, bBean.getTitle());
                pstmt.setString(3, bBean.getWriter());
                pstmt.setString(4, bBean.getWriterpw());
                pstmt.setString(5, bBean.getContent());
                pstmt.setTimestamp(6, bBean.getDate());
                pstmt.setInt(7, bBean.getMain_seq());
                pstmt.setInt(8, bBean.getMain_tab() +1);
                pstmt.setInt(9, bBean.getSub_seq() +1);
                pstmt.setInt(10, 0);
                pstmt.executeUpdate();
                        
                }catch(Exception e){
                    System.out.println("reInsertBoard()에서 오류:" +e);
                }finally{
                    closeConnection();
                }
            }   
        
        //게시글 내용
        public boardBean getBoard(int no){
            try{
                    
                con = getConnection();
                sql = "select * from shopboard where no=?";
                pstmt = con.prepareStatement(sql);  
                pstmt.setInt(1, no);
                rs =pstmt.executeQuery();   
                
                if(rs.next()){
                    bBean.setNo(rs.getInt("no"));
                    bBean.setTitle(rs.getString("title"));
                    bBean.setWriter(rs.getString("writer"));
                    bBean.setWriterpw(rs.getString("writerpw"));
                    bBean.setContent(rs.getString("content"));
                    bBean.setDate(rs.getTimestamp("date"));
                    bBean.setMain_seq(rs.getInt("main_seq"));
                    bBean.setMain_tab(rs.getInt("main_tab"));
                    bBean.setSub_seq(rs.getInt("sub_seq"));
                    bBean.setReadcount(rs.getInt("readcount")); 
                }
                        
            }catch(Exception e){
                    System.out.println("getBoard()에서 오류 : "+e);
            }finally{
                closeConnection();  
            }
                return bBean;
            }
        
    
        //조회수증가
        public void updateReadCount(int no){
            try{
                con = getConnection();
                sql = "update shopboard set readcount=readcount+1 where no=?";
                pstmt = con.prepareStatement(sql);  
                pstmt.setInt(1, no);
                pstmt.executeUpdate();
            }catch(Exception e){
                System.out.println("updateReadCount()에서 오류 : "+e);
            }finally{
                closeConnection();
            }
        }
        
        //게시글 전체 개수
        public int getBoardCount(){
            int count = 0;
            try{
                con = getConnection();
                sql = "select count(*) from shopboard";
                pstmt = con.prepareStatement(sql);
                rs = pstmt.executeQuery();
                        
                if(rs.next()){
                    count = rs.getInt(1);
                }
            }catch(Exception e){
                System.out.println("getBoardCount()에서 오류 : "+e);
            }finally{
                closeConnection();
            }
                return count;
        }
        
        //게시글 검색
        public List<boardBean> selqOrder(int startRow, int pageSize,String sel_qorder,String qorder){
            List<boardBean> boardList1 = new ArrayList<boardBean>();
            try{
                con = getConnection();
                Statement st = null;
                sql = "select * from shopboard where "+sel_qorder+" like '%"+qorder+"%' order by main_seq desc, sub_seq asc limit "+startRow+","+pageSize+"";
                st = con.createStatement();
                rs = st.executeQuery(sql);
                    
                while(rs.next()){
                    boardBean bBean1 = new boardBean();
                    bBean1.setNo(rs.getInt("no"));
                    bBean1.setTitle(rs.getString("title"));
                    bBean1.setWriter(rs.getString("writer"));
                    bBean1.setWriterpw(rs.getString("writerpw"));
                    bBean1.setDate(rs.getTimestamp("date"));     
                    bBean1.setReadcount(rs.getInt("readcount")); 
                    bBean1.setMain_tab(rs.getInt("main_tab"));
                    bBean1.setMain_seq(rs.getInt("main_seq"));
                    bBean1.setSub_seq(rs.getInt("sub_seq"));
                    bBean1.setReadcount(rs.getInt("readcount"));
                    
                    boardList1.add(bBean1);
                    }
                }catch(Exception e){
                    System.out.println("selqOrder()에서 오류 : " +e);
                }finally{
                    closeConnection();
                }
                return boardList1;                       
            }
            
} 
        

