package memo;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MemoTest {
	public static void main(String[] args) throws SQLException {
		MemoDAO dao = new MemoDAO();
		
		//create(dao);
		//read(dao);
		//upviewcnt(dao);
		//update(dao);
		//list(dao);
		//total(dao);
		delete(dao);
	}
	
	
	

	private static void total(MemoDAO dao) throws SQLException {
		String col = "";
		String word = "";
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		
		p("레코드수:"+dao.total(map));
	}
	
	private static void list(MemoDAO dao) throws SQLException {
		int sno = 1;
		int eno = 5;
		String col = "";
		String word = "";
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("col", col);
		map.put("word", word);
		List<MemoDTO> list = dao.list(map);
		for(int i=0; i<list.size(); i++) {
			MemoDTO dto = list.get(i);
			p(dto);
			p("======================");
		}
		
	}
	
	
	private static void update(MemoDAO dao) throws SQLException {
		MemoDTO dto = dao.read(406);
		dto.setTitle("변경된 제목");
		dto.setContent("변경된 내용입니다.");
		if(dao.update(dto)){
			p("성공");
		}else{
			p("실패");
		}
		
	}

	private static void upviewcnt(MemoDAO dao) throws SQLException {
		int memono = 406;
		p(dao.read(memono));
		dao.upviewcnt(memono);
		p("--------------------------------");
		p(dao.read(memono));

	}
	
	private static void read(MemoDAO dao) throws SQLException{
		int num = 406;
		MemoDTO dto = dao.read(num);
		p(dto);
	}
	
	private static void p(MemoDTO dto) {
		p("번호:" + dto.getMemono());
		p("제목:" + dto.getTitle());
		p("내용:" + dto.getContent());
		p("날짜:" + dto.getWdate());
		p("조회수:" + dto.getViewcnt());
		p("grpno:" + dto.getGrpno());
		p("indent:" + dto.getIndent());
		p("ansnum:" + dto.getAnsnum());
		
	}

	private static void delete(MemoDAO dao) throws SQLException {
		int memono = 802;
		if (dao.read(memono) == null) {
			p("글이 없습니다.");
		} else {
			MemoDTO dto = dao.read(memono);
			p(dto);
			p("======================");
			if (dao.getRefnum(memono)) {
				p("관련글이 있습니다. 삭제할수 없습니다.");
			} else {

				if (dao.delete(memono))
					p("관련글이 없습니다."+memono+"번글을 삭제합니다.");
				dto = dao.read(memono);
				if (dto == null) {
					p("찾을수 없습니다.");
				}else {
					p(dto);
				}
			}
		}
	}


	private static void create(MemoDAO dao) throws SQLException {
		MemoDTO dto = new MemoDTO();
		dto.setTitle("메모제목");
		dto.setContent("메모내용");
		
		
		if(dao.create(dto)){
			p("성공");
		}else{
			p("실패");
		}
		
	}

	private static void p(String string) {
		System.out.println(string);
		
	}

}
