using System;
using System.Collections.Generic;
using System.Data;
using ECS.Model;
using System.Data.SqlClient;
using System.Configuration;

namespace ECS.DAL
{
    public class Dal
    {
        #region db connection
        private string Conn = ConfigurationManager.ConnectionStrings["ecsDB"].ConnectionString;
        #endregion

        /// <summary>
        /// This inserts a new user into the database.
        /// </summary>
        /// <developer>
        /// Cici Carter
        /// </developer>
        public string InsertNewUser(string firstName, string lastName, int volTypeId, int compId, string last4Digits, string userId, string pin)
        {
            string retVal;
            try
            {
                using (SqlConnection conn = new SqlConnection(Conn))
                {
                    using (SqlCommand command = new SqlCommand("InsertNewUser", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.AddWithValue("@FirstName", firstName);
                        command.Parameters.AddWithValue("@LastName", lastName);
                        command.Parameters.AddWithValue("@VolunteerTypeId", volTypeId);
                        command.Parameters.AddWithValue("@CompanyID", compId);
                        command.Parameters.AddWithValue("@Last4Digits", last4Digits);
                        command.Parameters.AddWithValue("@UserId", userId);
                        command.Parameters.AddWithValue("@PIN", pin);

                        conn.Open();
                        command.ExecuteNonQuery();
                    }
                    conn.Close();
                    retVal = "Successfully added user.";
                }
            }
            catch (SqlException sqlEx)
            {
                if (sqlEx.Number == 2627)
                    retVal = userId + " is already taken. Please select a different user name.";
                else
                    retVal = sqlEx.Message;
            }
            catch (Exception ex)
            {
                retVal = ex.Message;
            }
            return retVal;
        }


        /// <summary>
        /// This updates info for an existing user.
        /// </summary>
        /// <developer>
        /// Cici Carter
        /// </developer>
        public string UpdateUser(string firstName, string lastName, string last4Digits, string userId, string pin)
        {
            string retVal;
            try
            {
                using (SqlConnection conn = new SqlConnection(Conn))
                {
                    //TODO: Convert this to a stored procedure, then use CommandType.StoredProcedure.
                    string sql1 = String.Format(@"Update {0} set FirstName='{1}', LastName='{2}', Last4DigitsOfPhone='{3}' where 
                                                VolunteerID = (select VolunteerID from UserLogon where UserId='{4}')",
                                                "Volunteer", firstName, lastName, last4Digits, userId, pin);
                    using (SqlCommand command1 = new SqlCommand(sql1, conn))
                    {
                        command1.CommandType = CommandType.Text;
                        conn.Open();
                        command1.ExecuteNonQuery();
                    }

                    string sql2 = String.Format(@"Update {0} set PIN='{1}' where 
                                                VolunteerID = (select VolunteerID from UserLogon where UserId='{2}')",
                                                "UserLogon", pin, userId);
                    using (SqlCommand command2 = new SqlCommand(sql2, conn))
                    {
                        command2.CommandType = CommandType.Text;
                        command2.ExecuteNonQuery();
                    }
                    conn.Close();
                    retVal = String.Format("Successfully updated user {0}.", userId);
                }
            }
            catch (Exception ex)
            {
                retVal = ex.Message;
            }
            return retVal;
        }

        /// <summary>
        /// This determines whether a user login is valid.
        /// </summary>
        /// <developer>
        /// Cici Carter
        /// </developer>
        public bool ValidateLogin(string userId, string pin)
        {
            DataTable dtRetVal = new DataTable();
            int retVal = 0;
            using (SqlConnection conn = new SqlConnection(Conn))
            {
                using (SqlCommand command = new SqlCommand("ValidateLogin", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("UserId", userId);
                    command.Parameters.AddWithValue("PIN", pin);

                    conn.Open();
                    dtRetVal.Load(command.ExecuteReader());

                    foreach (DataRow row in dtRetVal.Rows) // should only be one row.
                    {
                        retVal = (int)row["ReturnValue"];
                    }
                    conn.Close();
                }
            }
            if (retVal == 0)
            {
                return false;
            }
            else
            {
                return true;
            }

        }

        /// <summary>
        /// This retrieves the user information and stores it in the user's session.
        /// </summary>
        /// <developer>
        /// Cici Carter
        /// </developer>
        public User GetUserInfo(string userId)
        {
            DataTable dtRetVal = new DataTable();
            User u = new User();

            using (SqlConnection conn = new SqlConnection(Conn))
            {
                using (SqlCommand command = new SqlCommand("GetUserByUserId", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("UserId", userId);

                    conn.Open();
                    dtRetVal.Load(command.ExecuteReader());

                    foreach (DataRow row in dtRetVal.Rows) // should only be one row.
                    {
                        u.VolunteerID = (int)row["VolunteerID"];
                        u.FirstName = row["FirstName"].ToString();
                        u.LastName = row["LastName"].ToString();
                        u.VolunteerTypeDescr = row["VolunteerTypeDescr"].ToString();
                        u.CompanyName = row["CompanyName"].ToString();
                        u.Last4DigitsOfPhone = row["Last4DigitsOfPhone"].ToString();
                        u.UserID = row["UserID"].ToString();
                        u.PIN = row["PIN"].ToString();
                        u.IsAdmin = Convert.ToBoolean(row["IsAdmin"]);
                    }
                    conn.Close();
                }
            }
            return u;

        }

        /// <summary>
        /// This retrieves the user information and stores it in the user's session.
        /// </summary>
        /// <developer>
        /// Cici Carter
        /// </developer>
        public DataTable GetVolunteerTypes()
        {
            DataTable dtVT = new DataTable();
            using (SqlConnection conn = new SqlConnection(Conn))
            {
                using (SqlCommand command = new SqlCommand("SelectVolunteerTypes", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    conn.Open();
                    dtVT.Load(command.ExecuteReader());
                    conn.Close();
                }
            }
            return dtVT;

        }

        /// <summary>
        /// Cici Carter
        /// </summary>
        /// <returns></returns>
        public DataTable GetVolunteers()
        {
            DataTable dtVolunteers = new DataTable();
            using (SqlConnection conn = new SqlConnection(Conn))
            {
                using (SqlCommand command = new SqlCommand("SelectAllUsers", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    conn.Open();
                    dtVolunteers.Load(command.ExecuteReader());
                    conn.Close();
                }
            }
            return dtVolunteers;
        }


        public DataTable GetCenters()
        {
            DataTable dtCenter = new DataTable();
            using (SqlConnection conn = new SqlConnection(Conn))
            {
                using (SqlCommand command = new SqlCommand("SelectCenter", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    conn.Open();
                    dtCenter.Load(command.ExecuteReader());
                    conn.Close();
                }
            }
            return dtCenter;
        }


        public DataTable GetTasks()
        {
            DataTable dtTask = new DataTable();
            using (SqlConnection conn = new SqlConnection(Conn))
            {
                using (SqlCommand command = new SqlCommand("SelectTask", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    conn.Open();
                    dtTask.Load(command.ExecuteReader());
                    conn.Close();
                }
            }
            return dtTask;
        }

        public DataTable GetStaffTypes()
        {
            DataTable dtStaffTypes = new DataTable();
            using (SqlConnection conn = new SqlConnection(Conn))
            {
                using (SqlCommand command = new SqlCommand("GetStaffTypes", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    conn.Open();
                    dtStaffTypes.Load(command.ExecuteReader());
                    conn.Close();
                }
            }
            return dtStaffTypes;
        }

        /// <summary>
        /// Returns PIN
        /// </summary>
        /// <author>
        /// Cici Carter
        /// </author>
        /// <returns>PIN</returns>
        public string GetPIN(string username, string last4ofPhone)
        {
            string pin = "PIN not found in database for that user/phone combination.";
            DataTable dt = new DataTable();

            using (SqlConnection conn = new SqlConnection(Conn))
            {
                using (SqlCommand command = new SqlCommand("GetPIN", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("userId", username);
                    command.Parameters.AddWithValue("last4Digits", last4ofPhone);
                    conn.Open();
                    dt.Load(command.ExecuteReader());
                    foreach (DataRow row in dt.Rows) // should only be one row.
                    {
                        pin = row["PIN"].ToString();
                    }
                    conn.Close();
                }
            }
            return pin;
        }

        ///
        /// Needs to be worked on && method of same name in Bll
        ///
        public string GetUsername()
        {
            return null;
        }

        public string GetStaffTypeForID(string id)
        {
            DataTable dt = new DataTable();
            string staffType = "";

            using (SqlConnection conn = new SqlConnection(Conn))
            {
                using (SqlCommand command = new SqlCommand("GetStaffTypeForID", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("StaffTypeId", id);
                    conn.Open();
                    dt.Load(command.ExecuteReader());
                    foreach (DataRow row in dt.Rows) // should only be one row.
                    {
                        staffType = row["StaffTypeDescr"].ToString();
                    }
                    conn.Close();
                }
            }
            return staffType;
        }

        public string UpdateStaffType(string id, string sType)
        {
            string retVal; 
            try
            {
                using (SqlConnection conn = new SqlConnection(Conn))
                {
                    using (SqlCommand command = new SqlCommand("UpdateStaffType", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("StaffTypeDescr", sType);
                        command.Parameters.AddWithValue("StaffTypeID", id);
                        conn.Open();
                        command.ExecuteNonQuery(); // this is used for adds, updates, and deletes.
                    }

                    conn.Close();
                    retVal = String.Format("Staff Type successfully updated.");
                }
            }
            catch (Exception ex)
            {
                retVal = ex.Message;
            }
            return retVal;
        }

        public string AddStaffType(string sType)
        {
            string retVal; 
            try
            {
                using (SqlConnection conn = new SqlConnection(Conn))
                {
                    using (SqlCommand command = new SqlCommand("AddStaffType", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("StaffTypeDescr", sType);
                        conn.Open();
                        command.ExecuteNonQuery(); // this is used for adds, updates, and deletes.
                    }

                    conn.Close();
                    retVal = String.Format("Staff Type successfully added.");
                }
            }
            catch (Exception ex)
            {
                retVal = ex.Message;
            }
            return retVal;
        }
        public DataTable GetReport(int monthNum, int taskId, int volunteerTypeId, int centerId)
        {
            DataTable dtReportData = new DataTable();
            using (SqlConnection conn = new SqlConnection(Conn))
            {
                string sql = "SelectReport";
                using (SqlCommand command = new SqlCommand(sql, conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@MonthNum", monthNum);
                    command.Parameters.AddWithValue("@TaskId", taskId);
                    command.Parameters.AddWithValue("@VolunteerTypeId", volunteerTypeId);
                    command.Parameters.AddWithValue("@CenterID", centerId);
                    conn.Open();
                    dtReportData.Load(command.ExecuteReader());
                    conn.Close();
                }
            }
            return dtReportData;
        }

        /// <summary>
        ///  Cici Carter - This logs in-kind in minutes.
        /// </summary>
        /// <param name="volunteerId"></param>
        /// <param name="taskId"></param>
        /// <param name="centerId"></param>
        /// <param name="numHrs"></param>
        /// <param name="numMins"></param>
        /// <returns></returns>
        public string LogInKind(int volunteerId, int childId, int taskId, int centerId, int numHrs, int numMins, DateTime logDate)
        {
            int totalMinutes = (60 * numHrs) + numMins;
            string retVal;
            try
            {
                using (SqlConnection conn = new SqlConnection(Conn))
                {
                    using (SqlCommand command = new SqlCommand("LogInKind", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("volunteerId", volunteerId);
                        command.Parameters.AddWithValue("childId", childId);
                        command.Parameters.AddWithValue("taskId", taskId);
                        command.Parameters.AddWithValue("centerId", centerId);
                        command.Parameters.AddWithValue("totalMinutes", totalMinutes);
                        command.Parameters.AddWithValue("logDate", logDate);
                        conn.Open();
                        command.ExecuteNonQuery();
                    }

                    conn.Close();
                    retVal = "In-Kind time was successfully logged.";
                }
            }
            catch (Exception ex)
            {
                retVal = ex.Message;
            }
            return retVal;
        }

        public DataTable GetCompanies()
        {
            DataTable dtCompanies = new DataTable();
            using (SqlConnection conn = new SqlConnection(Conn))
            {
                using (SqlCommand command = new SqlCommand("GetCompanies", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    conn.Open();
                    dtCompanies.Load(command.ExecuteReader());
                    conn.Close();
                }
            }
            return dtCompanies;
        }

        public string GetCompanyForID(string id)
        {
            DataTable dt = new DataTable();
            string company = "";

            using (SqlConnection conn = new SqlConnection(Conn))
            {
                using (SqlCommand command = new SqlCommand("GetCompanyForId", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("CompanyId", id);
                    conn.Open();
                    dt.Load(command.ExecuteReader());
                    foreach (DataRow row in dt.Rows) // should only be one row.
                    {
                        company = row["CompanyName"].ToString();
                    }
                    conn.Close();
                }
            }
            return company;
        }

        public string UpdateCompany(string id, string company)
        {
            string retVal; 
            try
            {
                using (SqlConnection conn = new SqlConnection(Conn))
                {
                    using (SqlCommand command = new SqlCommand("UpdateCompany", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("CompanyId", id);
                        command.Parameters.AddWithValue("CompanyName", company);
                        conn.Open();
                        command.ExecuteNonQuery(); // this is used for adds, updates, and deletes.
                    }

                    conn.Close();
                    retVal = String.Format("Company successfully updated.");
                }
            }
            catch (Exception ex)
            {
                retVal = ex.Message;
            }
            return retVal;
        }

        public string AddCompany(string company)
        {
            string retVal; 
            try
            {
                using (SqlConnection conn = new SqlConnection(Conn))
                {
                    using (SqlCommand command = new SqlCommand("AddCompany", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("CompanyName", company);
                        conn.Open();
                        command.ExecuteNonQuery(); // this is used for adds, updates, and deletes.
                    }

                    conn.Close();
                    retVal = String.Format("Company successfully added.");
                }
            }
            catch (Exception ex)
            {
                retVal = ex.Message;
            }
            return retVal;
        }

        public string UpdateVolunteerType(string id, string sType)
        {
            string retVal; 
            try
            {
                using (SqlConnection conn = new SqlConnection(Conn))
                {
                    using (SqlCommand command = new SqlCommand("UpdateVolunteerType", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("VolunteerTypeID", Convert.ToInt32(id));
                        command.Parameters.AddWithValue("VolunteerTypeDescr", sType);
                        conn.Open();
                        command.ExecuteNonQuery(); // this is used for adds, updates, and deletes.
                    }

                    conn.Close();
                    retVal = String.Format("Volunteer Type successfully updated.");
                }
            }
            catch (Exception ex)
            {
                retVal = ex.Message;
            }
            return retVal;
        }

        public string AddVolunteerType(string sType)
        {
            string retVal; 
            try
            {
                using (SqlConnection conn = new SqlConnection(Conn))
                {
                    using (SqlCommand command = new SqlCommand("AddVolunteerType", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("volunteerTypeDescr", sType);
                        conn.Open();
                        command.ExecuteNonQuery(); // this is used for adds, updates, and deletes.
                    }

                    conn.Close();
                    retVal = String.Format("Volunteer Type successfully added.");
                }
            }
            catch (Exception ex)
            {
                retVal = ex.Message;
            }
            return retVal;
        }
        public DataTable GetChildrenByVolunteerId(int volunteerId)
        {
            DataTable dt = new DataTable();

            using (SqlConnection conn = new SqlConnection(Conn))
            {
                using (SqlCommand command = new SqlCommand("GetChildrenByVolunteerID", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("volunteerId", volunteerId);
                    conn.Open();
                    dt.Load(command.ExecuteReader());
                }
            }
            return dt;
        }

        
        public bool ValidateUserInfo(string userId, string phone)
        {
            DataTable dtRetVal = new DataTable();
            int retVal = 0;
            using (SqlConnection conn = new SqlConnection(Conn))
            {
                using (SqlCommand command = new SqlCommand("ValidateUserInfo", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("UserId", userId);
                    command.Parameters.AddWithValue("Last4DigitsOfPhone", phone);
                    conn.Open();
                    dtRetVal.Load(command.ExecuteReader());
                    foreach (DataRow row in dtRetVal.Rows) // should only be one row.  
                    {
                        retVal = (int)row["ReturnValue"];
                    }
                    conn.Close();
                }
                if (retVal == 0)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
        }

        public object GetMonthlySummaryReport(int monthNumber)
        {
            DataTable dt = new DataTable();

            using (SqlConnection conn = new SqlConnection(Conn))
            {
                using (SqlCommand command = new SqlCommand("GetMonthlySummaryReport", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("monthNum", monthNumber);
                    conn.Open();
                    dt.Load(command.ExecuteReader());
                }
            }
            return dt;
        }

        //public string ResetPassword(string pin)
        //{

        //}

        public DataTable GetHoursForCurrentMonth(DateTime startDate, DateTime endDate, int volunteerID)
        {
            DataTable dtRetVal = new DataTable();

            using (SqlConnection conn = new SqlConnection(Conn))
            {
                using (SqlCommand command = new SqlCommand("GetHoursForPeriodAndVolunteerID", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("startDate", startDate);
                    command.Parameters.AddWithValue("endDate", endDate);
                    command.Parameters.AddWithValue("volunteerID", volunteerID);

                    conn.Open();
                    dtRetVal.Load(command.ExecuteReader());
                    conn.Close();
                }
            }

            return dtRetVal;
        }

        public Center GetCenterForID(string id)
        {
            DataTable dtRetVal = new DataTable();
            Center c = new Center();

            using (SqlConnection conn = new SqlConnection(Conn))
            {
                using (SqlCommand command = new SqlCommand("GetCenterForID", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("CenterID", Convert.ToInt32(id));

                    conn.Open();
                    dtRetVal.Load(command.ExecuteReader());

                    foreach (DataRow row in dtRetVal.Rows) // should only be one row.
                    {
                        c.CenterID = Convert.ToInt32(id);
                        c.CenterName = row["CenterName"].ToString();
                        c.StreetAddress = row["StreetAddress"].ToString();
                        c.City = row["City"].ToString();
                        c.Zip = row["Zip"].ToString();
                    }

                    conn.Close();
                }
            }
            return c;
      
        }

        public Child GetChildByChildID(string id)
        {
            DataTable dtRetVal = new DataTable();
            Child c = new Child();

            using (SqlConnection conn = new SqlConnection(Conn))
            {
                using (SqlCommand command = new SqlCommand("GetChildByChildID", conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("childID", Convert.ToInt32(id));

                    conn.Open();
                    dtRetVal.Load(command.ExecuteReader());

                    foreach (DataRow row in dtRetVal.Rows) // should only be one row.
                    {
                        c.ChildID = Convert.ToInt32(id);
                        c.FirstName = row["FirstName"].ToString();
                        c.LastName = row["LastName"].ToString();
                        c.DOB = Convert.ToDateTime(row["DOB"]);
                    }

                    conn.Close();
                }
            }
            return c;
        }

        public string AddChild(int volunteerID, string firstName, string lastName, DateTime dob, string relationship)
        {
            string retVal;
            try
            {
                using (SqlConnection conn = new SqlConnection(Conn))
                {
                    using (SqlCommand command = new SqlCommand("AddChild", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("volunteerID", volunteerID);
                        command.Parameters.AddWithValue("childFName", firstName);
                        command.Parameters.AddWithValue("childLName", lastName);
                        command.Parameters.AddWithValue("DOB", dob);
                        command.Parameters.AddWithValue("relationship", relationship);

                        conn.Open();
                        command.ExecuteNonQuery();
                    }
                    conn.Close();
                    retVal = "Successfully added child.";
                }
            }

            catch (Exception ex)
            {
                retVal = ex.Message;
            }
            return retVal;
        }

        public string UpdateChild(string childId, string firstName, string lastName, DateTime dob)
        {
            string retVal;
            try
            {
                using (SqlConnection conn = new SqlConnection(Conn))
                {
                    using (SqlCommand command = new SqlCommand("UpdateChild", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("childId", Convert.ToInt32(childId));
                        command.Parameters.AddWithValue("childFName", firstName);
                        command.Parameters.AddWithValue("childLName", lastName);
                        command.Parameters.AddWithValue("DOB", dob);

                        conn.Open();
                        command.ExecuteNonQuery();
                    }
                    conn.Close();
                    retVal = "Successfully updated child.";
                }
            }

            catch (Exception ex)
            {
                retVal = ex.Message;
            }
            return retVal;
        }
    }
}
