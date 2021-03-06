﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using ECS.DAL;
using ECS.Model;


namespace ECS.BLL
{
    public class Bll
    {
        /// <summary>
        /// Cici Carter
        /// </summary>
        /// <param name="firstName"></param>
        /// <param name="lastName"></param>
        /// <param name="volTypeId"></param>
        /// <param name="compId"></param>
        /// <param name="last4Digits"></param>
        /// <param name="userId"></param>
        /// <param name="pin"></param>
        /// <returns></returns>
        public string InsertNewUser(string firstName, string lastName, int volTypeId, int compId, string last4Digits, string userId, string pin)
        {
            Dal db = new Dal();
            return db.InsertNewUser(firstName, lastName, volTypeId, compId, last4Digits, userId, pin);
        }

        //Overloaded method for above.
        public string InsertNewUser(User u)
        {
            return InsertNewUser(u.FirstName, u.LastName, u.VolunteerTypeID, u.CompanyID, u.Last4DigitsOfPhone, u.UserID, u.PIN);
        }

        public DataTable GetChildren(int volunteerId)
        {
            Dal db = new Dal();
            DataTable tbl = db.GetChildrenByVolunteerId(volunteerId);

            //Add the "N/A" row.
            DataRow row = tbl.NewRow();
            row["ChildID"] = 0;
            row["Child"] = "N/A";
            tbl.Rows.InsertAt(row, 0); // insert this new row at the top

            return tbl;
        }

        public DataTable GetChildrenWithoutNA(int volunteerId)
        {
            Dal db = new Dal();
            DataTable tbl = db.GetChildrenByVolunteerId(volunteerId);

            return tbl;
        }

        /// <summary>
        /// Cici Carter
        /// </summary>
        /// <returns></returns>
        public DataTable GetVolunteerTypes()
        {
            Dal db = new Dal();
            return db.GetVolunteerTypes();
        }

        public string GetForgottenUser(string firstName, string lastName, string last4Digit)
        {
            Dal db = new Dal();
            return db.GetForgottenUser(firstName, lastName, last4Digit);
        }

        /// <summary>
        /// Cici Carter
        /// </summary>
        /// <Date>3/1/2017</Date>
        /// <returns></returns>
        public DataTable GetVolunteerTypes(bool addSelectRow) //overloaded GetVolunteerTypes()
        {
            DataTable tbl = GetVolunteerTypes(); //use above bll method
            if (addSelectRow)
            {
                DataRow row = tbl.NewRow();
                row["VolunteerTypeID"] = 0;
                row["VolunteerTypeDescr"] = "Select a Volunteer Type";
                tbl.Rows.InsertAt(row, 0); // insert this new row at the top
            }
            return tbl;
        }

        /// <summary>
        /// Cici Carter
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="pin"></param>
        /// <returns></returns>
        public bool ValidateLogin(string userId, string pin)
        {
            Dal db = new Dal();
            return db.ValidateLogin(userId, pin);
        }
        /// <summary>
        /// Cici Carter
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public User GetUserInfo(string userId)
        {
            Dal db = new Dal();
            return db.GetUserInfo(userId);
        }

        /// <summary>
        /// Cici Carter
        /// </summary>
        /// <returns></returns>
        public DataTable GetVolunteers()
        {
            Dal db = new Dal();
            return db.GetVolunteers();
        }

        /// <summary>
        /// Cici Carter
        /// </summary>
        /// <param name="firstName"></param>
        /// <param name="lastName"></param>
        /// <param name="last4Digits"></param>
        /// <param name="userId"></param>
        /// <returns></returns>
        public string UpdateUser(string firstName, string lastName, string last4Digits, string userId, string pin)
        {
            Dal db = new Dal();
            return db.UpdateUser(firstName, lastName, last4Digits, userId, pin);
        }


        /// <summary>
        /// Cici Carter
        /// </summary>
        /// <param name="firstName"></param>
        /// <param name="lastName"></param>
        /// <param name="last4Digits"></param>
        /// <param name="userId"></param>
        /// <returns></returns>
        public string UpdateUser(string firstName, string lastName, string last4Digits, string userId, string pin, string volunteerType)
        {
            Dal db = new Dal();
            return db.UpdateUser(firstName, lastName, last4Digits, userId, pin, volunteerType);
        }

        // ad
        public DataTable GetCenters()
        {
            Dal db = new Dal();
            return db.GetCenters();
        }

        /// <summary>
        /// Cici Carter
        /// </summary>
        /// <Date>3/1/2017</Date>
        /// <returns></returns>
        public DataTable GetCenters(bool addSelectRow) //overloaded GetCenters()
        {
            DataTable tbl = GetCenters(); //use above bll method
            if (addSelectRow)
            {                
                DataRow row = tbl.NewRow();
                row["CenterID"] = 0;
                row["CenterName"] = "Select a Center";
                tbl.Rows.InsertAt(row, 0); // insert this new row at the top
            }
            return tbl;
        }

        // ad
        public DataTable GetTasks()
        {
            Dal db = new Dal();
            return db.GetTasks();
        }

        /// <summary>
        /// Cici Carter
        /// </summary>
        /// <Date>3/1/2017</Date>
        /// <returns></returns>
        public DataTable GetTasks(bool addSelectRow) //overloaded GetTasks()
        {
            DataTable tbl = GetTasks(); //use above bll method
            if (addSelectRow)
            {
                DataRow row = tbl.NewRow();
                row["TaskID"] = 0;
                row["TaskDescr"] = "Select a Task";
                tbl.Rows.InsertAt(row, 0); // insert this new row at the top
            }
            return tbl;
        }

        public Task GetTaskById(int taskId)
        {
            Task task = new Task();
            DataTable dt = GetTasks();

            DataRow[] result = dt.Select(String.Format("TaskID = {0}", taskId));
            foreach (DataRow row in result) // should only return one row
            {
                task.TaskID = taskId;
                task.TaskDescr = row["TaskDescr"].ToString();
                task.PricePerMinute = Convert.ToDecimal(row["PricePerMinute"]);
                task.RestrictToVolunteerTypes = row["RestrictToVolunteerTypes"].ToString();
            }

            return task;

        }


        public object GetStaffTypes()
        {
            Dal db = new Dal();
            return db.GetStaffTypes();
        }

        public string GetPIN(string username, string last4ofPhone)
        {
            Dal db = new Dal();
            return db.GetPIN(username, last4ofPhone);
        }

        ///
        /// Needs to be worked on && method of same name in Dal
        ///
        public string GetUsername(string firstName, string lastname, string last4ofPhone)
        {
            Dal db = new Dal();
            return db.GetUsername();
        }

        public string GetStaffTypeForID(string id)
        {
            Dal db = new Dal();
            return db.GetStaffTypeForID(id);
        }

        public string UpdateStaffType(string id, string sType)
        {
            Dal db = new Dal();
            return db.UpdateStaffType(id, sType);
        }

        public string AddStaffType(string sType)
        {
            Dal db = new Dal();
            return db.AddStaffType(sType);
        }
        
        public DataTable GetReport(int monthNum, int taskId, int volunteerTypeId, int centerId)
        {
            Dal db = new Dal();
            return db.GetReport(monthNum, taskId, volunteerTypeId, centerId);
        }

        public string LogInKind(int volunteerId, int childId, int taskId, int centerId, int hoursVal, int minVal, DateTime logDate)
        {
            Dal db = new Dal();
            return db.LogInKind(volunteerId, childId, taskId, centerId, hoursVal, minVal, logDate);
        }

        public DataTable GetCompanies()
        {
            Dal db = new Dal();
            return db.GetCompanies();
        }

        public string GetCompanyForID(string id)
        {
            Dal db = new Dal();
            return db.GetCompanyForID(id);
        }

        public string UpdateCompany(string id, string company)
        {
            Dal db = new Dal();
            return db.UpdateCompany(id, company);
        }

        public string AddCompany(string company)
        {
            Dal db = new Dal();
            return db.AddCompany(company);
        }

        public string GetVolunteerTypeForID(string id)
        {
            /*
             * Re-use the GetVolunteerTypes() method above and restrict return to a single row. [Cici-2/23/2017]
             * (From https://www.dotnetperls.com/datatable-select)
            */
            DataTable dt = GetVolunteerTypes(); 
            DataRow[] result = dt.Select(String.Format("VolunteerTypeID = {0}", id));
            string volunteerType="";
            foreach (DataRow row in result) // should only return one row
            {
                volunteerType = row["VolunteerTypeDescr"].ToString();
            }
            return volunteerType;
        }

        public string UpdateVolunteerType(string id, string sType)
        {
            Dal db = new Dal();
            return db.UpdateVolunteerType(id, sType);
        }

        public string AddVolunteerType(string sType)
        {
            Dal db = new Dal();
            return db.AddVolunteerType(sType);
        }
        //ad
        public bool ValidateUserInfo(string userId, string phone)
        {
            Dal db = new Dal();
            return db.ValidateUserInfo(userId, phone);
        }

        public bool UpdateUserPin(string userId, string pin)
        {
            Dal db = new Dal();
            return db.UpdateUserPin(userId, pin);
        }

        public object GetMonthlySummaryReport(int monthNumber)
        {
            Dal db = new Dal();
            return db.GetMonthlySummaryReport(monthNumber);
        }

        //public string ResetPassword(string pin)
        //{
        //    Dal db = new Dal();
        //    return db.ResetPassword(pin);
        //}

        /// <summary>
        /// Gets the current month's hours for a specified volunteer
        /// [cici carter]
        /// </summary>
        /// <param name="startDate"></param>
        /// <param name="endDate"></param>
        /// <param name="volunteerID"></param>
        /// <returns></returns>
        public DataTable GetHoursForCurrentMonth(DateTime startDate, DateTime endDate, int volunteerID)
        {
            Dal db = new Dal();
            return db.GetHoursForCurrentMonth(startDate, endDate, volunteerID);
        }

        public Center GetCenterForID(string id)
        {
            Dal db = new Dal();
            return db.GetCenterForID(id);
        }

        public Child GetChildByChildID(string childId, string volId)
        {
            Dal db = new Dal();
            return db.GetChildByChildID(childId, volId);
        }
        public string AddChild(int volunteerID, Child child)
        {
            Dal db = new Dal();
            return db.AddChild(volunteerID, child);
        }

        public string UpdateChild(Child child)
        {
            Dal db = new Dal();
            return db.UpdateChild(child);
        }

        public string EditCenter(Center center)
        {
            Dal db = new Dal();
            return db.EditCenter(center);
        }

        public string AddCenter(Center center)
        {
            Dal db = new Dal();
            return db.AddCenter(center);
        }

        public string EditTask(Task task)
        {
            Dal db = new Dal();
            return db.EditTask(task);
        }

        public string AddTask(Task task)
        {
            Dal db = new Dal();
            return db.AddTask(task);
        }

        public User GetUserInfoForVolunteer(int volunteerId)
        {
            Dal db = new Dal();
            return db.GetUserInfoForVolunteer(volunteerId);
        }
    }
}
