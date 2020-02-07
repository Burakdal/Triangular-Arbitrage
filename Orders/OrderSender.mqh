
#include <Trade\Trade.mqh>
#include "..\Symbols\SymbolInfo.mqh"
/*
   Order sender class to send order via CTrade includes forward and backward order.
*/
class OrderSender
{
  private:
    CTrade m_trade;
  public:
    double SendForward(SymbolInfo& symbol, double lot);
    double SendBackward(SymbolInfo& symbol, double lot);
};

double OrderSender::SendForward(SymbolInfo &symbol,double lot)
{
   if (symbol.Exists())
     {
       m_trade.Buy(lot, symbol.Name());
       
       double price = m_trade.ResultPrice();
       
       return lot * price;
     }
     else
     {
       m_trade.Sell(lot, symbol.Reverse());
       
       double price = m_trade.ResultPrice();
       
       return price == 0 ? 0 : lot / price;
     }
}

double OrderSender::SendBackward(SymbolInfo &symbol,double lot)
{
     if (symbol.Exists())
     {
       m_trade.Sell(lot, symbol.Name());
       
       double price = m_trade.ResultPrice();
       
       return price == 0 ? 0 : lot / price;
     }
     else
     {
       m_trade.Buy(lot, symbol.Reverse());
       
       double price = m_trade.ResultPrice();
       
       return lot * price;
     }
}