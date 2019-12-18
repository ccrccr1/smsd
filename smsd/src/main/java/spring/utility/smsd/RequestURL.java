package spring.utility.smsd;

public class RequestURL {
	
	private static final String TOURAPIKEY = "hLbLYdGdiug%2Fe%2FhEP1Vape2xi8qlivuAn3E2Fxh7KGhaF%2F2sLpRMC6qCcLFtzATS0290%2FbCHQG2vtWlkSP0htw%3D%3D";
	
	public static final String COMMONURL = "http://api.visitkorea.or.kr/openapi/service/rest/KorService";
	public static String ALLFESTIVALURL = COMMONURL+"/searchFestival?areaCode=&sigunguCode=&cat1=A02&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=100&_type=json&ServiceKey="+TOURAPIKEY; 
	public static final String COMMONINFOURL = COMMONURL+"/detailCommon?defaultYN=Y&firstImageYN=Y&addrinfoYN=YoverviewYN=Y&MobileOS=ETC&MobileApp=AppTesting&_type=json&ServiceKey="+TOURAPIKEY;
	public static final String INTROURL = COMMONURL+"/detailIntro?contentTypeId=15&MobileOS=ETC&MobileApp=AppTesting&_type=json&ServiceKey="+TOURAPIKEY;
	public static final String DETAILURL = COMMONURL+"/detailInfo?contentTypeId=15&detailYN=Y&MobileOS=ETC&MobileApp=AppTesting&_type=json&ServiceKey="+TOURAPIKEY;
	public static final String DETAILIMAGEURL = COMMONURL+"/detailImage?imageYN=Y&MobileOS=ETC&MobileApp=AppTesting&_type=json&ServiceKey="+TOURAPIKEY;
		
}
