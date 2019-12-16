package spring.model.festival;

import org.springframework.web.multipart.MultipartFile;

public class BoardDTO {
	
	private int				b_no		;
	private String			b_title 	;
	private String			b_content 	;
	private String			b_date		;
	private int				b_cnt		;
	private String			b_filename	;
	private MultipartFile 	b_filenameMF	;
	private String			m_id		;
	private int				b_ref		;
	private int				b_indent	;
	private int				b_ansnum	;
	private int				b_refnum	;
	
	public BoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardDTO(int b_no, String b_title, String b_content, String b_date, int b_cnt, String b_filename,
			MultipartFile b_filenameMF, String m_id, int b_ref, int b_indent, int b_ansnum, int b_refnum) {
		super();
		this.b_no = b_no;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_date = b_date;
		this.b_cnt = b_cnt;
		this.b_filename = b_filename;
		this.b_filenameMF = b_filenameMF;
		this.m_id = m_id;
		this.b_ref = b_ref;
		this.b_indent = b_indent;
		this.b_ansnum = b_ansnum;
		this.b_refnum = b_refnum;
	}

	@Override
	public String toString() {
		return "BoardDTO [b_no=" + b_no + ", b_title=" + b_title + ", b_content=" + b_content + ", b_date=" + b_date
				+ ", b_cnt=" + b_cnt + ", b_filename=" + b_filename + ", b_filenameMF=" + b_filenameMF + ", m_id=" + m_id
				+ ", b_ref=" + b_ref + ", b_indent=" + b_indent + ", b_ansnum=" + b_ansnum + ", b_refnum=" + b_refnum
				+ "]";
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_date() {
		return b_date;
	}

	public void setB_date(String b_date) {
		this.b_date = b_date;
	}

	public int getB_cnt() {
		return b_cnt;
	}

	public void setB_cnt(int b_cnt) {
		this.b_cnt = b_cnt;
	}

	public String getB_filename() {
		return b_filename;
	}

	public void setB_filename(String b_filename) {
		this.b_filename = b_filename;
	}

	public MultipartFile getB_filenameMF() {
		return b_filenameMF;
	}

	public void setB_filenameMF(MultipartFile b_filenameMF) {
		this.b_filenameMF = b_filenameMF;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getB_ref() {
		return b_ref;
	}

	public void setB_ref(int b_ref) {
		this.b_ref = b_ref;
	}

	public int getB_indent() {
		return b_indent;
	}

	public void setB_indent(int b_indent) {
		this.b_indent = b_indent;
	}

	public int getB_ansnum() {
		return b_ansnum;
	}

	public void setB_ansnum(int b_ansnum) {
		this.b_ansnum = b_ansnum;
	}

	public int getB_refnum() {
		return b_refnum;
	}

	public void setB_refnum(int b_refnum) {
		this.b_refnum = b_refnum;
	}
	
	
	

}
