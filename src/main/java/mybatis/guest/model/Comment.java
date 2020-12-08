package mybatis.guest.model;

public class Comment implements java.io.Serializable {
    private long commentNo;
    private String userId;
    private String commentContent;
    private String regDate;

    public Comment() {
    }

    public Comment(long commentNo, String userId, String commentContent, String regDate) {
        this.commentNo = commentNo;
        this.userId = userId;
        this.commentContent = commentContent;
        this.regDate = regDate;
    }

    public long getCommentNo() {
        return commentNo;
    }

    public void setCommentNo(long commentNo) {
        this.commentNo = commentNo;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public String getRegDate() {
        return regDate;
    }

    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }
}

/* 프로그램 언어에는 camel 표기법을 주로 사용 (대소문자 구별 가능하기에) */