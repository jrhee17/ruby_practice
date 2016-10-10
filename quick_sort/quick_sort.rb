def partition(arr, ind1, ind2)
    mid = ind1 - 1
    pivot = arr[ind2-1]
    for i in ind1...(ind2-1)
        # If value is smaller than pivot, increment both left and right then swap
        if arr[i] < pivot then
            mid += 1
            arr[i], arr[mid] = arr[mid], arr[i]
        end
        # Otherwise, increment only right and
    end
    # swap pivot with midpoint
    arr[mid+1], arr[ind2-1] = arr[ind2-1], arr[mid+1]
    return mid+1
end

def quick_sort(arr, ind1, ind2)
    if ind1 < ind2 - 1 then
        mid = partition(arr, ind1, ind2)
        quick_sort(arr, ind1, mid)
        quick_sort(arr, mid+1, ind2)
    end
end

input = [13,19,9,5,12,8,7,4,21,2,6,11]
quick_sort(input, 0, input.length)
p input
