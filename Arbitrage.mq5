#include "ArbitrageCalculator.mqh"
#include "Writer.mqh";
#include "Symbols\SymbolInfo.mqh";
#include "Symbols\SymbolTriangle.mqh";
#include "Utility\SymbolList.mqh";
#include "Form\FormHelper.mqh";
#include "Reader\Reader.mqh";
input uint InputWait = 20;
input bool InputSendOrder = false;
Writer writer;
SymbolList list;
static int size;

void OnInit()
{
   //c# form dll is called and form is opened by this command
  FormHelperOpenForm();

  // ReadSymbols();
  //Symbols Array to look for the arbitrage opportunuties
  size = ArraySize(AllSymbols) / 3;
  
  //logs file is opened to write
  writer.OpenFile();
  
  Sleep(2000);
  //for timer event input provided
  EventSetMillisecondTimer(InputWait);
}

void OnTimer()
{  
  for (int i = 0; i < size; i++)
    {
      
      //give index of symbols to symbol triangle to calculate given arbitrage
      SymbolTriangle symbols(i);
      //if arbitrage value above -1 then control send order input to send order add to initial list for form
      if (symbols.ForwardArbitrageValue() > -1)
      {
        if (InputSendOrder)
          symbols.MakeForwardArbitrage();
        
        list.Add(symbols);
      }
      if (symbols.BackwardArbitrageValue() > -1)
      {
        if (InputSendOrder)
          symbols.MakeBackwardArbitrage();
        
        list.Add(symbols);
      }
    }
    //bind list to form via dll
    list.BindToForm();
    
    //write list to log.csv file 
    writer.Dump(list.GetDumpString());
    //after binding clear list
    
    list.Clear();
}

void OnDeinit(const int reason)
{
   //close form
  FormHelperCloseForm();
   //kill timer event
  EventKillTimer();
  //close file which is written
  
  writer.CloseFile();
}


