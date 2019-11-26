package spring.model.order;

public class OrderDTO {
	private int o_no;
	private String m_id;
	private String o_date;
	private int f_id;
	private int p_amount;
	private int p_total;
	private String f_title;
	
	public OrderDTO() {
		super();
	}

	public OrderDTO(int o_no, String m_id, String o_date, int f_id, int p_amount, int p_total, String f_title) {
		super();
		this.o_no = o_no;
		this.m_id = m_id;
		this.o_date = o_date;
		this.f_id = f_id;
		this.p_amount = p_amount;
		this.p_total = p_total;
		this.f_title = f_title;
	}

	@Override
	public String toString() {
		return "OrderDTO [o_no=" + o_no + ", m_id=" + m_id + ", o_date=" + o_date + ", f_id=" + f_id + ", p_amount="
				+ p_amount + ", p_total=" + p_total + ", f_title=" + f_title + "]";
	}

	public int getO_no() {
		return o_no;
	}

	public void setO_no(int o_no) {
		this.o_no = o_no;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getO_date() {
		return o_date;
	}

	public void setO_date(String o_date) {
		this.o_date = o_date;
	}

	public int getF_id() {
		return f_id;
	}

	public void setF_id(int f_id) {
		this.f_id = f_id;
	}

	public int getP_amount() {
		return p_amount;
	}

	public void setP_amount(int p_amount) {
		this.p_amount = p_amount;
	}

	public int getP_total() {
		return p_total;
	}

	public void setP_total(int p_total) {
		this.p_total = p_total;
	}

	public String getF_title() {
		return f_title;
	}

	public void setF_title(String f_title) {
		this.f_title = f_title;
	}
}
