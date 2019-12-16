package spring.model.festival;

public class AmountDTO {
	private int year;
	private int month;
	private int month_total;
	public AmountDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AmountDTO(int year, int month, int month_total) {
		super();
		this.year = year;
		this.month = month;
		this.month_total = month_total;
	}
	@Override
	public String toString() {
		return "AmountDTO [year=" + year + ", month=" + month + ", month_total=" + month_total + "]";
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getmonth_total() {
		return month_total;
	}
	public void setmonth_total(int month_total) {
		this.month_total = month_total;
	}
	
	
	
}
