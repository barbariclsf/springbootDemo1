package com.example.controller;


import com.example.bean.Employee;
import com.example.bean.Message;
import com.example.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;

    //查询所有员工
    @RequestMapping(value = "/emps", method = RequestMethod.GET)
    public String showAllEmp(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
        //查询前调用,第几页，显示每页数量
        PageHelper.startPage(pn,5);
//        starPage后面跟的这个查询就是分页查询
        List<Employee> emps =  employeeService.findAll();
        //封装了详细的分页信息，包括我们查询出来的数据，传入连续显示的页数
        PageInfo page = new PageInfo(emps,5);
        int a[] = page.getNavigatepageNums() ;
        for(int i : a){
            System.out.println("  "+i);
        }
        model.addAttribute("pageInfo",page);
        return "list";
    }
    //保存员工信息
    @RequestMapping(value = "/emps",method = RequestMethod.POST)
    @ResponseBody
    public Message saveEmployee(Employee employee){
        employeeService.saveEmp(employee);
        return Message.success();
    }
//    校验用户名
    @RequestMapping("/checkuser")
    @ResponseBody
    public  Message check(@RequestParam("empName") String empName){
        System.out.println(empName);
        boolean b = employeeService.check(empName);
        if(b){
            return  Message.success();
        }
        else {
            return  Message.fail();
        }

    }
//根据id查询
    @RequestMapping(value = "/selectemps",method = RequestMethod.GET)
    @ResponseBody
    public Message getEmp(@RequestParam(value = "id")Integer id){
        System.out.println(id);
        Employee employee = employeeService.getEmp(id);
        return Message.success().add("emp",employee);
    }
    //更新
    @RequestMapping(value = "/updatemps",method = RequestMethod.POST)
    @ResponseBody
    public Message updateEmp(@RequestParam(value = "id")Integer id, Employee emploeeyee){
        emploeeyee.setEmpId(id);
        employeeService.updateEmp(emploeeyee);
        return Message.success();
    }
//    根据id删除
    @RequestMapping(value = "/deletemps",method = RequestMethod.GET)
    @ResponseBody
    public Message deleteEmpById(@RequestParam(value = "id")Integer id){
        employeeService.deleteEmpById(id);
        return Message.success();
    }
}
