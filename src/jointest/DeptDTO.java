package jointest;

import java.util.List;

public class DeptDTO {
	private int deptno;
	private String deptname;
	private List empdtoList; //1:N 
	public DeptDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DeptDTO(int deptno, String deptname, List empdtoList) {
		super();
		this.deptno = deptno;
		this.deptname = deptname;
		this.empdtoList = empdtoList;
	}
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public String getDeptname() {
		return deptname;
	}
	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}
	public List getEmpdtoList() {
		return empdtoList;
	}
	public void setEmpdtoList(List empdtoList) {
		this.empdtoList = empdtoList;
	}

}
