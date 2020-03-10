package com.example.service;

import com.example.bean.Department;
import com.example.mapper.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;

    public List<Department> getAllDepartment() {
        List<Department> list = departmentMapper.selectByExample(null);
        return list;
    }
}
