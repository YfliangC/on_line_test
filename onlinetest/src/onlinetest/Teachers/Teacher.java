package onlinetest.Teachers;

/**
 * Created by Maibenben on 2017/6/5.
 */
public class Teacher {

    private int teaid;
    private String teaname;
    private String teapassword;
    private String teasex;
    private int teaphone;
    private java.sql.Date time;

    public void setTeaid(int teaid){
        this.teaid = teaid;
    }
    public void setTeaname(String teaname){
        this.teaname = teaname;
    }
    public void setTeapassword(String teapassword){
        this.teapassword = teapassword;
    }
    public void setTeasex(String teasex){
        this.teasex = teasex;
    }
    public void setTime(java.sql.Date time){
        this.time = time;
    }
    public void setTeaphone(int teaphone){
        this.teaphone = teaphone;
    }

    public int getTeaid(){
        return  teaid;
    }
    public String getTeaname(){
        return teaname;
    }
    public String getTeapassword(){
        return teapassword;
    }
    public String getTeasex(){
        return teasex;
    }
    public int getTeaphone(){
        return teaphone;
    }
    public  java.sql.Date getTime(){
        return time;
    }

}
