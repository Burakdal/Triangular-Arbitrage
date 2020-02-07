
#include "Json.mqh"

class MyClass
{
  private:
    string m_str;
    int m_int;
    bool m_bool;
    
  public:
    MyClass() : m_str(""),
                m_int(0),
                m_bool(false)
    {
      
    }
    
    string Serialize()
    {
      CJAVal js(NULL, jtUNDEF);
      
      js["m_str"] = m_str;
      js["m_int"] = m_int;
      js["m_bool"] = m_bool;
      
      string out = "";
      
      js.Serialize(out);
      
      return out;
    }
};

void OnInit()
{
  
}