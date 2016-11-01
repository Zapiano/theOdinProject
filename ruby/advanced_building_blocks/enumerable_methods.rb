module Enumerable
  def my_each
    i = 0

    while i < self.size
      yield(self.to_a[i])
      i+=1
    end

    self
  end

  def my_each_with_index
    i = 0

    while i < self.size
      yield(self.to_a[i], i)
      i+=1
    end

    self
  end

  def my_select
    array = []

    self.my_each_with_index do |element|
      if yield(element)
        array << element
      end
    end

    array
  end

  def my_all?
    self.my_each do |element|
      if block_given?
        if !yield(element) || yield(element).nil?
          return false
        end
      else
        if !element || element.nil?
          return false
        end
      end
    end

    return true
  end

  def my_any?
    self.my_each do |element|
      if block_given?
        if yield(element) && !yield(element).nil?
          return true
        end
      else
        if element && !element.nil?
          return true
        end
      end
    end

    false
  end

  def my_none?
    self.my_each do |element|
      if block_given?
        if yield(element)
          return false
        end
      else
        if element
          return false
        end
      end
    end

    true
  end

  def my_count
    count = 0

    self.my_each do |element|
      if block_given?
        if yield(element)
          count += 1
        end
      else
        count += 1
      end
    end

    count
  end

  def my_map my_proc
    array = []

    self.my_each do |element|
      if block_given?
        array << yield(element)
      else
        array << my_proc.call(element)
      end
    end

    array
  end

  def my_inject
    memo = self.to_a[0]
    i = 1

    while i < self.size
      memo = yield(memo, self.to_a[i])
      i += 1
    end

    memo
  end

  def multiply_els
    self.my_inject {|memo, actual| memo * actual}
  end
end
