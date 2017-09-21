package team;

public class TeamDTO {

	private int teamno;
	private String name;
	private String gender;
	private String phone;
	private String zipcode;
	private String address1;
	private String address2;
	private String skill;
//	checkbox를 통해 들어온 값이  저장되는 공간 []
	private String skills[];
	private String hobby;
	private String filename;

	public int getTeamno() {
		return teamno;
	}
	public void setTeamno(int teamno) {
		this.teamno = teamno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getSkill() {
		if(skills != null){
			String skill = "";
			for (int i = 0; i < skills.length; i++) {
				skill += skills[i];
				if (i < skills.length - 1)
					skill += " + ";
				} 
			this.skill = skill;
		}
		return skill;
	}
	public void setSkill(String skill) {
		this.skill = skill;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String[] getSkills() {
		return skills;
	}
	public void setSkills(String skills[]) {
		this.skills = skills;
	}

	}


