package spring.model.festival;

import org.springframework.web.multipart.MultipartFile;

public class ReviewDTO {
	
	private int 	r_no		;
	private String  r_title		;
	private String	r_content	;
	private String  r_date		;
	private int		f_id		;
	private String	m_id		;
	private int		r_star 		;
	private String 	r_file 		;
	private MultipartFile	r_fileMF ;
	
	
	public ReviewDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReviewDTO(int r_no, String r_title, String r_content, String r_date, int f_id, String m_id, int r_star, String r_file, MultipartFile r_fileMF) {
		super();
		this.r_no = r_no;
		this.r_title = r_title;
		this.r_content = r_content;
		this.r_date = r_date;
		this.f_id = f_id;
		this.m_id = m_id;
		this.r_star = r_star;
		this.r_file = r_file;
		this.r_fileMF = r_fileMF;
		
	}

	@Override
	public String toString() {
		return "ReviewDTO [r_no=" + r_no + ", r_title=" + r_title + ", r_content=" + r_content + ", r_date=" + r_date
				+ ", f_id=" + f_id + ", m_id=" + m_id + ", r_star=" + r_star + ", r_file=" + r_file + ", r_fileMF="
				+ r_fileMF + ", u_fileMF=" + "]";
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getR_title() {
		return r_title;
	}

	public void setR_title(String r_title) {
		this.r_title = r_title;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public String getR_date() {
		return r_date;
	}

	public void setR_date(String r_date) {
		this.r_date = r_date;
	}

	public int getF_id() {
		return f_id;
	}

	public void setF_id(int f_id) {
		this.f_id = f_id;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getR_star() {
		return r_star;
	}

	public void setR_star(int r_star) {
		this.r_star = r_star;
	}

	public String getR_file() {
		return r_file;
	}

	public void setR_file(String r_file) {
		this.r_file = r_file;
	}

	public MultipartFile getR_fileMF() {
		return r_fileMF;
	}

	public void setR_fileMF(MultipartFile r_fileMF) {
		this.r_fileMF = r_fileMF;
	}

	
}
