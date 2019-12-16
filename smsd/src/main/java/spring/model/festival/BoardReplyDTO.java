package spring.model.festival;

public class BoardReplyDTO {
	
    private int 	br_no           ;
    private String  br_content      ;
    private String  br_date         ;
    private String	m_id            ;
    private int		b_no            ;
    
    
	public BoardReplyDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public BoardReplyDTO(int br_no, String br_content, String br_date, String m_id, int b_no) {
		super();
		this.br_no = br_no;
		this.br_content = br_content;
		this.br_date = br_date;
		this.m_id = m_id;
		this.b_no = b_no;
	}


	@Override
	public String toString() {
		return "BoardReplyDTO [br_no=" + br_no + ", br_content=" + br_content + ", br_date=" + br_date + ", m_id="
				+ m_id + ", b_no=" + b_no + "]";
	}


	public int getBr_no() {
		return br_no;
	}


	public void setBr_no(int br_no) {
		this.br_no = br_no;
	}


	public String getBr_content() {
		return br_content;
	}


	public void setBr_content(String br_content) {
		this.br_content = br_content;
	}


	public String getBr_date() {
		return br_date;
	}


	public void setBr_date(String br_date) {
		this.br_date = br_date;
	}


	public String getM_id() {
		return m_id;
	}


	public void setM_id(String m_id) {
		this.m_id = m_id;
	}


	public int getB_no() {
		return b_no;
	}


	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
                                    
    
    
    
}
