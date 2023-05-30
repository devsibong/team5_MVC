package kr.or.kosa.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Builder
@Data
@AllArgsConstructor
public class Member {
	private String id;
	private String pwd;
	private String name;
	private int age;
	private String gender;
	private String email;
	private String ip;
	
}
