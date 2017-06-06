package onlinetest.Students;

/**
 * Created by Maibenben on 2017/6/3.
 */

import java.sql.*;
import java.sql.Date;
import java.util.*;

import onlinetest.Dao;

public class StudentDao {

    private static StudentDao instance = null;

    /*静态方法，返回本例*/
    public static StudentDao getInstance(){
        if(instance == null) instance = new StudentDao();
        return instance;
    }

    /*新增用户信息*/
    public int insert(Student student){
        Connection conn = Dao.getConnection();
        PreparedStatement pstmt = null;
        String sql = "insert into student(userid,username,userpassword,usersex,usergrade) values(?,?,?,?,?)";
        int count = 0;
        try{
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, String.valueOf(student.getId()));
            pstmt.setString(2, student.getName());
            pstmt.setString(3, student.getPwd());
            pstmt.setString(4, student.getSex());
            pstmt.setString(5, student.getGrade());
            count = pstmt.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            try{
                if (pstmt != null) {
                    pstmt.close();
                }
            }catch(SQLException e){
                e.printStackTrace();
            }
            Dao.closeConnection();
        }
        return count;
    }

    /*修改信息*/
    public int upDate(Student student,String name){
        Connection conn = Dao.getConnection();
        PreparedStatement pstmt = null;


        String sql = "update student" + "  set userpassword = ? , " + "username = ? ," + "usersex = ? , " + "usergrade = ? , " + "score1 = ? , " + "score2 = ? , " + "score3 = ? , " + "time = ?  " + "WHERE username = ?";
        int count  = 0;
        try{
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, student.getPwd());
            pstmt.setString(2,student.getName());
            pstmt.setString(3, student.getSex());
            pstmt.setString(4, student.getGrade());
            pstmt.setInt(5, student.getScore1());
            pstmt.setInt(6, student.getScore2());
            pstmt.setInt(7, student.getScore3());
            pstmt.setDate(8, student.getLast_data());
            pstmt.setString(9,name);
            count = pstmt.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            try{
                if (pstmt != null) {
                    pstmt.close();
                }
            }catch(SQLException e){
                e.printStackTrace();
            }
            Dao.closeConnection();
        }
        return count;
    }

    /*删除信息*/
    public int delete(String username){
        Connection conn = Dao.getConnection();
        PreparedStatement pstmt = null;
        String sql = "delete from student where username = ?";
        int count = 0;
        try{
            pstmt = conn.prepareCall(sql);
            pstmt.setString(1, username);
            count = pstmt.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            try{
                pstmt.close();
            }catch(SQLException e){
                e.printStackTrace();
            }
            Dao.closeConnection();
        }
        return count;
    }

    /*查找用户信息*/
    public Student selectWhere(Student student){
        Connection conn = Dao.getConnection();
        Statement stmt;
        try{
            stmt = conn.createStatement();
            String sql = "SELECT * FROM student while userid = " + String.valueOf(student.getId());
            ResultSet rs = stmt.executeQuery(sql);
            student.setName(rs.getString("username"));
            student.setSex(rs.getString("usersex"));
            student.setScore1(rs.getInt("score1"));
            student.setScore2(rs.getInt("score2"));
            student.setScore3(rs.getInt("score3"));
            student.setGrade(rs.getString("usergrade"));
            student.setLast_date(rs.getDate("date"));
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            Dao.closeConnection();
        }
        return student;
    }

    /*通过学生名查找学生*/
    public Student findByname(String username){
        Connection conn = Dao.getConnection();
        Student student = Student.getInstance();
        Statement stmt;
        try{
            stmt = conn.createStatement();
            String sql = "SELECT * FROM student WHERE username = '" + username +"'";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()){
                student.setId(rs.getInt("userid"));
                student.setPwd(rs.getString("userpassword"));
                student.setName(rs.getString("username"));
                student.setSex(rs.getString("usersex"));
                student.setScore1(rs.getInt("score1"));
                student.setScore2(rs.getInt("score2"));
                student.setScore3(rs.getInt("score3"));
                student.setGrade(rs.getString("usergrade"));
                student.setLast_date(rs.getDate("time"));
            }
            if(rs == null) {
                return null;
            }

        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            Dao.closeConnection();
        }
        return student;

    }

    /*获取题目难度历史分数*/
    public int getScoreByqstd(Student student,String qstdifficult){
        int score = 0;
        switch (qstdifficult){
            case "easy":
                score = student.getScore1();
                break;
            case  "middle":
                score = student.getScore2();
                break;
            case  "difficult":
                score = student.getScore3();
                break;
        }
        return  score;
    }

    /*设置题目难度新分数*/
    public void setScore(Student student, String qstdifficult,int score){
        switch (qstdifficult){
            case "easy":
                if (student.getScore1()<score) {
                    student.setScore1(score);
                }
                break;
            case  "middle":
                if (student.getScore3()<score){
                    student.setScore2(score);
                }
                break;
            case  "difficult":
                if (student.getScore3()<score){
                    student.setScore3(score);
                }
                break;
        }
    }

    /*设置时间*/
    public void setTime(Student student, java.util.Date date){
        java.sql.Date sqlDate =new java.sql.Date(date.getTime());
        student.setLast_date(sqlDate);
    }
}
