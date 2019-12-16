package spring.model.festival;

public class NoticeDTO {
	
	private int 	n_no      ;
    private String	n_title   ;
    private String	n_content ;
    private String	n_date    ;
    private int		n_cnt     ;
    private String	n_filename;
    private String	n_filesize;
    private String	m_ID      ;
	public NoticeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NoticeDTO(int n_no, String n_title, String n_content, String n_date, int n_cnt, String n_filename,
			String n_filesize, String m_ID) {
		super();
		this.n_no = n_no;
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_date = n_date;
		this.n_cnt = n_cnt;
		this.n_filename = n_filename;
		this.n_filesize = n_filesize;
		this.m_ID = m_ID;
	}
	@Override
	public String toString() {
		return "NoticeDTO [n_no=" + n_no + ", n_title=" + n_title + ", n_content=" + n_content + ", n_date=" + n_date
				+ ", n_cnt=" + n_cnt + ", n_filename=" + n_filename + ", n_filesize=" + n_filesize + ", m_ID=" + m_ID
				+ "]";
	}
	public int getN_no() {
		return n_no;
	}
	public void setN_no(int n_no) {
		this.n_no = n_no;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public String getN_date() {
		return n_date;
	}
	public void setN_date(String n_date) {
		this.n_date = n_date;
	}
	public int getN_cnt() {
		return n_cnt;
	}
	public void setN_cnt(int n_cnt) {
		this.n_cnt = n_cnt;
	}
	public String getN_filename() {
		return n_filename;
	}
	public void setN_filename(String n_filename) {
		this.n_filename = n_filename;
	}
	public String getN_filesize() {
		return n_filesize;
	}
	public void setN_filesize(String n_filesize) {
		this.n_filesize = n_filesize;
	}
	public String getM_ID() {
		return m_ID;
	}
	public void setM_ID(String m_ID) {
		this.m_ID = m_ID;
	}
    
    

}
