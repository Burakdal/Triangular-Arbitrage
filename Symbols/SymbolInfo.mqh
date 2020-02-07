
#include "..\SymbolHelper.mqh";

#define AskOf(symbol) (SymbolInfoDouble((symbol), SYMBOL_ASK))
#define BidOf(symbol) (SymbolInfoDouble((symbol), SYMBOL_BID))

static bool ms_is_custom = false;
/*

   Symbol info class to get the current info of particular symbols.
*/
class SymbolInfo
{
  private:
    string m_name;
    string m_reverse;
    bool m_exists;
    bool m_reverseExists;
    double m_bid;
    double m_ask;
    int m_digits;
    
    double getPrice(ENUM_SYMBOL_INFO_DOUBLE info)
    {
      double price;
    
      if (this.m_exists)
        price = SymbolInfoDouble(this.m_name, info);
      else
        price = SymbolInfoDouble(this.m_reverse, info);
        
      return NormalizeDouble(price, this.m_digits);
    }
    
    int getDigits()
    {
      if (this.m_exists)
        return (int) SymbolInfoInteger(this.m_name, SYMBOL_DIGITS);
      else
        return (int) SymbolInfoInteger(this.m_reverse, SYMBOL_DIGITS);
    }
    
    string getReverse(string symbol)
    {
      return StringSubstr(symbol, 3, 3) + StringSubstr(symbol, 0, 3);
    }
    
    bool exists(string symbol)
    {
      return SymbolExist(symbol, ms_is_custom);
    }
    
  public:
    SymbolInfo(string symbol)
    {
      this.m_name = symbol;
      this.m_reverse = getReverse(symbol);
      this.m_exists = exists(symbol);
      this.m_reverseExists = exists(this.m_reverse);
      this.m_digits = getDigits();
      this.m_bid = getPrice(SYMBOL_BID);
      this.m_ask = getPrice(SYMBOL_ASK);
    }
    
    double BackwardMultiplier()
    {
      if (this.m_exists)
      {
        double toReturn = this.m_ask == 0 ? 0 : 1 / this.m_ask;
        
        return toReturn;
      }
      else if (this.m_reverseExists)
        return this.m_bid;
      else
        return 0;
    }
    
    double ForwardMultiplier()
    {
      if (this.m_exists)
        return this.m_bid;
      else if (this.m_reverseExists)
      {
        double toReturn = this.m_ask == 0 ? 0 : 1 / this.m_ask;
        
        return toReturn;
      }
      else
        return 0;
    }
    
    const string Name() { return this.m_name; }
    const string Reverse() { return this.m_reverse; }
    const bool Exists() { return this.m_exists; }
    const double Ask() { return this.m_ask; }
    const double Bid() { return this.m_bid; }
};
