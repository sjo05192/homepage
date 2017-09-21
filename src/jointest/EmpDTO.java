package jointest;

public class EmpDTO {
	private int empno;
	private String name;
	private String phone;
	private String email;
	private String zipcode;
	private String address;
	private String regdate;
	private int deptno;
	
	private Emp_bodyDTO ebdto; //1:1 join을 위한 자식DTO type
	
	public EmpDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public EmpDTO(int empno, String name, String phone, String email,
			String zipcode, String address, String regdate, int deptno,
			Emp_bodyDTO ebdto) {
		super();
		this.empno = empno;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.zipcode = zipcode;
		this.address = address;
		this.regdate = regdate;
		this.deptno = deptno;
		this.ebdto = ebdto;
	}

	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}

	public Emp_bodyDTO getEbdto() {
		return ebdto;
	}

	public void setEbdto(Emp_bodyDTO ebdto) {
		this.ebdto = ebdto;
	}
	
	
	
}
