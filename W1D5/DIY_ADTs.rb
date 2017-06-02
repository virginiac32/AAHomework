class Stack
  def initialize(array)
    @array = array
  end

  attr_reader :array

  def add(el)
    array.push(el)
  end

  def remove
    array.pop
    return array
  end

  def show
    print array
  end
end

class Queue
  def initialize(array)
    @array = array
  end

  attr_reader :array

  def enqueue(el)
    array.unshift(el)
  end

  def dequeue
    array.pop
    return array
  end

  def show
    print array
  end
end

class Map
  def initialize(array)
    @array = array
  end
  attr_reader :array

  def assign(key,value)
    @array.each do |pair|
      if pair[0] == key
        return pair[1] = value
      end
    end
    @array << [key,value]
  end

  def lookup(key)
    @array.each do |pair|
      if pair[0] == key
        return pair[1]
      end
    end
    return nil
  end

  def remove(key)
    @array.each_with_index do |pair,idx|
      if pair[0] == key
        @array.delete_at(idx)
      end
    end
  end

  def show
    print @array
  end
end
