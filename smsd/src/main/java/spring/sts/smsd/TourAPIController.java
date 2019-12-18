package spring.sts.smsd;

import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.cxf.helpers.IOUtils;
import org.apache.cxf.io.CachedOutputStream;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import spring.model.festival.FestivalDTO;
import spring.model.mapper.FestivalMapper;
import spring.utility.smsd.APIUtility;
import spring.utility.smsd.RequestURL;

@RestController
public class TourAPIController {

	@Autowired
	private FestivalMapper mapper;

	@GetMapping(value="/tour/api/list/detailCreate")
	public ResponseEntity<String> detailCreate() {
		ResponseEntity<String> entity = null;		
		StringBuffer param = new StringBuffer();
		FestivalDTO dto = new FestivalDTO();
		List<String> imageList = new ArrayList<String>();
		String result = "test";
		JSONObject items = null;
		JSONObject item = null;
		JSONArray itemList = null;

		
		String requestCommon = RequestURL.COMMONINFOURL;
		String requestIntro = RequestURL.INTROURL;
		String requestImage = RequestURL.DETAILIMAGEURL;
		String requestDetail = RequestURL.DETAILURL;
		String[] requestURLList = {requestCommon, requestIntro, requestImage, requestDetail};
		
		List<Integer> idList = mapper.allFestivalId();
		Iterator<Integer> iterList = idList.iterator();
		while(iterList.hasNext()) {
			int bufferSize = param.length();
			param.delete(0, bufferSize);

			String req = "&contentId="+iterList.next();
			param.append(req);
			for(int i=0;i<requestURLList.length;i++) {
																			System.out.println("URL: "+requestURLList[i]+param.toString());
				try {
					URL url = new URL(requestURLList[i]+param.toString());
					InputStream in = url.openStream();
					CachedOutputStream cos = new CachedOutputStream();
					IOUtils.copy(in, cos);
					in.close();
					cos.close();
					String data = cos.getOut().toString();
					JSONParser parser = new JSONParser();
					Object obj = parser.parse(data);
					JSONObject json = (JSONObject)obj;
					JSONObject response = (JSONObject)json.get("response");
					JSONObject body = (JSONObject)response.get("body");
																			System.out.println("Response: "+body);
					if(APIUtility.checkItem(body.get("items")).equals("")) {
																			System.out.println("None Data");
						continue;
					}
					items = (JSONObject)body.get("items");
					switch(requestURLList[i]) {
					case RequestURL.COMMONINFOURL:
						item = (JSONObject)items.get("item");
						dto.setF_id(Integer.parseInt(APIUtility.checkItem(item.get("contentid"))));
						dto.setF_homepage(APIUtility.checkItem(item.get("homepage")));								
						dto.setF_telname(APIUtility.checkItem(item.get("telname")));								
						dto.setF_tel(APIUtility.checkItem(item.get("tel")));								
						break;
					case RequestURL.INTROURL:
						item = (JSONObject)items.get("item");
						dto.setF_age(APIUtility.checkItem(item.get("agelimit"),"모든 연령"));
						dto.setF_eventplace(APIUtility.checkItem(item.get("eventplace")));
						dto.setF_playtime(APIUtility.checkItem(item.get("playtime")));
						break;
					case RequestURL.DETAILIMAGEURL:
						if(items.get("item") instanceof JSONObject) {
							item = (JSONObject)items.get("item");
							imageList.add(APIUtility.checkItem(item.get("originimgurl")));
							
						} else {
							itemList = (JSONArray)items.get("item");
							for(int j=0; j<itemList.size(); j++) {
								item = (JSONObject)itemList.get(j);
								imageList.add(APIUtility.checkItem(item.get("originimgurl")));
							}
						}
						
						break;
					case RequestURL.DETAILURL:
						if(items.get("item") instanceof JSONObject) {
							item = (JSONObject)items.get("item");
							dto.setF_content(APIUtility.checkItem(item.get("infoname"))+": "+APIUtility.checkItem(item.get("infotext")+"<br>"));
						} else {
							itemList = (JSONArray)items.get("item");
							String content = "";
							for(int j=0; j<itemList.size(); j++) {
								item = (JSONObject)itemList.get(j);
								content += APIUtility.checkItem(item.get("infoname"))+": "+APIUtility.checkItem(item.get("infotext")+"<br>");
							}
							dto.setF_content(content);								
						}
						break;
					}
				} catch (MalformedURLException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			if(mapper.enrollFestivalDetail(dto) == 1) {
				result = "Success";
				Iterator<String> imageListIter = imageList.iterator();
				FestivalDTO imageDTO = new FestivalDTO();
				imageDTO.setF_id(dto.getF_id());
				while(imageListIter.hasNext()) {
					imageDTO.setF_image(imageListIter.next());
					if(imageDTO.getF_id() == 2633479)
					System.out.println();
					mapper.enrollFestivalImage(imageDTO);
				}
				imageList.clear();
			}else {
				result = "Fail";
			}
		}
		entity = new ResponseEntity<String>(result, HttpStatus.OK);
		return entity;
	}
	
	// Festival 최신화
	// 이번년도 기준이며 다른 년도 정보를 얻고 싶으면 REQUESTURL 수정 필요
	@PostMapping(value="/tour/api/list/allCreate")
	public void allCreate(@RequestBody Map map){
		System.out.println("success");
		System.out.println(map.get("f_sdate"));
		String requestAllFestivalURL = RequestURL.ALLFESTIVALURL;
		Random random = new Random();
		try {
			URL url = new URL(requestAllFestivalURL);
			InputStream in = url.openStream();  
			CachedOutputStream cos = new CachedOutputStream();
			IOUtils.copy(in, cos);
			in.close();
			cos.close();
			
			String data = cos.getOut().toString();
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(data);
			JSONObject json = (JSONObject)obj;
			JSONObject response = (JSONObject)json.get("response");
			JSONObject body = (JSONObject)response.get("body");
			JSONObject items = (JSONObject)body.get("items");
			JSONArray itemList = (JSONArray)items.get("item");
			
			for(int i=0;i<itemList.size();i++) {
				FestivalDTO dto = new FestivalDTO();
				JSONObject item = (JSONObject)itemList.get(i);
				dto.setF_id(Integer.parseInt(APIUtility.checkItem(item.get("contentid"))));
				dto.setF_title(APIUtility.checkItem(item.get("title")));
				dto.setF_area(Integer.parseInt(APIUtility.checkItem(item.get("areacode"))));
				dto.setF_address(APIUtility.checkItem(item.get("addr1")));
				dto.setF_sdate(APIUtility.checkItem(item.get("eventstartdate")));
				dto.setF_edate(APIUtility.checkItem(item.get("eventenddate")));
				dto.setF_cnt(Integer.parseInt(APIUtility.checkItem(item.get("readcount"))));
				dto.setF_tel(APIUtility.checkItem(item.get("tel")));
				dto.setF_image(APIUtility.checkItem(item.get("firstimage")));
				int price = (random.nextInt(10)+1)*1000;
				dto.setF_price(price);
				mapper.enrollFestival(dto);
				mapper.enrollFestivalImage(dto);
				
				//Festival 최신화 하고 최적화 반드시 필요
				//Image 가 없는 축제 삭제
				mapper.optimize();
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
}
