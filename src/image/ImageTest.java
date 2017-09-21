package image;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ImageTest {

	public static void main(String[] args) {
		ImageDAO dao = new ImageDAO();
		list(dao);
		read(dao);
		delete(dao);
		update(dao);
		create(dao);
	}
	private static void create(ImageDAO dao) {
		ImageDTO dto = new ImageDTO();
		dto.setImageno(100);
		dto.setPname("작성자");
		dto.setTitle("글제목");
		dto.setContent("글내용");
		dto.setPasswd("1234");
		dto.setWdate("2017/06/23");
		
		
		if(dao.create(dto)){
			p("성공");
		}else{
			p("실패");
		}
		
	}
	private static void update(ImageDAO dao) {
		ImageDTO dto = new ImageDTO();
		if(dao.update(dto)){
			p("성공");
		}else {
			p("실패");
		}
		
	}
	private static void delete(ImageDAO dao) {
		int imageno = 1;
		if(dao.delete(imageno)){
			p("성공");
		}else {
			p("실패");
		}
	}
	private static void read(ImageDAO dao) {
		int imageno = 1;
		ImageDTO dto = dao.read(imageno);
		p(dto);
		
	}
	private static void list(ImageDAO dao) {
		Map map = new HashMap();
		map.put("col", "pname");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 3);
		List<ImageDTO> list = dao.list(map);
		for(int i=0; i<list.size(); i++){
			ImageDTO dto = list.get(i);
			p(dto);
		}
	}
	private static void p(String str) {
		System.out.println(str);
	}
	private static void p(ImageDTO dto){
		p("번호 :"+dto.getImageno());
		p("작성자 : "+dto.getPname());
		p("제목 : "+dto.getTitle());
		p("내용 : "+dto.getContent());
		p("비밀번호 : "+dto.getPasswd());
		p("작성날짜 : "+dto.getWdate());
		p("grpno : "+dto.getGrpno());
		p("indent : "+dto.getIndent());
		p("ansnum : "+dto.getAnsnum());
	}
}
