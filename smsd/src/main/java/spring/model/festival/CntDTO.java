package spring.model.festival;

public class CntDTO {
	  private String cnt;
	  private String table_name;
	  private String title;
	  private String writedate;
	  private int no;
	  
	  
	  public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTable_name() {
		return table_name;
	}
	public void setTable_name(String table_name) {
		this.table_name = table_name;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	public CntDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "CntDTO [cnt=" + cnt + ", table_name=" + table_name + ", title=" + title + ", writedate=" + writedate
				+ ", no=" + no + "]";
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
}
