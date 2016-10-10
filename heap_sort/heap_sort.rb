arr = [4, 1, 3, 2, 16, 9, 10, 14, 8, 7]

def build_max_heap(arr)
    for i in (1...arr.length).to_a.reverse
        heapify(arr, i, arr.length)
    end
end

def heapify(arr, ind, size)
    if ind <= 0
        return
    end

    # Bottom up approach
    # Left, Right
    l = ind << 1
    r = (ind << 1) + 1

    # Check if current is smallest and if not, switch
    largest = ind
    if l < size && arr[l] > arr[largest] then
        largest = l
    end

    if r < size && arr[r] > arr[largest] then
        largest = r
    end

    # Recursively call heapify if child is smaller and call on child
    if largest != ind
        arr[ind], arr[largest] = arr[largest], arr[ind]
        heapify(arr, largest, size)
    end

    print 'i: ', ind, ' l: ', l, ' r: ', r, "\n"
end

def heap_sort(arr)
    # Append first value
    arr = [nil] + arr
    
    # Build min-heap
    build_max_heap(arr)

    p arr
    for ind in (1...arr.length).to_a.reverse
        # Swap values
        arr[1], arr[ind] = arr[ind], arr[1]
        p arr
        
        # Apply heapify to index greater than ind
        heapify(arr, 1, ind)
    end

    return arr
end

p heap_sort(arr)
