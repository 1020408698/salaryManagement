package org.student.entity;

public class Student {
	private int sno;
	private String sname;
	private int sage;
	private String saddress;

	public Student(String sname, int sage, String saddress) {
		this.sname = sname;
		this.sage = sage;
		this.saddress = saddress;
	}
	
	public Student(int sno, String sname, int sage, String saddress) {
		this.sno = sno;
		this.sname = sname;
		this.sage = sage;
		this.saddress = saddress;
	}

	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public int getSage() {
		return sage;
	}

	public void setSage(int sage) {
		this.sage = sage;
	}

	public String getSaddress() {
		return saddress;
	}

	public void setSaddress(String saddress) {
		this.saddress = saddress;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Student [sno=" + sno + ", sname=" + sname + ", sage=" + sage + ", saddress=" + saddress + "]";
	}
	
}
