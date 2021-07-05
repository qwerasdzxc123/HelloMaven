package edu.hue.crud.controller;

import edu.hue.crud.bean.Department;
import edu.hue.crud.bean.Msg;
import edu.hue.crud.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author 肖宁
 * @create 2021-07-02 14:48
 */
@Controller
public class DeptController {

    @Autowired
    DeptService deptService;

    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDepts(){

        List<Department> depts = deptService.getDepts();

        return Msg.success().add("depts",depts);
    }

}
