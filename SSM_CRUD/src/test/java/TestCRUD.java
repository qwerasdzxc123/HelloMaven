import edu.hue.crud.bean.Department;
import edu.hue.crud.bean.Employee;
import edu.hue.crud.bean.EmployeeExample;
import edu.hue.crud.dao.DepartmentMapper;
import edu.hue.crud.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.UUID;

/**
 * @author 肖宁
 * @create 2021-06-30 15:46
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class TestCRUD {

    @Autowired
    private DepartmentMapper departmentMapper;

    @Autowired
    private EmployeeMapper employeeMapper;

    @Autowired
    SqlSession sqlSession;

    @Test
    public void test01(){
        /*
        //1、创建Spring IOC容器
        ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
        //2、从容器中获取 对象
        DepartmentMapper mapper = ioc.getBean(DepartmentMapper.class);
        */

        //1、插入部门
//        Department dept = new Department();
//        dept.setDeptName("公关部");
//        //departmentMapper.insertSelective(dept);
        List<Department> departments = departmentMapper.selectByExample(null);
        for(Department depa : departments){
            System.out.println(depa.getDeptId() + " " + depa.getDeptName());
        }

        //2、批量插入多个员工
//        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
//        for (int i = 0; i < 1000; i++){
//            String uid = UUID.randomUUID().toString().substring(0,5);
//            mapper.insertSelective(new Employee(null,uid, String.valueOf((i%2)+1),uid+"@qq.com", (i%3)+1));
//        }
//        System.out.println("插入完毕！");

//        EmployeeExample example = new EmployeeExample();
//        EmployeeExample.Criteria criteria = example.createCriteria();
//        criteria.andGenderEqualTo("2");
//        int i = employeeMapper.deleteByExample(example);
//        System.out.println(i);
    }

}
