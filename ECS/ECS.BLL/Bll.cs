using System;
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
        public string InsertNewUser(string firstName, string lastName, int volTypeId, int compId, string last4Digits, string userId, string pin)
        {
            Dal db = new Dal();
            return db.InsertNewUser(firstName, lastName, volTypeId, compId, last4Digits, userId, pin);
        }
        public DataTable GetVolunteerTypes()
        {
            Dal db = new Dal();
            return db.GetVolunteerTypes();
        }
    }
}
