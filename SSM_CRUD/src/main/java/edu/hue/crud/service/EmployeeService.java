package edu.hue.crud.service;

import edu.hue.crud.bean.Employee;
import edu.hue.crud.bean.EmployeeExample;
import edu.hue.crud.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

/**
 * @author 肖宁
 * @create 2021-06-30 17:19
 */
@Service
public class EmployeeService {

    @Autowired
    private EmployeeMapper employeeMapper;

    /**
     * 批量删除员工
     * @param idList
     */
    public void delEmpBatch(List<Integer> idList){
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpIdIn(idList);
        employeeMapper.deleteByExample(example);
    }

    /**
     * 根据员工id删除数据
     * @param id
     */
    public void delEmpById(Integer id){
        employeeMapper.deleteByPrimaryKey(id);
    }

    /**
     * 更新员工信息
     * @param employee
     */
    public void updateEmp(Employee employee){
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    /**
     * 根据员工 id 查询
     * @param id
     * @return
     */
    public Employee getEmpById(Integer id) {
        return employeeMapper.selectByPrimaryKey(id);
    }

    /**
     * 检查员工姓名是否可用
     * @param empName
     * @return true：可用，false：不可用
     */
    public Boolean checkName(String empName) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andLastNameEqualTo(empName);
        long count = employeeMapper.countByExample(example);
        return count == 0;
    }

    /**
     * 保存员工数据
     * @param emp
     * @return
     */
    public void saveEmp(Employee emp){
        employeeMapper.insertSelective(emp);
    }

    /**
     * 查询员工数据（分页查询）
     * @return
     */
    public List<Employee> getEmps(){
        EmployeeExample example = new EmployeeExample();
        example.setOrderByClause("emp_id");
        List<Employee> emps = employeeMapper.selectByExampleWithDept(example);
        return emps;
    }


}
