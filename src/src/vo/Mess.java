package src.vo;

import java.util.Date;

public class Mess {
    private int messFromId;
    private int messToId;
    private String messText;
    private Date sendDate;
    private int messId;
    private int messType;
    
    public int getMessFromId() {
        return messFromId;
    }
    public void setMessFromId(int messFromId) {
        this.messFromId = messFromId;
    }
    public int getMessToId() {
        return messToId;
    }
    public void setMessToId(int messToId) {
        this.messToId = messToId;
    }
    public String getMessText() {
        return messText;
    }
    public void setMessText(String messText) {
        this.messText = messText;
    }
    public Date getSendDate() {
        return sendDate;
    }
    public void setSendDate(Date sendDate) {
        this.sendDate = sendDate;
    }
    public int getMessId() {
        return messId;
    }
    public void setMessId(int messId) {
        this.messId = messId;
    }
    public int getMessType() {
        return messType;
    }
    public void setMessType(int messType) {
        this.messType = messType;
    }
    
 
}
