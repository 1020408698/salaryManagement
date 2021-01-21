package org.student.service;

import org.student.dao.StudentDao;

//逻辑性的增删改查
//增：查+增  对Dao层进行的组装
public class StudentService {
	StudentDao studentDao = new StudentDao();

	public boolean deleteBysno(String sno) {
		return studentDao.deleteStudent(sno);
	}
	
	public boolean deleteStudentrecord(String sno) {
		return studentDao.deleteStudentrecord(sno);
	}

	public boolean deleteStudentnumber(String sno) {
		return studentDao.deleteStudentnumber(sno);
	}
	
	public boolean DeleteStudentmessage(String sno) {
		return studentDao.DeleteStudentmessage(sno);
	}
	
}
