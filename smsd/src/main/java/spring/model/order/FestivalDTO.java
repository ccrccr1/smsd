package spring.model.order;

public class FestivalDTO {
	private int f_id;
	private String f_addr;
	private String f_sdate;
	private String f_edate;
	private String f_image;
	private int f_cnt;
	private String f_tel;
	private String f_title;
	private int f_price;
	
	public FestivalDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FestivalDTO(int f_id, String f_addr, String f_sdate, String f_edate, String f_image, int f_cnt, String f_tel,
			String f_title, int f_price) {
		super();
		this.f_id = f_id;
		this.f_addr = f_addr;
		this.f_sdate = f_sdate;
		this.f_edate = f_edate;
		this.f_image = f_image;
		this.f_cnt = f_cnt;
		this.f_tel = f_tel;
		this.f_title = f_title;
		this.f_price = f_price;
	}

	@Override
	public String toString() {
		return "FestivalDTO [f_id=" + f_id + ", f_addr=" + f_addr + ", f_sdate=" + f_sdate + ", f_edate=" + f_edate
				+ ", f_image=" + f_image + ", f_cnt=" + f_cnt + ", f_tel=" + f_tel + ", f_title=" + f_title
				+ ", f_price=" + f_price + "]";
	}

	public int getF_id() {
		return f_id;
	}

	public void setF_id(int f_id) {
		this.f_id = f_id;
	}

	public String getF_addr() {
		return f_addr;
	}

	public void setF_addr(String f_addr) {
		this.f_addr = f_addr;
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

	public String getF_image() {
		return f_image;
	}

	public void setF_image(String f_image) {
		this.f_image = f_image;
	}

	public int getF_cnt() {
		return f_cnt;
	}

	public void setF_cnt(int f_cnt) {
		this.f_cnt = f_cnt;
	}

	public String getF_tel() {
		return f_tel;
	}

	public void setF_tel(String f_tel) {
		this.f_tel = f_tel;
	}

	public String getF_title() {
		return f_title;
	}

	public void setF_title(String f_title) {
		this.f_title = f_title;
	}

	public int getF_price() {
		return f_price;
	}

	public void setF_price(int f_price) {
		this.f_price = f_price;
	}
	
	
}