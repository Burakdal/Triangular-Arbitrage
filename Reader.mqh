
#include "Symbols.mqh"

const string symbols_path = "Symbols.txt";

static string file_content;

void ReadSymbols()
{
   ResetLastError();
   
   int file_handle = FileOpen(symbols_path, FILE_READ|FILE_TXT|FILE_ANSI);
   
   if(file_handle!=INVALID_HANDLE)
     {
      int str_size;
      string str;
      
      while(!FileIsEnding(file_handle))
        {
         str_size = FileReadInteger(file_handle,INT_VALUE);
         
         str = FileReadString(file_handle,str_size);
        }
        
      ParseSymbols(str);
      
      FileClose(file_handle);
      
      PrintFormat("Symbols are read, %s file is closed", symbols_path);
     }
   else
      PrintFormat("Failed to open %s file, Error code = %d", symbols_path, GetLastError());
}

void ParseSymbols(string symbols_str)
{
  const ushort sep = '\n';
  
  Print(sep);
  
  
  /*string result[1024];
  
  
  
  for (int i = 0; i < 30; i++)
  {
    Print(result[i]);
  }*/
}