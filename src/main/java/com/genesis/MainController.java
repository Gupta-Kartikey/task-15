package com.genesis;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.genesis.beans.Emp;
import com.genesis.cruds.EmployeeCRUD;
import com.genesis.util.Util;

@Controller 
public class MainController {
	@RequestMapping("AddEmployee")
	public ModelAndView addEmployee(@ModelAttribute("info") Emp model) {
		EmployeeCRUD ec=new EmployeeCRUD(new Util());
		model.setEno(ec.addEmployee(model));
		ModelAndView mv=new ModelAndView();
		mv.setViewName("addEmployee.jsp");
		return mv;
	}
	
	@RequestMapping("GetEmployee")
	public ModelAndView getEmployee(@ModelAttribute Emp model) {
		EmployeeCRUD ec=new EmployeeCRUD(new Util());
		Emp emp=ec.searchEmployee(model.getEno());
		ModelAndView mv=new ModelAndView();
		mv.addObject("employee", emp);
		mv.setViewName("searchEmployee.jsp");
		return mv;
	}
	
	@RequestMapping("GetEmployees")
	public ModelAndView getEmployees() {
		EmployeeCRUD ec=new EmployeeCRUD(new Util());
		ModelAndView mv=new ModelAndView();
		mv.addObject("emps", ec.viewAllEmployee());
		mv.setViewName("viewAllEmployees.jsp");
		return mv;
	}
	@RequestMapping("GetDelEmployee")
	public ModelAndView getDelEmployee(@ModelAttribute Emp model) {
		EmployeeCRUD ec=new EmployeeCRUD(new Util());
		Emp emp=ec.searchEmployee(model.getEno());
		ModelAndView mv=new ModelAndView();
		System.out.println(emp+"   "+model.getEno());
		if(emp!=null) {
			mv.addObject("employee", emp);
			mv.addObject("delete", "working");
		}
		else
			mv.addObject("delete", "none");
		mv.setViewName("deleteEmployee.jsp");
		return mv;
	}
	

	@RequestMapping("DeleteEmployee")
	public ModelAndView deleteEmployee(@ModelAttribute("employee") Emp model) {
		System.out.println(model);
		ModelAndView mv=new ModelAndView();
		EmployeeCRUD ec=new EmployeeCRUD(new Util());
		if(ec.deleteEmployee(model)!=null)
			mv.addObject("delete", "true");
		else
			mv.addObject("delete", "none");
		
//		mv.addObject("employee", emp);
		mv.setViewName("deleteEmployee.jsp");
		return mv;
	}
	@RequestMapping("GetUpdateEmployee")
	public ModelAndView getUpdateEmployee(@ModelAttribute Emp model) {
		EmployeeCRUD ec=new EmployeeCRUD(new Util());
		Emp emp=ec.searchEmployee(model.getEno());
		ModelAndView mv=new ModelAndView();
		System.out.println(emp+"   "+model.getEno());
		if(emp!=null) {
			mv.addObject("employee", emp);
			mv.addObject("update", "working");
		}
		else
			mv.addObject("update", "none");
		mv.setViewName("updateEmployee.jsp");
		return mv;
	}
	

	@RequestMapping("UpdateEmployee")
	public ModelAndView updateEmployee(@ModelAttribute("employee") Emp model) {
		
		ModelAndView mv=new ModelAndView();
		EmployeeCRUD ec=new EmployeeCRUD(new Util());
		if(ec.updateEmployee(model))
			mv.addObject("update", "true");
		else
			mv.addObject("update", "none");
		
		mv.setViewName("updateEmployee.jsp");
		return mv;
	}
}
