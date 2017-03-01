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
                using (SqlCommand command = new SqlCommand("SelectUserByUserId", conn))
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

        // ad
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

        // ad
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
                //TODO: Convert this to a stored procedure, then use CommandType.StoredProcedure.
                string sel = String.Format("select StaffTypeId, StaffTypeDescr");
                string tbl = "StaffType";
                string sql = String.Format("{0} from {1}", sel, tbl);
                using (SqlCommand command = new SqlCommand(sql, conn))
                {
                    command.CommandType = CommandType.Text;
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
                //TODO: Convert this to a stored procedure, then use CommandType.StoredProcedure.
                string sel = "select PIN";
                string tbl = "UserLogon u join Volunteer v on u.VolunteerID=v.VolunteerID";
                string cri = string.Format("UserID='{0}' and Last4DigitsOfPhone='{1}'", username, last4ofPhone);
                string sql = String.Format("{0} from {1} where {2}", sel, tbl, cri);

                using (SqlCommand command = new SqlCommand(sql, conn))
                {
                    command.CommandType = CommandType.Text;
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
                //TODO: Convert this to a stored procedure, then use CommandType.StoredProcedure.
                string sel = "select StaffTypeDescr";
                string tbl = "StaffType";
                string cri = string.Format("StaffTypeID='{0}'", id);
                string sql = String.Format("{0} from {1} where {2}", sel, tbl, cri);

                using (SqlCommand command = new SqlCommand(sql, conn))
                {
                    command.CommandType = CommandType.Text;
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
            string retVal; // this stands for "returned value". This is just what we're going to return to whatever called this method.
            try
            {
                using (SqlConnection conn = new SqlConnection(Conn))
                {
                    //TODO: Convert this to a stored procedure, then use CommandType.StoredProcedure.
                    string sql = String.Format(@"Update {0} set StaffTypeDescr='{1}' where StaffTypeID={2}",
                                                "StaffType", sType, id);

                    //create a new sql command, and execute the query.
                    using (SqlCommand command = new SqlCommand(sql, conn))
                    {
                        command.CommandType = CommandType.Text;
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
            string retVal; // this stands for "returned value". This is just what we're going to return to whatever called this method.
            try
            {
                using (SqlConnection conn = new SqlConnection(Conn))
                {
                    //TODO: Convert this to a stored procedure, then use CommandType.StoredProcedure.
                    string sql = String.Format(@"Insert {0} (StaffTypeDescr) values ('{1}')",
                                                "StaffType", sType);

                    //create a new sql command, and execute the query.
                    using (SqlCommand command = new SqlCommand(sql, conn))
                    {
                        command.CommandType = CommandType.Text;
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
        public string LogInKind(int volunteerId, int taskId, int centerId, int numHrs, int numMins)
        {
            int totalMinutes = (60 * numHrs) + numMins;
            string retVal;
            try
            {
                using (SqlConnection conn = new SqlConnection(Conn))
                {
                    //TODO: Convert this to a stored procedure, then use CommandType.StoredProcedure.
                    string sql = String.Format(@"Insert {0} (VolunteerId, TaskId, CenterId, NumberMinutes)
                                                 values ({1}, {2}, {3}, {4})", "VolunteerLog",
                                                 volunteerId, taskId, centerId, totalMinutes);
                    using (SqlCommand command1 = new SqlCommand(sql, conn))
                    {
                        command1.CommandType = CommandType.Text;
                        conn.Open();
                        command1.ExecuteNonQuery();
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
                //TODO: Convert this to a stored procedure, then use CommandType.StoredProcedure.
                string sql = String.Format("select {0} from {1}", "CompanyId, CompanyName","Company");
                using (SqlCommand command = new SqlCommand(sql, conn))
                {
                    command.CommandType = CommandType.Text;
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
                //TODO: Convert this to a stored procedure, then use CommandType.StoredProcedure.
                string sel = "select CompanyName";
                string tbl = "Company";
                string cri = string.Format("CompanyID='{0}'", id);
                string sql = String.Format("{0} from {1} where {2}", sel, tbl, cri);

                using (SqlCommand command = new SqlCommand(sql, conn))
                {
                    command.CommandType = CommandType.Text;
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
            string retVal; // this stands for "returned value". This is just what we're going to return to whatever called this method.
            try
            {
                using (SqlConnection conn = new SqlConnection(Conn))
                {
                    //TODO: Convert this to a stored procedure, then use CommandType.StoredProcedure.
                    string sql = String.Format(@"Update {0} set CompanyName='{1}' where CompanyID={2}",
                                                "Company", company, id);

                    //create a new sql command, and execute the query.
                    using (SqlCommand command = new SqlCommand(sql, conn))
                    {
                        command.CommandType = CommandType.Text;
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
            string retVal; // this stands for "returned value". This is just what we're going to return to whatever called this method.
            try
            {
                using (SqlConnection conn = new SqlConnection(Conn))
                {
                    //TODO: Convert this to a stored procedure, then use CommandType.StoredProcedure.
                    string sql = String.Format(@"Insert {0} (CompanyName) values ('{1}')",
                                                "Company", company);

                    //create a new sql command, and execute the query.
                    using (SqlCommand command = new SqlCommand(sql, conn))
                    {
                        command.CommandType = CommandType.Text;
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
            string retVal; // this stands for "returned value". This is just what we're going to return to whatever called this method.
            try
            {
                using (SqlConnection conn = new SqlConnection(Conn))
                {
                    //TODO: Convert this to a stored procedure, then use CommandType.StoredProcedure.
                    string sql = String.Format(@"Update {0} set VolunteerTypeDescr='{1}' where VolunteerTypeID={2}",
                                                "VolunteerType", sType, id);

                    //create a new sql command, and execute the query.
                    using (SqlCommand command = new SqlCommand(sql, conn))
                    {
                        command.CommandType = CommandType.Text;
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
            string retVal; // this stands for "returned value". This is just what we're going to return to whatever called this method.
            try
            {
                using (SqlConnection conn = new SqlConnection(Conn))
                {
                    //TODO: Convert this to a stored procedure, then use CommandType.StoredProcedure.
                    string sql = String.Format(@"Insert {0} (VolunteerTypeDescr) values ('{1}')",
                                                "VolunteerType", sType);

                    //create a new sql command, and execute the query.
                    using (SqlCommand command = new SqlCommand(sql, conn))
                    {
                        command.CommandType = CommandType.Text;
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
    }
}
