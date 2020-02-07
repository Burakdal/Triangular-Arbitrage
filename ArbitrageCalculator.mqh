
/*

#include "SymbolHelper.mqh"
#include "Symbols\SymbolTriangle.mqh"
#include "Symbols\AllSymbols.mqh"
#include "Symbols\SymbolInfo.mqh"

double get_forward_arbitrage(SymbolTriangle& triangle)
{
  return get_forward_value(triangle.symbol1) * 
         get_forward_value(triangle.symbol2) * 
         get_forward_value(triangle.symbol3) - 1;
}

double get_backward_arbitrage(SymbolTriangle& triangle)
{
  return get_backward_value(triangle.symbol1) * 
         get_backward_value(triangle.symbol2) * 
         get_backward_value(triangle.symbol3) - 1;
}

double get_forward_value(SymbolInfo& symbol)
{
  if (exists(symbol.name))
    return get_bid(symbol.name);
  else if (exists(get_reverse(symbol.name)))
    return 1 / get_ask(symbol.name);
  else
    return 0;
}

double get_backward_value(SymbolInfo& symbol)
{
  if (exists(symbol.name))
    return 1 / get_ask(symbol.name);
  else if (exists(get_reverse(symbol.name)))
    return get_bid(symbol.name);
  else
    return 0;
}
*/