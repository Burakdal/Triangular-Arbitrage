
#include "..\SymbolHelper.mqh";

void test_symbol_helper()
{
  test_exists();
  test_does_not_exist();
  
  reverse_test();
  test_reverse_exists();
  
  get_normal_bid_test();
  get_reverse_bid_test();
  get_does_not_exist_bid_test();
  
  get_normal_ask_test();
  get_reverse_ask_test();
  get_does_not_exist_ask_test();
  
  get_symbol_info_normal_ask_test();
  get_symbol_info_reverse_ask_test();
  get_symbol_info_does_not_exist_ask_test();
  
  get_normal_bid_symbol_info_test();
  get_reverse_bid_symbol_info_test();
  get_does_not_exist_bid_symbol_info_test();
  
  create_symbol_test();
}

void test_exists()
{
  string symbols[] = {"NZDCAD",
                       "NZDCHF",
                       "NZDSGD",
                       "EURPLN",
                       "AUDCAD"};
  
  string result = "PASS";
  
  for (int i = 0; i < ArraySize(symbols); i++)
  {
    if (!exists(symbols[i]))
      result = "FAIL";
  }
  
  PrintFormat("SymbolHelper::exists : %s", result);
}

void test_reverse_exists()
{
  string symbols[] = {"HKDUSD", "SEKUSD", "DKKUSD", "CHFUSD", "MXNUSD"};
  
  string result = "PASS";
  
  for (int i = 0; i < ArraySize(symbols); i++)
  {
    if (!exists(get_reverse(symbols[i])))
      result = "FAIL";
  }
  
  PrintFormat("SymbolHelper::exists : %s", result);
}

void test_does_not_exist()
{
  string symbols[] = {"MMMNNN", "LLLKKK", "OOOPPP", "YYYUUU", "XXXVVV"};
  
  string result = "PASS";
  
  for (int i = 0; i < ArraySize(symbols); i++)
  {
    if (exists(symbols[i]))
      result = "FAIL";
  }
  
  PrintFormat("SymbolHelper::exists : %s", result);
}

// ----- SYMBOL INFO - GET BID ----------

void get_normal_bid_symbol_info_test()
{
  SymbolInfo info = create_symbol("USDCNH");
  
  double bid = get_bid(info);
  
  double real_bid = SymbolInfoDouble("USDCNH", SYMBOL_BID);
  
  string result;
  
  if (bid == real_bid)
    result = "PASS";
  else
    result = "FAIL";
    
  PrintFormat("SymbolHelper::get_bid(SymbolInfo) : %s", result);
}

void get_reverse_bid_symbol_info_test()
{
  SymbolInfo info = create_symbol("HKDUSD");
  
  double bid = get_bid(info);
  
  double real_bid = SymbolInfoDouble("USDHKD", SYMBOL_BID);
  
  string result;
  
  if (bid == real_bid)
    result = "PASS";
  else
    result = "FAIL";
    
  PrintFormat("SymbolHelper::get_bid(SymbolInfo) : %s", result);
}

void get_does_not_exist_bid_symbol_info_test()
{
  SymbolInfo info = create_symbol("KKKMMM");
  
  double bid = get_bid(info);
  
  string result;
  
  if (bid == -1)
    result = "PASS";
  else
    result = "FAIL";
    
  PrintFormat("SymbolHelper::get_bid(SymbolInfo) : %s", result);
}

// END - SYMBOLINFO GET BID TESTS


// GET BID SYMBOL TESTS

void get_normal_bid_test()
{
  string symbol = "USDCNH";
  
  double bid = get_bid(symbol);
  
  double real_bid = SymbolInfoDouble("USDCNH", SYMBOL_BID);
  
  string result;
  
  if (bid == real_bid)
    result = "PASS";
  else
    result = "FAIL";
    
  PrintFormat("SymbolHelper::get_bid : %s", result);
}

void get_reverse_bid_test()
{
  string symbol = "HKDUSD";
  
  double bid = get_bid(symbol);
  
  double real_bid = SymbolInfoDouble("USDHKD", SYMBOL_BID);
  
  string result;
  
  if (bid == real_bid)
    result = "PASS";
  else
    result = "FAIL";
    
  PrintFormat("SymbolHelper::get_bid : %s", result);
}

void get_does_not_exist_bid_test()
{
  string symbol = "KKKMMM";
  
  double bid = get_bid(symbol);
  
  string result;
  
  if (bid == -1)
    result = "PASS";
  else
    result = "FAIL";
    
  PrintFormat("SymbolHelper::get_bid : %s", result);
}
// ---- END BIDS ----

// ---- START BIDS SYMBOL INFO ----
void get_symbol_info_normal_ask_test()
{
  SymbolInfo symbol = create_symbol("USDJPY");
  
  double ask = get_ask(symbol);
  
  double real_ask = SymbolInfoDouble("USDJPY", SYMBOL_ASK);
  
  string result;
  
  if (ask == real_ask)
    result = "PASS";
  else
    result = "FAIL";
    
  PrintFormat("SymbolHelper::get_ask(SymbolInfo) : %s", result);
}

void get_symbol_info_reverse_ask_test()
{
  SymbolInfo symbol = create_symbol("TRYUSD");
  
  double ask = get_ask(symbol);
  
  double real_ask = SymbolInfoDouble("USDTRY", SYMBOL_ASK);
  
  string result;
  
  if (ask == real_ask)
    result = "PASS";
  else
    result = "FAIL";
    
  PrintFormat("SymbolHelper::get_ask(SymbolInfo) : %s", result);
}

void get_symbol_info_does_not_exist_ask_test()
{
  SymbolInfo symbol = create_symbol("TTTYYY");
  
  double ask = get_ask(symbol);
  
  string result;
  
  if (ask == -1)
    result = "PASS";
  else
    result = "FAIL";
    
  PrintFormat("SymbolHelper::get_ask(SymbolInfo) : %s", result);
}
// ---- END BIDS SYMBOL INFO ----

// ---- START ASKS ----
void get_normal_ask_test()
{
  string symbol = "USDJPY";
  
  double ask = get_ask(symbol);
  
  double real_ask = SymbolInfoDouble("USDJPY", SYMBOL_ASK);
  
  string result;
  
  if (ask == real_ask)
    result = "PASS";
  else
    result = "FAIL";
    
  PrintFormat("SymbolHelper::get_ask : %s", result);
}

void get_reverse_ask_test()
{
  string symbol = "TRYUSD";
  
  double ask = get_ask(symbol);
  
  double real_ask = SymbolInfoDouble("USDTRY", SYMBOL_ASK);
  
  string result;
  
  if (ask == real_ask)
    result = "PASS";
  else
    result = "FAIL";
    
  PrintFormat("SymbolHelper::get_ask : %s", result);
}

void get_does_not_exist_ask_test()
{
  string symbol = "TTTYYY";
  
  double ask = get_ask(symbol);
  
  string result;
  
  if (ask == -1)
    result = "PASS";
  else
    result = "FAIL";
    
  PrintFormat("SymbolHelper::get_ask : %s", result);
}
// END ASKS

void reverse_test()
{
  string symbols[] = {"XAGUSD", "XAUUSD", "USDGEL", "SGDJPY", "NZDSGD", "NZDJPY", 
  "NZDCHF", "NZDCAD", "GBPZAR", "GBPSGD", "GBPSEK", "GBPPLN", "GBPNZD", "GBPNOK", 
  "GBPCAD", "GBPJPY", "GBPCHF", "GBPAUD", "EURZAR", "EURTRY", "EURSEK", "EURRUB", 
  "EURRUR", "EURPLN", "EURNZD"};

  string reverse_symbols[] = {"USDXAG", "USDXAU", "GELUSD", "JPYSGD", "SGDNZD", "JPYNZD", 
  "CHFNZD", "CADNZD", "ZARGBP", "SGDGBP", "SEKGBP", "PLNGBP", "NZDGBP", "NOKGBP", 
  "CADGBP", "JPYGBP", "CHFGBP", "AUDGBP", "ZAREUR", "TRYEUR", "SEKEUR", "RUBEUR", 
  "RUREUR", "PLNEUR", "NZDEUR"};
  
  string result = "PASS";
  
  for (int i = 0; i < ArraySize(symbols); i++)
  {
    if (get_reverse(symbols[i]) != reverse_symbols[i])
      result = "FAIL";
  }
  
  PrintFormat("SymbolHelper::get_reverse : %s", result);
}

void create_symbol_test()
{
  string symbol = "USDTRY";
  
  SymbolInfo info = create_symbol(symbol);
  
  string result = "PASS";
  
  if (info.name != "USDTRY" || info.ask != get_ask("USDTRY") ||
      info.bid != get_bid("USDTRY") || info.reverse != "TRYUSD")
      {
        result = "FAIL";
      }
      
  PrintFormat("SymbolHelper::create_symbol_test : %s", result);
}