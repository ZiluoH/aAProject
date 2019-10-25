# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
   def span
        return nil if self.empty?
        self.max - self.min
   end

   def average
        return nil if self.empty?
        self.sum / (self.length * 1.0)
   end

   def median
        
        return nil if self.empty?
        sorted = self.sort
        middle = sorted.length / 2
        if sorted.length.odd? 
            return sorted[middle]
        else
            return (sorted[middle - 1] + sorted[middle]) / 2.0
        end
   end

   def counts
        count = Hash.new(0)
        self.each {|ele| count[ele] += 1}
        return count
   end

   #---------------------------------------------

   def my_count (num)
        count = 0
        self.each { |ele| count += 1 if ele == num}
        return count
    end

    def my_index(num)
        self.each_with_index { |ele, idx| return idx if ele == num}
        return nil if !self.include?(num)
    end

    def my_uniq
        arr = []
        self.each { |ele| arr << ele if !arr.include?(ele)}
        return arr
    end

    def my_transpose
        l = self.length
        w = self[0].length
        arr = Array.new(l) {Array.new(w)}
        (0...l).each do |i|
            (0...w).each do |j|
                arr[j][i] = self[i][j]
            end
        end
        return arr
    end

end
