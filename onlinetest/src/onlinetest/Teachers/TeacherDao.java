package onlinetest.Teachers;

import onlinetest.Dao;
import onlinetest.Questions.Question;
import onlinetest.Questions.QuestionDao;
import onlinetest.Students.StudentDao;

import java.sql.*;
import java.util.List;
import java.util.Queue;

/**
 * Created by Maibenben on 2017/6/5.
 */
public class TeacherDao {
    private static TeacherDao instance = null;

    /*静态方法，返回本例*/
    public static TeacherDao getInstance(){
        if (instance == null) instance = new TeacherDao();
        return instance;
    }

    /*新增用户信息*/
    public int insert(Teacher teacher){
        Connection conn = Dao.getConnection();
        PreparedStatement pstmt = null;
        String sql = "insert into teacher(teaid,teaname,teapassword,teasex,teaphone) values(?,?,?,?,?)";
        int count = 0;
        try{
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,teacher.getTeaid());
            pstmt.setString(2,teacher.getTeaname());
            pstmt.setString(3,teacher.getTeapassword());
            pstmt.setString(4,teacher.getTeasex());
            pstmt.setInt(5,teacher.getTeaphone());
            count = pstmt.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            try{
                if (pstmt !=null){
                    pstmt.close();
                }
            }catch (SQLException e){
                e.printStackTrace();
            }
            Dao.closeConnection();
        }
        return count;
    }

    /*修改用户信息*/
    public int upDate(Teacher teacher, String teaname){
        Connection conn = Dao.getConnection();
        PreparedStatement pstmt = null;

        String sql = "update teacher" + " set teaname = ?, " + "teapassword = ?, " + "teasex = ?, " + "teaphone = ?, " + "time = ?" + " where teaname = ?";
        int count = 0;
        try{
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,teacher.getTeaname());
            pstmt.setString(2,teacher.getTeapassword());
            pstmt.setString(3,teacher.getTeasex());
            pstmt.setInt(4,teacher.getTeaphone());
            pstmt.setDate(5,teacher.getTime());
            pstmt.setString(6,teaname);
            count = pstmt.executeUpdate();
        }catch (SQLException e)
        {
            e.printStackTrace();
        }finally {
            try {
                if (pstmt != null){
                    pstmt.close();
                }
            }catch (SQLException e){
                e.printStackTrace();
            }
            Dao.closeConnection();
        }
        return count;
    }

    /*删除用户信息*/
    public int delete(String teaname){
        Connection conn = Dao.getConnection();
        PreparedStatement pstmt = null;
        String sql = "delete from teacher where teaname = ?";
        int count = 0;
        try{
            pstmt = conn.prepareCall(sql);
            pstmt.setString(1,teaname);
            count = pstmt.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            try{
                pstmt.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
            Dao.closeConnection();
        }
        return count;
    }

    /*查找用户信息*/
    public Teacher selectWhere(String teaname){
        Teacher teacher = new Teacher();
        Connection conn = Dao.getConnection();
        Statement stmt;
        try{
            stmt = conn.createStatement();
            String sql = ("select * from teacher where teaname ='" +teaname +"'");
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()){
                teacher.setTeaid(rs.getInt("teaid"));
                teacher.setTeaname(rs.getString("teaname"));
                teacher.setTeapassword(rs.getString("teapassword"));
                teacher.setTeasex(rs.getString("teasex"));
                teacher.setTeaphone(rs.getInt("teaphone"));
                teacher.setTime(rs.getDate("time"));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            Dao.closeConnection();
        }
        return  teacher;
    }

    /*设置时间*/
    public void setTime(Teacher teacher, java.util.Date date){
        java.sql.Date sqlDate =new java.sql.Date(date.getTime());
        teacher.setTime((sqlDate));
    }

    /*根据难度选出所有试题*/
    public List<Question> selectALL(String qstdifficult, int qsttype){
        return QuestionDao.getInstance().selectAll(QuestionDao.getInstance().getDifficult(qstdifficult),qsttype);
    }
}