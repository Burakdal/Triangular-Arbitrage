#import "TriangularArbitrage.dll"
#import

#import "Newtonsoft.Json.dll"
#import

///dll functions for form which is call from Triangular C# dll
void FormHelperAddWithJson(string value)
{
  FormHelper::AddWithJson(value);
}

void FormHelperOpenForm()
{
  FormHelper::OpenForm();
}

void FormHelperAddOpportunity(string time, string symbol1, string symbol2, string symbol3, double bid1, double ask1,
               double bid2, double ask2, double bid3, double ask3, double forward, double backward)
{
  FormHelper::AddToList(time, symbol1, symbol2, symbol3, bid1, ask1, bid2, ask2, bid3, ask3, forward, backward);
}

void FormHelperBindAll()
{
  FormHelper::Bind();
}

void FormHelperCloseForm()
{
  FormHelper::CloseForm();
}