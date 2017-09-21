package bbs;

import java.util.*;

public class BbsTest {

	public static void main(String[] args) {
		BbsDAO dao = new BbsDAO();
		 //list(dao);
		// read(dao);
//		 create(dao);
		// update(dao);
		// delete(dao);
//		 passwdCheck(dao);
//		upViewcnt(dao);
		total(dao);
	}

	private static void total(BbsDAO dao) {
		Map map = new HashMap();
		map.put("col", "wname");
		map.put("word", "");
		int total = dao.total(map);
		p("레코드 갯수 : "+total);
	}

	private static void upViewcnt(BbsDAO dao) {
		int bbsno = 2;
		dao.upViewcnt(bbsno);
	}

	private static void passwdCheck(BbsDAO dao) {
		Map map = new HashMap();
		map.put("bbsno", 1);
		map.put("passwd", "123");
		if (dao.passwdCheck(map))
			p("올바른 비번입니다.");
		else
			p("잘못된 비번입니다.");
	}

	private static void delete(BbsDAO dao) {
		int bbsno = 4;

		if (dao.delete(bbsno)) {
			p(" 성공 ");
		} else
			p(" 실패 ");
	}

	private static void update(BbsDAO dao) {
		int bbsno = 1;
		BbsDTO dto = dao.read(bbsno);
		dto.setWname("홍길동");
		dto.setTitle("모름");
		dto.setContent("야랴야랴");

		if (dao.update(dto)) {
			p(" 성공 ");
		} else
			p(" 실패 ");
	}

	private static void create(BbsDAO dao) {
		BbsDTO dto = new BbsDTO();
		dto.setWname("김성아");
		dto.setTitle("게시판 제목");
		dto.setContent("내용 없음");
		dto.setPasswd("1234");

		if (dao.create(dto)) {
			p(" 성공 ");
		} else
			p(" 실패 ");
	}

	private static void read(BbsDAO dao) {
		int bbsno = 1;
		BbsDTO dto = dao.read(bbsno);
		p(dto);
	}

	private static void list(BbsDAO dao) {
		Map map = new HashMap<>();
		map.put("col", "wname");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 3);
		
		List<BbsDTO> list = dao.list(map);
		for (int i = 0; i < list.size(); i++) {
			BbsDTO dto = list.get(i);
			p(dto);
			p("------------");
		}
	}

	private static void p(BbsDTO dto) {
		p("번호 : " + dto.getBbsno());
		p("이름 : " + dto.getWname());
		p("제목 : " + dto.getTitle());
		p("내용 : " + dto.getContent());
		p("조회수 : " + dto.getViewcnt());
		p("날짜 : " + dto.getWdate());
		// p("비번 : " + dto.getPasswd());
		// p("부모글 : " + dto.getGrpno());
		// p("답변 : " + dto.getIndent());
		// p("답변수 : " + dto.getAnsnum());
	}

	private static void p(String string) {
		System.out.println(string);
	}
}
