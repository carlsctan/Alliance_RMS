/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.myapp.data;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Carl
 */
public class Employee {
    private int empIDNum;
    private String firstName;
    private String middleName;
    private String lastName;
    private String businessUnit;
    private Date dateHired;
    private int yearsITIndustry;
    private String collegeSchool1;
    private String collegeSchool2;
    private String collegeCourse1;
    private String collegeCourse2;
    private int collegeYear;
    private String jobTitles;
    private int nriBatch;
    private Effort effort = new Effort();
    
    public Employee(){
    
    }
    
    public Employee(int EmpIDNum, String FirstName, String MiddleName, String LastName, ResultSet Effort) throws SQLException{
        this.setEmpIDNum(EmpIDNum);
        this.setFirstName(FirstName);
        this.setMiddleName(MiddleName);
        this.setLastName(LastName);
        this.setEffort(Effort);
    }
    
    
    public Employee(int EmpIDNum, String FirstName, String MiddleName, String LastName, String BusinessUnit,
        Date DateHired, int YearsITIndustry,String CollegeSchool1, String CollegeSchool2, String CollegeCourse1,
        String CollegeCourse2, int CollegeYear, String JobTitles, int NRIBatch, ResultSet rs) throws SQLException{
        this.setEmpIDNum(EmpIDNum);
        this.setFirstName(FirstName);
        this.setMiddleName(MiddleName);
        this.setLastName(LastName);
        this.setBusinessUnit(BusinessUnit);
        this.setDateHired(DateHired);
        this.setYearsITIndustry(YearsITIndustry);
        this.setCollegeSchool1(CollegeSchool1);
        this.setCollegeSchool2(CollegeSchool2);
        this.setCollegeCourse1(CollegeCourse1);
        this.setCollegeCourse2(CollegeCourse2);
        this.setCollegeYear(CollegeYear);
        this.setJobTitles(JobTitles);
        this.setNriBatch(NRIBatch);
        this.setEffort(rs);    
    }

    public int getEmpIDNum() {
        return empIDNum;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getBusinessUnit() {
        return businessUnit;
    }

    public Date getDateHired() {
        return dateHired;
    }

    public int getYearsITIndustry() {
        return yearsITIndustry;
    }

    public String getCollegeSchool1() {
        return collegeSchool1;
    }

    public String getCollegeSchool2() {
        return collegeSchool2;
    }

    public String getCollegeCourse1() {
        return collegeCourse1;
    }

    public String getCollegeCourse2() {
        return collegeCourse2;
    }

    public int getCollegeYear() {
        return collegeYear;
    }

    public String getJobTitles() {
        return jobTitles;
    }

    public int getNriBatch() {
        return nriBatch;
    }

    public Effort getEffort() {
        return effort;
    }

    public void setEmpIDNum(int empIDNum) {
        this.empIDNum = empIDNum;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setBusinessUnit(String businessUnit) {
        this.businessUnit = businessUnit;
    }

    public void setDateHired(Date dateHired) {
        this.dateHired = dateHired;
    }

    public void setYearsITIndustry(int yearsITIndustry) {
        this.yearsITIndustry = yearsITIndustry;
    }

    public void setCollegeSchool1(String collegeSchool1) {
        this.collegeSchool1 = collegeSchool1;
    }

    public void setCollegeSchool2(String collegeSchool2) {
        this.collegeSchool2 = collegeSchool2;
    }

    public void setCollegeCourse1(String collegeCourse1) {
        this.collegeCourse1 = collegeCourse1;
    }

    public void setCollegeCourse2(String collegeCourse2) {
        this.collegeCourse2 = collegeCourse2;
    }

    public void setCollegeYear(int collegeYear) {
        this.collegeYear = collegeYear;
    }

    public void setJobTitles(String jobTitles) {
        this.jobTitles = jobTitles;
    }

    public void setNriBatch(int nriBatch) {
        this.nriBatch = nriBatch;
    }

    public void setEffort(Effort effort) {
        this.effort = effort;
    }

    public void setEffort(ResultSet rs) throws SQLException {
        rs.previous();
        effort.setEffort(rs);
    }  
}
        
        
        
    

