package com.example.service;

import com.example.bean.Employee;
import com.example.bean.EmployeeExample;

import com.example.mapper.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {

    @Autowired
    private EmployeeMapper employeeMapper;

    /*
    * 查询所有员工信息，不带部门*/
    public List<Employee> findAll() {
        return employeeMapper.selectByExampleWithDept(null);
    }

    public void saveEmp(Employee employee) {
        employeeMapper.insertSelective(employee);
    }

//    检验用户名
    public boolean check(String empName) {
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria= employeeExample.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count =  employeeMapper.countByExample(employeeExample);
        return  count == 0;
    }
//根据员工id查询
    public Employee getEmp(Integer id) {
         Employee employee = employeeMapper.selectByPrimaryKeyWithDept(id);
         return employee;
    }

    public void updateEmp(Employee emploeey) {
       employeeMapper.updateByPrimaryKeySelective(emploeey);
    }

    public void deleteEmpById(Integer id) {
        employeeMapper.deleteByPrimaryKey(id);
    }
}
