
#include "..\Symbols\AllSymbols.mqh"

void ReadSymbols()
{
  int handle = FileOpen("Symbols.txt", FILE_TXT|FILE_ANSI|FILE_READ);
  
  int i = 0;
  
  while (!FileIsEnding(handle))
  {
    string result = FileReadString(handle);
    string temp[];
    
    // ArrayResize(AllSymbols, i + 1);
    
    StringSplit(result, ',', temp);
    AllSymbols[i][0] = temp[0];
    AllSymbols[i][1] = temp[1];
    AllSymbols[i][2] = temp[2];
    
    i++;
  }
}