# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.length == 0
    self.sort[-1] - self.sort[0]
  end

  def average
    return nil if self.length == 0
    self.sum / (self.length * 1.0)
  end

  def median
    return nil if self.length == 0
    sorted = self.sort 
    mid = sorted.length / 2
    if sorted.length % 2 == 0
        (sorted[mid] + sorted[mid-1]) / 2.0
    else
        sorted[mid]
    end
  end

  def counts
    count = Hash.new(0)
    self.each {|ele| count[ele] += 1}
    count
  end

  def my_count(val)
    count = 0
    self.each {|ele| count += 1 if val == ele}
    count 
  end

  def my_index(val)
    self.each_with_index {|ele, i| return i if val == ele}
    return nil
  end

  def my_uniq
    arr = []
    self.each {|ele| arr << ele if !arr.include?(ele)}
    arr
  end

  def my_transpose
    arr = Array.new(self.length) {[]}
    (0...arr.length).each do |i|
        (0...arr.length).each do |j|
            arr[i] << self[j][i]
        end
    end
    arr
  end
end
