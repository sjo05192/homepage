package team;

import java.util.*;

public class TeamTest {

	public static void main(String[] args) {
		TeamDAO dao  = new TeamDAO();
//		list(dao);
//		read(dao);
//		create(dao);
//		update(dao);
//		delete(dao);
		total(dao);
	}

	private static void total(TeamDAO dao) {
		Map map = new HashMap();
		map.put("col", "name");
		map.put("word", "");
		int total = dao.total(map);
		p("레코드 횟수:"+total);
		
	}

	private static void delete(TeamDAO dao) {
		int teamno = 2;

		if(dao.delete(teamno)){
			p(" 성공 ");
		}else 
			p( " 실패 ");
	}

	private static void update(TeamDAO dao) {
		int teamno = 1;
		TeamDTO dto = dao.read(teamno);
		dto.setPhone("010-1234-0000");
		dto.setZipcode("00005");
		dto.setAddress1("서울시 강서구");
		dto.setAddress2("마곡동");
		dto.setSkill("java, jsp");
		dto.setHobby("독서");
		dto.setFilename("member2.jpg");

		if(dao.update(dto)){
			p(" 성공 ");
		}else 
			p( " 실패 ");
	}

	private static void create(TeamDAO dao) {
		TeamDTO dto = new TeamDTO();
		dto.setName("김성아");
		dto.setGender("여자");
		dto.setPhone("010-9097-7846");
		dto.setZipcode("07595");
		dto.setAddress1("서울시 강서구 마곡동");
		dto.setAddress2("마곡동~~");
		dto.setSkill("java, jsp");
		dto.setHobby("영화 감상");
		dto.setFilename("member.jpg");

		if(dao.create(dto)){
			p(" 성공 ");
		}else 
			p( " 실패 ");
	}

	private static void read(TeamDAO dao) {
		int teamno = 1;
		TeamDTO dto = dao.read(teamno);
		p(dto);
	}

	private static void list(TeamDAO dao) {
		Map map = new HashMap();
		map.put("col", "name");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 3);
				
	
		List<TeamDTO> list = dao.list(map);
		for(int i=0; i < list.size(); i++){
			TeamDTO dto = list.get(i);
			p(dto);
			p("------------");
		}
	}

	private static void p(TeamDTO dto) {
		p("번호 (list) : " + dto.getTeamno());
		p("이름 (list) : " + dto.getName());
		p("성별 : " + dto.getGender());
		p("전화 (list) : " + dto.getPhone());
		p("우편 : " + dto.getZipcode());
		p("주소 : " + dto.getAddress1());
		p("상세 : " + dto.getAddress2());
		p("스킬 (list) : " + dto.getSkill());
		p("취미 : " + dto.getHobby());
		p("파일 : " + dto.getFilename());
	}

	private static void p(String string) {
		System.out.println(string);
	}

}
