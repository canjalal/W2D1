# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.empty?

        self.max - self.min
    end

    def average
        return nil if self.empty?

        self.sum/self.size.to_f

    end

    def median
        return nil if self.empty?
        leftmiddlei = ((self.size-1)/2.0).floor
        rightmiddlei = ((self.size-1)/2.0).ceil
        sortedarray = self.sort
        (sortedarray[leftmiddlei] + sortedarray[rightmiddlei])/2.0

    end

    def counts
        self.tally
    end

    def my_count(val)
        counts[val] || 0
    end

    def my_index(val)
        return nil if my_count(val) == 0

        self.each.with_index do |ele, i|
            return i if val == ele
        end

    end

    def my_uniq
        counts.keys
    end

    def my_transpose
        outputarr = Array.new(self.size) {Array.new(self.size) }
        (0...self.size).each.with_index do |subarr, i|
            (0...self.size).each.with_index do |ele, j|
                outputarr[i][j] = self[j][i]
            end
        end

        outputarr
        
    end
  
end
