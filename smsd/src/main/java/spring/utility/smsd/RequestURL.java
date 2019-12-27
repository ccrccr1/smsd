package spring.utility.smsd;

public class RequestURL {
	
	private static final String TOURAPIKEY = "U4GNlN7MqzXRt82%2B300akD9bfpZj%2Fc31DpV6HTKUJrsqI4fgri9PsuFW%2B3q7IicBP4QhjqtMhfN7ytxp3n0VuQ%3D%3D";	
	public static final String COMMONURL = "http://api.visitkorea.or.kr/openapi/service/rest/KorService";
	public static String ALLFESTIVALURL = COMMONURL+"/searchFestival?areaCode=&sigunguCode=&cat1=A02&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=100&_type=json&ServiceKey="+TOURAPIKEY; 
	public static final String COMMONINFOURL = COMMONURL+"/detailCommon?defaultYN=Y&firstImageYN=Y&addrinfoYN=YoverviewYN=Y&MobileOS=ETC&MobileApp=AppTesting&_type=json&ServiceKey="+TOURAPIKEY;
	public static final String INTROURL = COMMONURL+"/detailIntro?contentTypeId=15&MobileOS=ETC&MobileApp=AppTesting&_type=json&ServiceKey="+TOURAPIKEY;
	public static final String DETAILURL = COMMONURL+"/detailInfo?contentTypeId=15&detailYN=Y&MobileOS=ETC&MobileApp=AppTesting&_type=json&ServiceKey="+TOURAPIKEY;
	public static final String DETAILIMAGEURL = COMMONURL+"/detailImage?imageYN=Y&MobileOS=ETC&MobileApp=AppTesting&_type=json&ServiceKey="+TOURAPIKEY;
		
}
