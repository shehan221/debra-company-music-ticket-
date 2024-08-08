using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace company
{
    public class Tickets
    {
        public int TicketID { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public int AvailableTickets { get; set; }
        public DateTime EventDate { get; set; }
    }
}