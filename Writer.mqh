
#include "Symbols\SymbolInfo.mqh";
#include "Symbols\SymbolTriangle.mqh";


/*
   writer class to open log file then get the opportunity information and then write it to csv file.
*/
class Writer
{
  private:
    int m_handle;
    
    void Append(const string text)
    {
       FileSeek(m_handle, 0, SEEK_END);
  
       uint bytes = FileWrite(m_handle, text);
    }
    
    string GetFileName()
    {
      string name = TimeToString(TimeCurrent(),TIME_DATE|TIME_MINUTES);
      
      StringReplace(name, ":", ".");
      
      return "Logs " + name + ".csv";
    }
      
  public:
    void OpenFile()
    {
      ResetLastError();
    
      m_handle = FileOpen(GetFileName(), FILE_WRITE|FILE_CSV);
  
      if (m_handle == INVALID_HANDLE)
      {
        Print("File could not be opened. Error: %d", GetLastError());
    
        return;
      }
    
      const string headers = "Date,Symbol1,Symbol2,Symbol3,Bid1,Ask1,Bid2,Ask2,Bid3,Ask3,Arbitrage1,Arbitrage2";
  
      Append(headers);
    }
    
    void CloseFile()
    {
      FileClose(m_handle);
    }
    
    void Dump(string text)
    {
      Append(text);
    }
    
    void Dump(SymbolTriangle& symbols)
    {
      string text = symbols.GetDumpFormat();
         
      Append(text);
    }
};

