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
                    command.CommandType = CommandType.Text;

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
                    command.CommandType = CommandType.Text;
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
                    command.CommandType = CommandType.Text;

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
                    command.CommandType = CommandType.Text;

                    conn.Open();
                    dtTask.Load(command.ExecuteReader());
                    conn.Close();
                }
            }
            return dtTask;
        }

        // ad
        // need to rework & add sp
        //
        //public string InsertNewInKind(int centerID, int taskID, string mintues)
        //{
        //    string retVal;
        //    try
        //    {
        //        using (SqlConnection conn = new SqlConnection(Conn))
        //        {
        //            using (SqlCommand command = new SqlCommand("InsertNewInKind", conn))
        //            {
        //                command.CommandType = CommandType.StoredProcedure;

        //                command.Parameters.AddWithValue("@FirstName", firstName);
        //                command.Parameters.AddWithValue("@LastName", lastName);
        //                command.Parameters.AddWithValue("@VolunteerTypeId", volTypeId);

        //                conn.Open();
        //                command.ExecuteNonQuery();
        //            }
        //            conn.Close();
        //            retVal = "Successfully added user.";
        //        }
        //    }
        //    catch (SqlException sqlEx)
        //    {
        //        if (sqlEx.Number == 2627)
        //            retVal = userId + " is already taken. Please select a different user name.";
        //        else
        //            retVal = sqlEx.Message;
        //    }
        //    catch (Exception ex)
        //    {
        //        retVal = ex.Message;
        //    }
        //    return retVal;
        //}
    }
}
