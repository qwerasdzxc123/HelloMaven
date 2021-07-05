package edu.hue.crud.bean;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Pattern;


public class Employee {
    private Integer empId;

    @Pattern(regexp = "(^[a-z0-9_-]{5,12}$)|(^[\\u2E80-\\u9FFF]{2,5})",
            message = "用户名必须是2-5位中文或者5-12位字符串")
    private String lastName;

    private String gender;

    @Pattern(regexp = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$",
            message = "邮箱格式不合法！")
    private String email;

    private Integer dId;

    private Department dept;

    public Employee() {
    }

    public Employee(Integer empId, String lastName, String gender, String email, Integer dId) {
        this.empId = empId;
        this.lastName = lastName;
        this.gender = gender;
        this.email = email;
        this.dId = dId;
    }

    public Department getDept() {
        return dept;
    }

    public void setDept(Department dept) {
        this.dept = dept;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName == null ? null : lastName.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }
}