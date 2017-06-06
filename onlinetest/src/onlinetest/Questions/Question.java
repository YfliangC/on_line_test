package onlinetest.Questions;

/**
 * Created by Maibenben on 2017/6/3.
 */


public class Question {

    private static Question instance = null;

    /*静态方法，返回本例*/
    public static Question getInstance(){
        if(instance == null) instance = new Question();
        return instance;
    }

    private int qstid;
    private int qstdifficult;
    private int qsttype;
    private String qsttitle;
    private String qstoptiona;
    private String qstoptionb;
    private String qstoptionc;
    private String qstoptiond;
    private String qstanswer;
    private int qstscore;
    private int qstchoice;
    private int qstwrong;

    public int getQstid(){
        return qstid;
    }
    public int getQstdifficult(){
        return qstdifficult;
    }
    public int getQsttype(){
        return qsttype;
    }
    public String getQsttitle(){
        return qsttitle;
    }
    public String getQstoptiona(){
        return qstoptiona;
    }
    public String getQstoptionb(){
        return qstoptionb;
    }
    public String getQstoptionc(){
        return qstoptionc;
    }
    public String getQstoptiond(){
        return qstoptiond;
    }
    public String getQstanswer(){
        return qstanswer;
    }
    public int getQstscore(){
        return qstscore;
    }
    public int getQstchoice(){return qstchoice;}
    public int getQstwrong(){return qstwrong;}

    public void setQstid(int qstid){
        this.qstid = qstid;
    }
    public void setQstdifficult(int qstdifficult){
        this.qstdifficult = qstdifficult;
    }
    public void setQsttype(int qsttype){
        this.qsttype = qsttype;
    }
    public void setQsttitle(String qsttitle){
        this.qsttitle = qsttitle;
    }
    public void setQstoptiona(String qstoptiona){
        this.qstoptiona = qstoptiona;
    }
    public void setQstoptionb(String qstoptionb){
        this.qstoptionb = qstoptionb;
    }
    public void setQstoptionc(String qstoptionc){
        this.qstoptionc = qstoptionc;
    }
    public void setQstoptiond(String qstoptiond){
        this.qstoptiond = qstoptiond;
    }
    public void setQstanswer(String qstanswer){
        this.qstanswer = qstanswer;
    }
    public void setQstscore(int qstscore){
        this.qstscore = qstscore;
    }
    public void setQstchoice(int qstchoice){ this.qstchoice = qstchoice;}
    public void setQstwrong(int qstwrong){ this.qstwrong = qstwrong;}
}

