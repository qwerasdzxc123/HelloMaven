package edu.hue.crud.service;

import edu.hue.crud.bean.Department;
import edu.hue.crud.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 肖宁
 * @create 2021-07-02 14:50
 */
@Service
public class DeptService {

    @Autowired
    DepartmentMapper departmentMapper;

    public List<Department> getDepts(){
        List<Department> departments = departmentMapper.selectByExample(null);
        return departments;
    }

}
