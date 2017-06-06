package onlinetest.Questions;
/**
 * Created by Maibenben on 2017/6/3.
 */

import java.util.*;
import java.sql.*;
import onlinetest.Dao;

public class QuestionDao {

    private int count = 10;
    private int singlechoice = 6;
    private int doublechoice = 4;


    public void setCount(int count) {
        this.count = count;
    }
    public void setSinglechoice(int singlechoice){this.singlechoice = singlechoice;}
    public void setDoublechoice(int doublechoice){this.doublechoice = doublechoice;}

    public int getSinglechoice(){return singlechoice;}
    public int getDoublechoice(){return doublechoice;}

    public int getCount() {
        return count;
    }

    private static QuestionDao instance = null;

    /*静态方法，返回本例*/
    public static QuestionDao getInstance() {
        if (instance == null) instance = new QuestionDao();
        return instance;
    }


    /*根据问题难度查找出所有的题目*/
    public List<Question> selectAll(int qstdifficult, int qsttype) {
        Connection conn = Dao.getConnection();
        Statement stmt;
        List<Question> list = new ArrayList<Question>();
        String sql = "SELECT * FROM question where qstdifficult = '" + String.valueOf(qstdifficult)+ "' and qsttype = '" + qsttype +"'";
        try {
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Question question = new Question();
                question.setQstid(rs.getInt("qstid"));
                question.setQstdifficult(rs.getInt("qstdifficult"));
                question.setQsttype(rs.getInt("qsttype"));
                question.setQsttitle(rs.getString("qsttitle"));
                question.setQstoptiona(rs.getNString("qstoptiona"));
                question.setQstoptionb(rs.getString("qstoptionb"));
                question.setQstoptionc(rs.getString("qstoptionc"));
                question.setQstoptiond(rs.getString("qstoptiond"));
                question.setQstanswer(rs.getString("qstanswer"));
                question.setQstchoice(rs.getInt("qstchoice"));
                question.setQstwrong(rs.getInt("qstwrong"));
                list.add(question);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Dao.closeConnection();
        }
        return list;
    }

    /*在list中随机选取题目*/
    public List<Question> randomTopic(String qstdifficult) {
        List<Question> listone = selectAll(getDifficult(qstdifficult),1);
        List<Question> listtwo = selectAll(getDifficult(qstdifficult),2);
        List<Question> rslist = new ArrayList<Question>();
        int[] a = new int[singlechoice];
        int[] b = new int[listone.size()];
        int size = listone.size();

        for (int i = 0; i < singlechoice; i++) {
            int num = (int) (Math.random() * size);
            int where = -1;
            for (int j = 0; j < b.length; j++) {
                if (b[j] != -1) {
                    where++;
                    if (where == num) {
                        b[j] = -1;
                        a[i] = j;
                    }
                }
            }
            size = size - 1;
        }
        for (int i = 0; i < count; i++) {
            Question df = listone.get(a[i]);
            df.setQstchoice((df.getQstchoice()+1));
            rslist.add(df);
        }

        a = new int[doublechoice];
        b = new int[listtwo.size()];
        size = listtwo.size();

        for (int i = 0; i<doublechoice; i++){
            int num = (int) (Math.random()*size);
            int where = -1;
            for (int j= 0;j<b.length;j++){
                if (b[j] != -1){
                    where++;
                    if (where == num){
                        b[j] = -1;
                        a[i] = j;
                    }
                }
            }
            size = size -1;
        }
        for (int i = 0; i<doublechoice;i++){
            Question df = listtwo.get(a[i]);
            df.setQstchoice((df.getQstchoice()+1));
            rslist.add(df);
        }

        return rslist;
    }

    /*检测选项是否正确*/
    public int checkMatch(Question question, String qstanswer) {
        int score = 0;
        if (question.getQstanswer().equals(qstanswer)) {
            score += question.getQstscore();
        }
        else {
            question.setQstwrong((question.getQstwrong()+1));
        }
        return score;
    }

    /*选择难度*/
    public int getDifficult(String qstdifficult) {
        int result = 0;
        switch (qstdifficult) {
            case "easy":
                result = 1;
                break;
            case "middle":
                result = 2;
                break;
            case "difficult":
                result = 3;
                break;
        }
        return result;
    }

    /*获取类型，radio单选，checkbox多选*/
    public String getType(Question question) {
        String result = null;
        switch (question.getQsttype()) {
            case 1:
                result = "radio";
                break;
            case 2:
                result = "checkbox";
                break;
        }
        return result;
    }

    /*通过题号找题目*/
    public Question findByname(String qstid) {
        Connection conn = Dao.getConnection();
        Question question = Question.getInstance();
        Statement stmt;
        try {
            stmt = conn.createStatement();
            String sql = "SELECT * FROM question WHERE qstid = '" + qstid + "'";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                question.setQsttitle(rs.getString("qsttitle"));
                question.setQstanswer(rs.getString("qstanswer"));
                question.setQstdifficult(rs.getInt("qstdifficult"));
                question.setQstid(rs.getInt("qstid"));
                question.setQstoptiona(rs.getString("qstoptiona"));
                question.setQstoptionb(rs.getString("qstoptionb"));
                question.setQstoptionc(rs.getString("qstoptionc"));
                question.setQstoptiond(rs.getString("qstoptiond"));
                question.setQstscore(rs.getInt("qstscore"));
                question.setQsttype(rs.getInt("qsttype"));
                question.setQstchoice(rs.getInt("qstchoice"));
                question.setQstwrong(rs.getInt("qstwrong"));
            }
            if (rs == null) {
                return null;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Dao.closeConnection();
        }
        return question;

    }

    /*获取分数，单选多选复合*/
    public int putScore(String qsttitle, String value[]) {
        String answer = "";
        for (int i = 0; i < value.length; i++) {
            answer += value[i];
        }
        return QuestionDao.getInstance().checkMatch(QuestionDao.getInstance().findByname(qsttitle), answer);
    }

    /*新增题目*/
    public int insert(Question question) {
        Connection conn = Dao.getConnection();
        PreparedStatement pstmt = null;
        String sql = "insert into question(qstid,qstdifficult,qstscore,qsttype,qsttitle,qstoptiona,qstoptionb,qstoptionc,qstoptiond,qstanswer,qstchoice,qstwrong) values(?,?,?,?,?,?,?,?,?,?,?,?)";
        int count = 0;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, question.getQstid());
            pstmt.setInt(2, question.getQstdifficult());
            pstmt.setInt(3, question.getQstscore());
            pstmt.setInt(4, question.getQsttype());
            pstmt.setString(5, question.getQsttitle());
            pstmt.setString(6, question.getQstoptiona());
            pstmt.setString(7, question.getQstoptionb());
            pstmt.setString(8, question.getQstoptionc());
            pstmt.setString(9, question.getQstoptiond());
            pstmt.setString(10, question.getQstanswer());
            pstmt.setInt(11,question.getQstchoice());
            pstmt.setInt(12,question.getQstwrong());
            count = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            Dao.closeConnection();
        }
        return count;
    }

    /*删除题目*/
    public int delete(Question question) {
        Connection conn = Dao.getConnection();
        PreparedStatement pstmt = null;
        String sql = "delete from question where questionid = ?";
        int count = 0;
        try {
            pstmt = conn.prepareCall(sql);
            pstmt.setInt(1, question.getQstid());
            count = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            Dao.closeConnection();
        }
        return count;
    }

    /*修改题目*/
    public int upDate(Question question, int qstid) {
        Connection conn = Dao.getConnection();
        PreparedStatement pstmt = null;
        String sql = "update question" + "set qstid = ?, " + "qstdifficult = ?, " + "qstscore = ?, " + "qsttype = ?, " + "qsttitle = ?, " + "qstoptiona = ?, " + "qstoptionb = ?, " + "qstoptionc = ?, " + "qstoptiond = ?, " + "qstanswer = ? " + "qstchoice = ? " + " qstwrong = ? " + "where qstid = ?";
        int count = 0;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, question.getQstid());
            pstmt.setInt(2, question.getQstdifficult());
            pstmt.setInt(3, question.getQstscore());
            pstmt.setInt(4, question.getQsttype());
            pstmt.setString(5, question.getQsttitle());
            pstmt.setString(6, question.getQstoptiona());
            pstmt.setString(7, question.getQstoptionb());
            pstmt.setString(8, question.getQstoptionc());
            pstmt.setString(9, question.getQstoptiond());
            pstmt.setString(10, question.getQstanswer());
            pstmt.setInt(11,question.getQstchoice());
            pstmt.setInt(12,question.getQstwrong());
            pstmt.setInt(13, qstid);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            Dao.closeConnection();
        }
        return count;
    }

}

