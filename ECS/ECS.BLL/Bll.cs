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

        /// <summary>
        /// Cici Carter
        /// </summary>
        /// <returns></returns>
        public DataTable GetVolunteerTypes()
        {
            Dal db = new Dal();
            return db.GetVolunteerTypes();
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

        public User GetUserInfo(string userId)
        {
            Dal db = new Dal();
            return db.GetUserInfo(userId);
        }

        // ad
        // need rework dal code & create sp
        //
        //public string InsertNewInKind(int centerID, int taskID, string mintues)
        //{
        //    Dal db = new Dal();
        //    return db.InsertNewInKind(centerID, taskID, mintues);
        //}

        // ad
        public DataTable GetCenters()
        {
            Dal db = new Dal();
            return db.GetCenters();
        }

        // ad
        public DataTable GetTasks()
        {
            Dal db = new Dal();
            return db.GetTasks();
        }
    }
}
