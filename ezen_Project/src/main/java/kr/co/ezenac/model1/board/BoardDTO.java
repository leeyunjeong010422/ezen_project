package kr.co.ezenac.model1.board;

import java.sql.Date;

/*
 
 NUM			NUMBER			PRIMARY KEY
,TITLE		VARCHAR2(200)	NOT NULL
,CONTENT		VARCHAR2(2000)	NOT NULL
,ID			VARCHAR2(10)	NOT NULL
,POSTDATE	DATE	DEFAULT	SYSDATE NOT NULL
,VISITCOUNT	NUMBER(6)

*/	

public class BoardDTO {
	//멤버 변수
	private String num;		//일련번호(PK)
	private String title;	//제목
	private String content; //내용
	private String id;		//아이디
	private Date postdate;	
	private String visitcount;
	private String name;
	
	// 게터, 세터
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getPostdate() {
		return postdate;
	}
	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}
	public String getVisitcount() {
		return visitcount;
	}
	public void setVisitcount(String visitcount) {
		this.visitcount = visitcount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	
	
}
