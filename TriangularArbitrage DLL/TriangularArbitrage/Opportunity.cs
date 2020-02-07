using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TriangularArbitrage
{
    public class Opportunity
    {
        public string Time { get; set; }
        public string Symbol1 { get; set; }
        public string Symbol2 { get; set; }
        public string Symbol3 { get; set; }
        public double Bid1 { get; set; }
        public double Ask1 { get; set; }
        public double Bid2 { get; set; }
        public double Ask2 { get; set; }
        public double Bid3 { get; set; }
        public double Ask3 { get; set; }
        public double ForwardArbitrage { get; set; }
        public double BackwardArbitrage { get; set; }
    }
}
