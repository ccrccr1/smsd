package spring.model.festival;

public class QnaDTO {
	
	private int		q_no      ;
    private String	q_title   ;
    private String	q_content ;
    private String	q_date    ;
    private int		q_cnt     ;
    private String	q_filename;
    private String	q_filesize;
    private String	m_ID      ;
    private int		q_ref     ;
    private int		q_indent  ;
    private int		q_ansnum  ;
    private int		q_refnum  ;
	public QnaDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QnaDTO(int q_no, String q_title, String q_content, String q_date, int q_cnt, String q_filename,
			String q_filesize, String m_ID, int q_ref, int q_indent, int q_ansnum, int q_refnum) {
		super();
		this.q_no = q_no;
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_date = q_date;
		this.q_cnt = q_cnt;
		this.q_filename = q_filename;
		this.q_filesize = q_filesize;
		this.m_ID = m_ID;
		this.q_ref = q_ref;
		this.q_indent = q_indent;
		this.q_ansnum = q_ansnum;
		this.q_refnum = q_refnum;
	}
	@Override
	public String toString() {
		return "QnaDTO [q_no=" + q_no + ", q_title=" + q_title + ", q_content=" + q_content + ", q_date=" + q_date
				+ ", q_cnt=" + q_cnt + ", q_filename=" + q_filename + ", q_filesize=" + q_filesize + ", m_ID=" + m_ID
				+ ", q_ref=" + q_ref + ", q_indent=" + q_indent + ", q_ansnum=" + q_ansnum + ", q_refnum=" + q_refnum
				+ "]";
	}
	public int getQ_no() {
		return q_no;
	}
	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getQ_date() {
		return q_date;
	}
	public void setQ_date(String q_date) {
		this.q_date = q_date;
	}
	public int getQ_cnt() {
		return q_cnt;
	}
	public void setQ_cnt(int q_cnt) {
		this.q_cnt = q_cnt;
	}
	public String getQ_filename() {
		return q_filename;
	}
	public void setQ_filename(String q_filename) {
		this.q_filename = q_filename;
	}
	public String getQ_filesize() {
		return q_filesize;
	}
	public void setQ_filesize(String q_filesize) {
		this.q_filesize = q_filesize;
	}
	public String getM_ID() {
		return m_ID;
	}
	public void setM_ID(String m_ID) {
		this.m_ID = m_ID;
	}
	public int getQ_ref() {
		return q_ref;
	}
	public void setQ_ref(int q_ref) {
		this.q_ref = q_ref;
	}
	public int getQ_indent() {
		return q_indent;
	}
	public void setQ_indent(int q_indent) {
		this.q_indent = q_indent;
	}
	public int getQ_ansnum() {
		return q_ansnum;
	}
	public void setQ_ansnum(int q_ansnum) {
		this.q_ansnum = q_ansnum;
	}
	public int getQ_refnum() {
		return q_refnum;
	}
	public void setQ_refnum(int q_refnum) {
		this.q_refnum = q_refnum;
	}
    
}
