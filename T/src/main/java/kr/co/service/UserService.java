package kr.co.service;

import java.util.List;

import kr.co.vo.UserVo;

public interface UserService {
	UserVo selectUserById(String id);
	List<UserVo> selectUserList() throws Exception;
	void insertUser(UserVo vo);
	void updateUser(UserVo vo);
	int deleteUser(UserVo vo);
}
