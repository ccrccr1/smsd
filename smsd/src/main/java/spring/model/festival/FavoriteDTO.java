package spring.model.festival;

public class FavoriteDTO {
	private int f_no;
	private String f_date;
	private int f_amount;
	private int f_total;
	private String m_id;
	private int f_id;
	private String f_sdate;
	private String f_edate;
	private String f_title;
	private String f_image;
	private int f_price;
	
	
	public FavoriteDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FavoriteDTO(int f_no, String f_date, int f_amount, int f_total, String m_id, int f_id) {
		super();
		this.f_no = f_no;
		this.f_date = f_date;
		this.f_amount = f_amount;
		this.f_total = f_total;
		this.m_id = m_id;
		this.f_id = f_id;
	}

	@Override
	public String toString() {
		return "FavoriteDTO [f_no=" + f_no + ", f_date=" + f_date + ", f_amount=" + f_amount + ", f_total=" + f_total
				+ ", m_id=" + m_id + ", f_id=" + f_id + "]";
	}

	public int getF_no() {
		return f_no;
	}

	public void setF_no(int f_no) {
		this.f_no = f_no;
	}

	public String getF_date() {
		return f_date;
	}

	public void setF_date(String f_date) {
		this.f_date = f_date;
	}

	public int getF_amount() {
		return f_amount;
	}

	public void setF_amount(int f_amount) {
		this.f_amount = f_amount;
	}

	public int getF_total() {
		return f_total;
	}

	public void setF_total(int f_total) {
		this.f_total = f_total;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getF_id() {
		return f_id;
	}

	public void setF_id(int f_id) {
		this.f_id = f_id;
	}

	public String getF_sdate() {
		return f_sdate;
	}

	public void setF_sdate(String f_sdate) {
		this.f_sdate = f_sdate;
	}

	public String getF_edate() {
		return f_edate;
	}

	public void setF_edate(String f_edate) {
		this.f_edate = f_edate;
	}

	public String getF_title() {
		return f_title;
	}

	public void setF_title(String f_title) {
		this.f_title = f_title;
	}

	public String getF_image() {
		return f_image;
	}

	public void setF_image(String f_image) {
		this.f_image = f_image;
	}

	public int getF_price() {
		return f_price;
	}

	public void setF_price(int f_price) {
		this.f_price = f_price;
	}
	
}
