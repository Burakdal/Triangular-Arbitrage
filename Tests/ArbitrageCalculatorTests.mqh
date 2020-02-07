
#include "..\Symbols.mqh";
#include "..\SymbolHelper.mqh";
#include "..\ArbitrageCalculator.mqh";

void test_arbitrage_calculator()
{
  test_forward_value1();
  test_forward_value2();
  test_forward_value3();
  test_backward_value1();
  test_backward_value2();
  test_backward_value3();
  test_forward_arbitrage();
  test_backward_arbitrage();
}

void test_backward_arbitrage()
{
  SymbolTriangle symbols = {0};
  
  symbols.symbol1 = create_symbol("EURUSD");
  symbols.symbol2 = create_symbol("USDGBP");
  symbols.symbol3 = create_symbol("EURGBP");
  
  double should_get = get_backward_value(symbols.symbol1)
               * get_backward_value(symbols.symbol2)
               * get_backward_value(symbols.symbol3) - 1;
  
  symbols.backward_arbitrage = get_backward_arbitrage(symbols);
  
  string out;
  
  if (should_get == symbols.backward_arbitrage)
    out = "PASS";
  else
    out = "FAIL";
    
  PrintFormat("ArbitrageCalculator::get_backward_arbitrage : %s", out);
}

void test_forward_arbitrage()
{
  SymbolTriangle symbols = {0};
  
  symbols.symbol1 = create_symbol("EURUSD");
  symbols.symbol2 = create_symbol("USDGBP");
  symbols.symbol3 = create_symbol("EURGBP");
  
  double should_get = get_forward_value(symbols.symbol1)
               * get_forward_value(symbols.symbol2)
               * get_forward_value(symbols.symbol3) - 1;
  
  symbols.forward_arbitrage = get_forward_arbitrage(symbols);
  
  string out;
  
  if (should_get == symbols.forward_arbitrage)
    out = "PASS";
  else
    out = "FAIL";
    
  PrintFormat("ArbitrageCalculator::get_backward_arbitrage : %s", out);
}

void test_forward_value1()
{
  string symbol = "EURUSD";
  
  SymbolInfo symbolInfo = create_symbol(symbol);
  
  double bid = get_bid(symbol);
  
  double forward = get_forward_value(symbolInfo);
  
  string out;
  
  if (forward == bid)
    out = "PASS";
  else
    out = "FAIL";
    
  PrintFormat("ArbitrageCalculator::get_forward_value : %s", out);
}

void test_forward_value2()
{
  string symbol = "USDEUR";
  
  SymbolInfo symbolInfo = create_symbol(symbol);
  
  double ask = get_ask(symbol);
  
  double forward = get_forward_value(symbolInfo);
  
  string out;
  
  if (forward == 1 / ask)
    out = "PASS";
  else
    out = "FAIL";
    
  PrintFormat("ArbitrageCalculator::get_forward_value : %s", out);
}

void test_forward_value3()
{
  string symbol = "ABCDEF";
  
  SymbolInfo symbolInfo = create_symbol(symbol);
  
  double forward = get_forward_value(symbolInfo);
  
  string out;
  
  if (forward == 0)
    out = "PASS";
  else
    out = "FAIL";
    
  PrintFormat("ArbitrageCalculator::get_forward_value : %s", out);
}

void test_backward_value1()
{
  string symbol = "GBPUSD";
  
  SymbolInfo symbolInfo = create_symbol(symbol);
  
  double ask = get_ask(symbol);
  
  double backward = get_backward_value(symbolInfo);
  
  string out;
  
  if (backward == 1 / ask)
    out = "PASS";
  else
    out = "FAIL";
    
  PrintFormat("ArbitrageCalculator::get_forward_value : %s", out);
}

void test_backward_value2()
{
  string symbol = "USDGBP";
  
  SymbolInfo symbolInfo = create_symbol(symbol);
  
  double bid = get_bid(symbol);
  
  double backward = get_backward_value(symbolInfo);
  
  string out;
  
  if (backward == bid)
    out = "PASS";
  else
    out = "FAIL";
    
  PrintFormat("ArbitrageCalculator::get_forward_value : %s", out);
}

void test_backward_value3()
{
  string symbol = "GGGPPP";
  
  SymbolInfo symbolInfo = create_symbol(symbol);
  
  double backward = get_backward_value(symbolInfo);
  
  string out;
  
  if (backward == 0)
    out = "PASS";
  else
    out = "FAIL";
    
  PrintFormat("ArbitrageCalculator::get_forward_value : %s", out);
}