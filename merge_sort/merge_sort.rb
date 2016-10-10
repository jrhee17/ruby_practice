
arr = [1,2,2,3,1,2,3,6]

def merge(arr, ind1, mid, ind2)
    subarr1 = arr[ind1...mid].dup + [Float::INFINITY]
    subarr2 = arr[mid...ind2].dup + [Float::INFINITY]

    subind1 = 0
    subind2 = 0
    for ind in ind1...ind2
       if subarr1[subind1] < subarr2[subind2] then
           arr[ind] = subarr1[subind1]
           subind1 += 1
       else
           arr[ind] = subarr2[subind2]
           subind2 += 1
       end
    end
end

def merge_sort(arr, ind1, ind2)
    mid = (ind1 + ind2) / 2
    if(ind1 < mid && mid < ind2)
        merge_sort(arr, ind1, mid)
        merge_sort(arr, mid, ind2)
        merge(arr, ind1, mid, ind2)
    end
end

merge_sort(arr, 0, arr.length)

p arr
