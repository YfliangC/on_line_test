package onlinetest.Students;

/**
 * Created by Maibenben on 2017/6/3.
 */

import java.sql.Date;

public class Student {

    private static Student instance = null;

    /*静态方法，返回本例*/
    public static Student getInstance(){
        if(instance == null) instance = new Student();
        return instance;
    }

    private int id;
    private String name;
    private String pwd;
    private String sex;
    private String grade;
    private int score1;
    private int score2;
    private int score3;
    private Date last_date;

    public int getId(){
        return id;
    }
    public String getName(){
        return name;
    }
    public String getPwd(){
        return pwd;
    }
    public String getSex(){
        return sex;
    }
    public String getGrade(){
        return grade;
    }
    public int getScore1(){
        return score1;
    }
    public int getScore2(){
        return score2;
    }
    public int getScore3(){
        return score3;
    }
    public java.sql.Date getLast_data(){
        return last_date;
    }

    public void setId(int id){
        this.id = id;
    }
    public void setName(String name){
        this.name = name;
    }
    public void setPwd(String pwd){
        this.pwd = pwd;
    }
    public void setSex(String sex){
        this.sex = sex;
    }
    public void setGrade(String grade){
        this.grade = grade;
    }
    public void setScore1(int score1){
        this.score1 = score1;
    }
    public void setScore2(int score2){
        this.score2 = score2;
    }
    public void setScore3(int score3){
        this.score3 = score3;
    }
    public void setLast_date(Date last_date){
        this.last_date = last_date;
    }
}



