using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ECS.Model
{
    public class User
    {
        public int VolunteerID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string VolunteerTypeDescr { get; set; }        
        public string CompanyName { get; set; }        
        public string Last4DigitsOfPhone { get; set; }
        public string UserID { get; set; }
        public string PIN { get; set; }
    }
}
