using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ECS.Model
{
    public class Task
    {
        public int TaskID { get; set; }
        public string TaskDescr { get; set; }
        public decimal PricePerMinute { get; set; }
        public string RestrictToVolunteerTypes { get; set; }
    }
}
