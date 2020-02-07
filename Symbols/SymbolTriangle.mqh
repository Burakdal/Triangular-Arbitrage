
#include "AllSymbols.mqh"
#include "SymbolInfo.mqh";
#include "..\Orders\OrderSender.mqh" 
#include "..\Form\FormHelper.mqh"
#include "..\Serializer\Json.mqh"

OrderSender sender;

class SymbolTriangle
{
  private:
    SymbolInfo m_symbol1;
    SymbolInfo m_symbol2;
    SymbolInfo m_symbol3;
  public:
    SymbolTriangle(string symbol1, string symbol2, string symbol3) : 
      m_symbol1(symbol1) ,
      m_symbol2(symbol2) ,
      m_symbol3(symbol3) {}
    SymbolTriangle(int order) : 
      m_symbol1(AllSymbols[order][0]) , 
      m_symbol2(AllSymbols[order][1]) ,
      m_symbol3(AllSymbols[order][2]) {}
    void MakeBackwardArbitrage();
    void MakeForwardArbitrage();
    double ForwardArbitrageValue();
    double BackwardArbitrageValue();
    string Serialize();
    void SendJsonToForm();
    void AddToForm();
    string GetDumpFormat();
};

void SymbolTriangle::MakeBackwardArbitrage()
 {
   double lot2 = sender.SendBackward(this.m_symbol1, 0.1);
   double lot3 = sender.SendBackward(this.m_symbol2, NormalizeDouble(lot2, 2));
   sender.SendBackward(this.m_symbol3, NormalizeDouble(lot2, 2));
 }
 
void SymbolTriangle::MakeForwardArbitrage()
{
   double lot2 = sender.SendForward(this.m_symbol1, 0.1);
   double lot3 = sender.SendForward(this.m_symbol2, NormalizeDouble(lot2, 2));
   sender.SendForward(this.m_symbol3, NormalizeDouble(lot3, 2));
}
 
double SymbolTriangle::ForwardArbitrageValue()
 {
   return m_symbol1.ForwardMultiplier() * 
      m_symbol2.ForwardMultiplier() * 
      m_symbol3.ForwardMultiplier() - 1;
 }
    
double SymbolTriangle::BackwardArbitrageValue()
 {
   return m_symbol1.BackwardMultiplier() * 
      m_symbol2.BackwardMultiplier() * 
      m_symbol3.BackwardMultiplier() - 1;
 }
 
string SymbolTriangle::Serialize()
 {
   string out = "";
   CJAVal json(NULL, jtUNDEF);

   json["Time"] = TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS);
   json["Symbol1"] = m_symbol1.Name();
   json["Symbol2"] = m_symbol2.Name();
   json["Symbol3"] = m_symbol3.Name();
   json["Bid1"] = m_symbol1.Bid();
   json["Ask1"] = m_symbol1.Ask();
   json["Bid2"] = m_symbol2.Bid();
   json["Ask2"] = m_symbol2.Ask();
   json["Bid3"] = m_symbol3.Bid();
   json["Ask3"] = m_symbol3.Ask();
   json["ForwardArbitrage"] = this.ForwardArbitrageValue() * 100;
   json["BackwardArbitrage"] = this.BackwardArbitrageValue() * 100;
   
   json.Serialize(out);
   
   return out;
 }
 
void SymbolTriangle::SendJsonToForm()
 {
   string json = Serialize();
   FormHelperAddWithJson(json);
 }
 
void SymbolTriangle::AddToForm()
 {
   string time = TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS);
   string symbol1 = m_symbol1.Name();
   string symbol2 = m_symbol2.Name();
   string symbol3 = m_symbol3.Name();
   double bid1 = m_symbol1.Bid();
   double ask1 = m_symbol1.Ask();
   double bid2 = m_symbol2.Bid();
   double ask2 = m_symbol2.Ask();
   double bid3 = m_symbol3.Bid();
   double ask3 = m_symbol3.Ask();
   double arbitrage1 = this.ForwardArbitrageValue();
   double arbitrage2 = this.BackwardArbitrageValue();
   
   FormHelperAddOpportunity(time, symbol1, symbol2, symbol3, bid1, ask1, bid2, ask2, bid3, ask3, arbitrage1, arbitrage2);
 }
 
string SymbolTriangle::GetDumpFormat()
 {
     string time = TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS);
     string symbol1 = m_symbol1.Name();
     string symbol2 = m_symbol2.Name();
     string symbol3 = m_symbol3.Name();
     string bid1 = DoubleToString(m_symbol1.Bid());
     string ask1 = DoubleToString(m_symbol1.Ask());
     string bid2 = DoubleToString(m_symbol2.Bid());
     string ask2 = DoubleToString(m_symbol2.Ask());
     string bid3 = DoubleToString(m_symbol3.Bid());
     string ask3 = DoubleToString(m_symbol3.Ask());
     string arbitrage1 = DoubleToString(this.ForwardArbitrageValue());
     string arbitrage2 = DoubleToString(this.BackwardArbitrageValue());
     
     string text = StringFormat("%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s", 
      time, symbol1, symbol2, symbol3, bid1, ask1, bid2, ask2, bid3, ask3, arbitrage1, arbitrage2);
      
     return text;
 }