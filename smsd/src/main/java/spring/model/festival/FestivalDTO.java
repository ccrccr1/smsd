package spring.model.festival;

public class FestivalDTO {
    private int f_id              ; //      number          primary key,
    private String f_title           ; //      varchar2(3000)  ,
    private String f_content         ; //      varchar2(3000)  ,
    private int f_area            ; //      number          ,
    private String f_address         ; //      varchar2(3000)  ,
    private String f_eventplace      ; //      varchar2(3000)  ,
    private String f_sdate           ; //      date            ,
    private String f_edate           ; //      date            ,
    private String f_playtime        ; //      varchar2(3000)  ,
    private String f_age             ; //      varchar2(3000)  ,
    private String f_telname         ; //      varchar2(3000)  ,
    private String f_tel             ; //      varchar2(3000)  ,
    private int f_price           ; //      number          ,
    private String f_homepage        ; //      varchar2(3000)  ,
    private int f_cnt             ; //      number
    private String f_image			;
	public FestivalDTO() {
		super();
	}
	public FestivalDTO(int f_id, String f_title, String f_content, int f_area, String f_address, String f_eventplace,
			String f_sdate, String f_edate, String f_playtime, String f_age, String f_telname, String f_tel,
			int f_price, String f_homepage, int f_cnt, String f_image) {
		super();
		this.f_id = f_id;
		this.f_title = f_title;
		this.f_content = f_content;
		this.f_area = f_area;
		this.f_address = f_address;
		this.f_eventplace = f_eventplace;
		this.f_sdate = f_sdate;
		this.f_edate = f_edate;
		this.f_playtime = f_playtime;
		this.f_age = f_age;
		this.f_telname = f_telname;
		this.f_tel = f_tel;
		this.f_price = f_price;
		this.f_homepage = f_homepage;
		this.f_cnt = f_cnt;
		this.f_image = f_image;
	}
	@Override
	public String toString() {
		return "FestivalDTO [f_id=" + f_id + ", f_title=" + f_title + ", f_content=" + f_content + ", f_area=" + f_area
				+ ", f_address=" + f_address + ", f_eventplace=" + f_eventplace + ", f_sdate=" + f_sdate + ", f_edate="
				+ f_edate + ", f_playtime=" + f_playtime + ", f_age=" + f_age + ", f_telname=" + f_telname + ", f_tel="
				+ f_tel + ", f_price=" + f_price + ", f_homepage=" + f_homepage + ", f_cnt=" + f_cnt + ", f_image="
				+ f_image + "]";
	}
	public int getF_id() {
		return f_id;
	}
	public void setF_id(int f_id) {
		this.f_id = f_id;
	}
	public String getF_title() {
		return f_title;
	}
	public void setF_title(String f_title) {
		this.f_title = f_title;
	}
	public String getF_content() {
		return f_content;
	}
	public void setF_content(String f_content) {
		this.f_content = f_content;
	}
	public int getF_area() {
		return f_area;
	}
	public void setF_area(int f_area) {
		this.f_area = f_area;
	}
	public String getF_address() {
		return f_address;
	}
	public void setF_address(String f_address) {
		this.f_address = f_address;
	}
	public String getF_eventplace() {
		return f_eventplace;
	}
	public void setF_eventplace(String f_eventplace) {
		this.f_eventplace = f_eventplace;
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
	public String getF_playtime() {
		return f_playtime;
	}
	public void setF_playtime(String f_playtime) {
		this.f_playtime = f_playtime;
	}
	public String getF_age() {
		return f_age;
	}
	public void setF_age(String f_age) {
		this.f_age = f_age;
	}
	public String getF_telname() {
		return f_telname;
	}
	public void setF_telname(String f_telname) {
		this.f_telname = f_telname;
	}
	public String getF_tel() {
		return f_tel;
	}
	public void setF_tel(String f_tel) {
		this.f_tel = f_tel;
	}
	public int getF_price() {
		return f_price;
	}
	public void setF_price(int f_price) {
		this.f_price = f_price;
	}
	public String getF_homepage() {
		return f_homepage;
	}
	public void setF_homepage(String f_homepage) {
		this.f_homepage = f_homepage;
	}
	public int getF_cnt() {
		return f_cnt;
	}
	public void setF_cnt(int f_cnt) {
		this.f_cnt = f_cnt;
	}
	public String getF_image() {
		return f_image;
	}
	public void setF_image(String f_image) {
		this.f_image = f_image;
	}
}