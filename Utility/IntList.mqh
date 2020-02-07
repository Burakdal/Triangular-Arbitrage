
class IntList
{
  private:
    int data[];
    int size;
    
    void ensureCapacity(int capacity)
    {
      int dataSize = ArraySize(data);
      
      if (capacity <= dataSize)
        return;
        
      int newCapacity = newCapacity(capacity, dataSize);
      
      ArrayResize(data, newCapacity);
    }
    
    int newCapacity(int capacity, int currentSize)
    {
      if (capacity < currentSize * 2)
        return currentSize * 2;
        
      return capacity;
    }
    
  public:
  
    void List()
    {
      size = 0;
      ArrayResize(data, 12);
    }
    
    int Size() { return size; }
    
    int Capacity() { return ArraySize(data); }
    
    void PrintList()
    {
      for (int i = 0; i < size; i++)
      {
        PrintFormat("List[%d]: %d", i, data[i]);
      }
    }
  
    void Add(int number)
    {
      this.ensureCapacity(size + 1);
      
      this.data[size] = number;
      
      size++;
    }
    
    void Clear()
    {
      size = 0;
      ArrayFree(data);
    }
    
    void RemoveAt(int index)
    {
      if (index >= size) return;
    
      for (int i = index; i < size - 1; i++)
      {
        data[i] = data[i + 1];
      }
      
      size--;
    }
    
    void Remove(int number)
    {
      int index = IndexOf(number);
      
      if (index == -1) return;
      
      RemoveAt(index);
    }
    
    bool Contains(int number)
    {
      return IndexOf(number) > -1;
    }
    
    int IndexOf(int number)
    {
      for (int i = 0; i < size; i++)
      {
        if (data[i] == number)
          return i;
      }
      
      return -1;
    }
};

