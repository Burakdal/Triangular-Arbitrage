
#include "..\Symbols\SymbolTriangle.mqh"

/*
 class for data which will be binded to form binding list.
 
*/
class SymbolList
{
  private:
    SymbolTriangle data[];
    int capacity;
    int size;
    void EnsureCapacity(int newCapacity);
  public:
    SymbolList() : size(0), capacity(12) { ArrayResize(data, capacity); }
    SymbolList(int initialCapacity) : size(0), capacity(initialCapacity) { ArrayResize(data, capacity); }
    void Add(SymbolTriangle& symbols);
    void Clear();
    void BindToForm();
    string GetDumpString();
};
/*
"
*/
void SymbolList::EnsureCapacity(int newCapacity)
 {
   if (newCapacity < capacity) return;
   
   capacity *= 2;
   
   ArrayResize(data, capacity);
 }

void SymbolList::Add(SymbolTriangle& symbols)
 {
   this.EnsureCapacity(size + 1);
   
   data[size++] = symbols;
 }
    
void SymbolList::Clear()
 {
   size = 0;
 }
 
void SymbolList::BindToForm()
 {
   for (int i = 0; i < size; i++)
   {
     data[i].SendJsonToForm();
   }
   
   FormHelperBindAll();
 }
 
string SymbolList::GetDumpString()
 {
   string result = "";
   
   for (int i = 0; i < size; i++)
   {
     result += data[i].GetDumpFormat() + "\n";
   }
   
   return result;
 }