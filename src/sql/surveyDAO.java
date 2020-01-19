package sql;

import java.sql.*;

public class surveyDAO {
    private Connection conn;   //데이터베이스에 접근하기 위한 객체
    private PreparedStatement pstmt;
    private ResultSet rs;   //정보를 담을 수 있는 변수를 생성

    public surveyDAO() throws SQLException, ClassNotFoundException {
        String dbURL = "jdbc:mysql://localhost:3306/survey?serverTimezone=UTC";
        String dbID = "root";
        String dbPassword = "1234";
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        System.out.println("설문조사 쿼리 연결 완료");
    }

    // 메인 설문조사 전체 개수
    public int main_surveyCount() throws SQLException {
        try{
            String sql = "select count(*) from main_survey";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while(rs.next()){
                return rs.getInt(1);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        finally {
            exitsql();
        }
        return 0;
    }

    // 메인 설문조사 목록가져오기
    public String[][] main_getSurveyList() throws SQLException {
        int getcount = main_surveyCount();
        String[][] list = new String[getcount][4];
        try {
            String sql = "select * from main_survey";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            int i = 0;
            if(rs.next()){
                do{
                    list[i][0] = rs.getString(1);
                    list[i][1] = rs.getString(2);
                    list[i][2] = rs.getString(3);
                    list[i][3] = rs.getString(4);
                    i++;
                }while(rs.next());
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        finally {
            exitsql();
        }
        return list;
    }

    // 메인 특정 설문조사 목록가져오기
    public String[] main_getSurveyList(int idx) throws SQLException {
        String[] list = new String[4];
        try {
            String sql = "select * from main_survey where idx="+idx;
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            int i = 0;
            if(rs.next()){
                do{
                    list[0] = rs.getString(1);
                    list[1] = rs.getString(2);
                    list[2] = rs.getString(3);
                    list[3] = rs.getString(4);
                    i++;
                }while(rs.next());
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        finally {
            exitsql();
        }
        return list;
    }

    // 설문조사 전체 개수
    public int surveyCount(int top_idx) throws SQLException {
        try{
            String sql = "select count(*) from survey where top_idx="+top_idx;
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while(rs.next()){
                return rs.getInt(1);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        finally {
            exitsql();
        }
        return 0;
    }

    // 설문조사 목록가져오기
    public String[][] getSurveyList(int top_idx) throws SQLException {
        int getcount = surveyCount(top_idx);
        String[][] list = new String[getcount][5];
        try {
            String sql = "select * from survey where top_idx="+top_idx;
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            int i = 0;
            if(rs.next()){
                do{
                    list[i][0] = rs.getString(1);
                    list[i][1] = rs.getString(2);
                    list[i][2] = rs.getString(3);
                    list[i][3] = rs.getString(4);
                    list[i][4] = rs.getString(5);
                    i++;
                }while(rs.next());
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        finally {
            exitsql();
        }
        return list;
    }

    // 설문조사 1개의 정보를 가져오기.
    public String[] getSurvey(int idx) throws SQLException {
        String[] list = new String[4];
        try {
            String sql = "select * from survey where idx="+idx;
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            if(rs.next()){
                list[0] = rs.getString(1);
                list[1] = rs.getString(2);
                list[2] = rs.getString(3);
                list[3] = rs.getString(4);
                list[4] = rs.getString(5);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        finally {
            exitsql();
        }
        return list;
    }

    // 객관식 개수 가져오기
    public int getMulitCount(int top_idx){
        try{
            String sql = "select count(*) from mulit_survey_item where top_idx="+top_idx;
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while(rs.next()){
                return rs.getInt(1);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    // 객관식 가져오기
    public String[][] getMulititem(int top_idx){
        int count = getMulitCount(top_idx);
        String[][] list = new String[count][7];
        try {
            String sql = "select * from mulit_survey_item where top_idx="+top_idx;
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            int i = 0;
            if(rs.next()){
                do{
                    list[i][0] = rs.getString(1);
                    list[i][1] = rs.getString(2);
                    list[i][2] = rs.getString(3);
                    list[i][3] = rs.getString(4);
                    list[i][4] = rs.getString(5);
                    list[i][5] = rs.getString(6);
                    list[i][6] = rs.getString(7);
                    i++;
                }while(rs.next());
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }

    // 주관식 개수 가져오기
    public int getShortCount(int top_idx){
        try{
            String sql = "select count(*) from short_survey_item where top_idx="+top_idx;
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while(rs.next()){
                return rs.getInt(1);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    // 주관식 가져오기
    public String[][] getShortitem(int top_idx){
        int count = getShortCount(top_idx);
        String[][] list = new String[count][6];
        try {
            String sql = "select * from short_survey_item where top_idx="+top_idx;
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            int i = 0;
            if(rs.next()){
                do{
                    list[i][0] = rs.getString(1);
                    list[i][1] = rs.getString(2);
                    list[i][2] = rs.getString(3);
                    list[i][3] = rs.getString(4);
                    list[i][4] = rs.getString(5);
                    list[i][5] = rs.getString(6);
                    i++;
                }while(rs.next());
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }

    // 결과값 입력하기.
    public void useranswer_insert(int top_idx, String user_id, String date, String type, String answer, int sub_idx){
        try{
            String sql = "insert into user_answer values(?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, String.valueOf(top_idx));
            pstmt.setString(2, user_id);
            pstmt.setString(3, date);
            pstmt.setString(4, type);
            pstmt.setString(5, answer);
            pstmt.setString(6, String.valueOf(sub_idx));
            int n = pstmt.executeUpdate();
            if(n == 1){
                System.out.print("insert");
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }

    // 설문조사 했는지 확인
    public int user_survey_check(int top_idx, String user_id) throws SQLException {
        int check = 0;
        try {
            String sql = "select * from user_answer where top_idx="+top_idx+" and id='"+user_id+"'";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            if(rs.next()){
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

    // 또 안돼?
    public void exitsql() throws SQLException {
        //if(conn != null) conn.close();
        //if(pstmt != null) pstmt.close();
        //if(rs != null) rs.close();
    }
}
