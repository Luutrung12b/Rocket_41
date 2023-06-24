package com.vti.enity;

public class Student {
    private int id;
    private String name;
    private String hometown;
    private float diemHocLuc;

    // Constructor cho phép nhập tên và hometown, với điểm học lực mặc định = 0
    public Student(String name, String hometown) {
        this.name = name;
        this.hometown = hometown;
        this.diemHocLuc = 0;
    }

    // Phương thức setter cho điểm học lực
    public void setDiemHocLuc(int diemHocLuc) {
        this.diemHocLuc = diemHocLuc;
    }

    // Phương thức cộng thêm điểm
    public void congDiem(float diem) {
        this.diemHocLuc += diem;
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getHometown() {
		return hometown;
	}

	public void setHometown(String hometown) {
		this.hometown = hometown;
	}

	public float getDiemHocLuc() {
		return diemHocLuc;
	}

	public void setDiemHocLuc(float diemHocLuc) {
		this.diemHocLuc = diemHocLuc;
	}

	public String toString() {
		String rank = null;
		if(this.getDiemHocLuc() < 4.0) {
			rank = "yếu";
		}else if(this.getDiemHocLuc() < 6.0) {
			rank = "Trung bình";
		}else if(this.getDiemHocLuc() < 8.0) {
			rank = "Khá";
		}else {
			rank = "Giỏi";
		}
		return "Student [name=" + getName() + ", score=" + getDiemHocLuc() + ", học lực=" + rank + "]";
	}
	
    
}
