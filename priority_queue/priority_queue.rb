class PriorityQueue
    attr_accessor :arr

    def initialize(arr)
        @arr = arr
        build_max_heap()
    end

    def self.heapify(arr, i, size)

        l = (i << 1)
        r = (i << 1) + 1
        print 'i: ', i, ' l: ', l, 'r: ', r, "\n"
        
        largest = i;
        if l < size && arr[l] > arr[largest] then
            largest = l
        end

        if r < size && arr[r] > arr[largest] then
            largest = r
        end

        if i != largest then
            print 'Before: ', arr, "\n"
            arr[i], arr[largest] = arr[largest], arr[i]
            print 'After: ', arr, "\n"
            self.heapify(arr, largest, size)
        end

    end

    def build_max_heap()
        @arr = [nil] + @arr
        for i in (1...@arr.length).to_a.reverse
            self.class.heapify(@arr, i, @arr.length)
        end
    end

    def maximum
        return arr[1]
    end

    def extract_max
        maxval = @arr.delete_at(1)
        self.class.heapify(@arr, 1, @arr.length)
        maxval
    end

    def insert(val)
        @arr = @arr + [val]
        ind = @arr.length - 1
        while (ind >> 1) > 0
            break if @arr[ind >> 1] > arr[ind]
            arr[ind >> 1], arr[ind] = arr[ind], arr[ind >> 1]
            ind = ind >> 1
        end
        self.class.heapify(@arr, @arr.length-1, @arr.length)
    end

end

arr = [4, 1, 3, 2, 16, 9, 10, 14, 8, 7]
pq = PriorityQueue.new(arr)
p pq.arr
raise 'maximum not working as expected' unless pq.maximum == arr.max
raise 'heap not working as expected' unless pq.arr == [nil, 16, 14, 10, 8, 7, 9, 3, 2, 4, 1]
raise 'extract_max not working as expected' unless pq.extract_max == 16
pq.insert(100)
raise 'insert not working' unless pq.arr[1] == 100
