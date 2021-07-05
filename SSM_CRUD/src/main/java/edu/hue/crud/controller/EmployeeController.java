package edu.hue.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.hue.crud.bean.Employee;
import edu.hue.crud.bean.Msg;
import edu.hue.crud.service.EmployeeService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 肖宁
 * @create 2021-06-30 17:17
 */
@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @RequestMapping(value = "/emp/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public Msg delEmpById(@PathVariable("ids") String ids){
        if(ids.contains("-")){
            String[] strs = ids.split("-");
            List<Integer> idList = new ArrayList<Integer>();
            for(String s : strs){
                idList.add(Integer.parseInt(s));
            }
            employeeService.delEmpBatch(idList);
            return Msg.success();
        } else {
            Integer id = Integer.parseInt(ids);
            employeeService.delEmpById(id);
            return Msg.success();
        }
    }

    /**
     * 支持直接发送 put 之类的请求
     * 在 web.xml中配置：FormContentFilter过滤器
     * 作用：将请求体中的数据解析并封装成一个map，request会被重新包装
     * @param employee
     * @return
     */
    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.PUT)
    @ResponseBody
    public Msg upateEmp(Employee employee){
        employeeService.updateEmp(employee);
        return Msg.success();
    }

    /**
     * 根据 id 查询员工
     * @param id
     * @return
     */
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmpById(@PathVariable("id") Integer id){
        Employee employee = employeeService.getEmpById(id);
        return Msg.success().add("emp",employee);
    }

    /**
     * 检查用户名是否可用
     * @param empName
     * @return
     */
    @RequestMapping("/checkName")
    @ResponseBody
    public Msg checkName(@RequestParam(value = "empName") String empName){
        //用户名校验
        String regx = "(^[a-z0-9_-]{5,12}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        if( !empName.matches(regx) ){
            return Msg.file().add("msg","用户名不合法！");
        }
        Boolean falg = employeeService.checkName(empName);
        if( falg ){
            return Msg.success();
        } else {
            return Msg.file().add("msg","用户名已存在！");
        }
    }

    /**
     * 保存员工信息
     * @param employee
     * @param result
     * @return
     */
    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult result){
        //查看jsr303校验是否正确
        if(result.hasErrors()){
            Map<String,Object> map = new HashMap<String, Object>();
            //校验失败，返回错误信息，在模态框中显示错误信息
            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError error : fieldErrors){
                System.out.println("错误的字段：" + error.getField());
                System.out.println("错误信息：" + error.getDefaultMessage());
                map.put(error.getField(),error.getDefaultMessage());
            }
            return Msg.file().add("errorMsg",map);
        } else {
            employeeService.saveEmp(employee);
            return Msg.success();
        }
    }


    /**
     * 使用 Ajax 请求获取员工数据。实现客户端的无关性
     * @param pageNum
     * @return
     */
    @RequestMapping("/emps")
    @ResponseBody()
    public Msg getEmpsWithAjax(
            @RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum){
        //在查询之前调用分页
        PageHelper.startPage(pageNum,5);
        //startPage之后紧跟查询
        List<Employee> emps = employeeService.getEmps();
        //封装了详细的分页信息，包括查出的数据和连续显示的页数
        PageInfo pageInfo = new PageInfo(emps, 5);
        return Msg.success().add("pageInfo",pageInfo);
    }


    @RequestMapping("/empsOld")
    public String getEmps(@RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum,
                          Map<String,Object> map){

        //在查询之前调用分页
        PageHelper.startPage(pageNum,5);
        //startPage之后紧跟查询
        List<Employee> emps = employeeService.getEmps();
        //封装了详细的分页信息，包括查出的数据和连续显示的页数
        PageInfo pageInfo = new PageInfo(emps, 5);
        map.put("pageInfo",pageInfo);

        return "list";
    }

}
