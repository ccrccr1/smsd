package spring.utility.smsd;

public class APIUtility {
	public static String checkItem(Object obj) {
		String result = "";
		if(obj == null) {
			result = "";
		}else {
			result = obj.toString();
		}
		return result;
	}
	public static String checkItem(Object obj, String value) {
		String result = "";
		if(obj == null) {
			result = value;
		}else {
			result = obj.toString();
		}
		return result;
	}
}
