package com.tourism.dto;

public class AdminDTO {
	private int adminId;
	private String name;
	private String email;
	private String role;
	private String password;

	public AdminDTO(int adminId, String name, String email, String role) {
		this.adminId = adminId;
		this.name = name;
		this.email = email;
		this.role = role;
	}

	public AdminDTO(int adminId, String name, String email, String role, String password) {
		this(adminId, name, email, role);
		this.password = password;
	}

	public int getAdminId() {
		return adminId;
	}

	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
