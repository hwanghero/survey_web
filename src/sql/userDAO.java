package sql;
import java.sql.*;

public class userDAO {
    private Connection conn;   //데이터베이스에 접근하기 위한 객체
    private PreparedStatement pstmt;
    private ResultSet rs;   //정보를 담을 수 있는 변수를 생성

    public userDAO() throws SQLException, ClassNotFoundException {
        String dbURL = "jdbc:mysql://localhost:3306/survey?serverTimezone=UTC";
        String dbID = "root";
        String dbPassword = "1234";
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        System.out.println("유저 쿼리 연결 완료");
    }

    // 아이디 확인
    public int idCheck(userDTO user) throws SQLException {
        int check = 0;
        try{
            String sql = "select * from user where id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getUserID());
            rs = pstmt.executeQuery();

            if (rs.next()) {
                check = 1;
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        finally {
            exitsql();
        }
        return check;
    }

    // 로그인
    public int Login(userDTO user) throws SQLException {
        int check = 0;
        try{
            String sql = "select * from user where id = ? and pw = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getUserID());
            pstmt.setString(2, user.getUserPW());
            rs = pstmt.executeQuery();

            if (rs.next()) {
                check = 1;
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            exitsql();
        }
        return check;
    }

    // 회원가입
    public int join(userDTO user) throws SQLException {
        try {
            String SQL = "INSERT INTO user VALUES(?, ?, ?)";
            if(idCheck(user) == 0){
                pstmt = conn.prepareStatement(SQL);
                pstmt.setString(1, user.getUserID());
                pstmt.setString(2, user.getUserPW());
                pstmt.setString(3, user.getUserName());
                pstmt.executeUpdate();
                return 0;
            }else{
                return 1;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            exitsql();
        }
        return 0;
    }

    // 왜 집에선 안돼?
    public void exitsql() throws SQLException {
        //if(conn != null) conn.close();
        //if(pstmt != null) pstmt.close();
        //if(rs != null) rs.close();
    }
}
