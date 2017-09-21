package jointest;

public class Emp_bodyDTO {
	private int empno;
	private int weight;
	private int height;
	private String blood;
	public Emp_bodyDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Emp_bodyDTO(int empno, int weight, int height, String blood) {
		super();
		this.empno = empno;
		this.weight = weight;
		this.height = height;
		this.blood = blood;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public String getBlood() {
		return blood;
	}
	public void setBlood(String blood) {
		this.blood = blood;
	}
	
	
	
}
