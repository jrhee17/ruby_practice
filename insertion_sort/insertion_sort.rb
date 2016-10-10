arr = [31, 41, 59, 26, 41, 58]

def insertion_sort(arr)
    arr.each_index do |ind1|
        (ind1...arr.length).to_a.each do |ind2|
            if arr[ind1] > arr[ind2]
                arr[ind1], arr[ind2] = arr[ind2], arr[ind1]
            end
        end 
    end
    return arr
end

p insertion_sort(arr)
