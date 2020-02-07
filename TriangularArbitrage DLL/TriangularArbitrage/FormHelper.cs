
using System;
using System.Threading;
using System.Windows.Forms;
using Newtonsoft.Json;

namespace TriangularArbitrage
{
    public class FormHelper
    {
        private static OpportunityForm Form;
        
        public static void OpenForm()
        {
            new Thread(() =>
            {
                Form = new OpportunityForm();
                Application.EnableVisualStyles();
                Application.Run(Form);
            }).Start();
        }

        public static void Bind()
        {
            Form.Invoke(new Action(() => { Form.BindList(); }));
        }

        public static void AddWithJson(string text)
        {
            Opportunity opportunity = JsonConvert.DeserializeObject<Opportunity>(text);
            AddOpportunityToList(opportunity);
        }

        public static void AddToList(string time, string symbol1, string symbol2, string symbol3, double bid1, double ask1,
                                     double bid2, double ask2, double bid3, double ask3, double forward, double backward)
        {
            AddOpportunityToList(new Opportunity
            {
                Time = time,
                Symbol1 = symbol1,
                Symbol2 = symbol2,
                Symbol3 = symbol3,
                Bid1 = bid1,
                Ask1 = ask1,
                Bid2 = bid2,
                Ask2 = ask2,
                Bid3 = bid3,
                Ask3 = ask3,
                ForwardArbitrage = forward * 100,
                BackwardArbitrage = backward * 100
            });
        }

        private static void AddOpportunityToList(Opportunity opportunity)
        {
            Form.Invoke(new Action(() => {
                Form.AddToList(opportunity);
            }));
        }

        public static void CloseForm()
        {
            Form.Invoke(new Action(() => {
                Form.Close();
                Form.Dispose();
            }));
        }
    }
}
