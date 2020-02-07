using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Windows.Forms;

namespace TriangularArbitrage
{
    public partial class OpportunityForm : Form
    {
        private BindingList<Opportunity> _bindingList;

        private List<Opportunity> _tempList = new List<Opportunity>();

        public OpportunityForm()
        {
            InitializeComponent();
        }

        public void AddToList(Opportunity opportunity)
        {
            _tempList.Add(opportunity);
        }

        public void BindList()
        {
            _bindingList = new BindingList<Opportunity>(_tempList.OrderByDescending(x=>x.ForwardArbitrage).ToList());

            opportunityGrid.AutoGenerateColumns = true;
            opportunityGrid.DataSource = _bindingList;

            _tempList = new List<Opportunity>();
        }
    }
}
