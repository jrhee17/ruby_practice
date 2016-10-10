arr = [31, 41, 59, 26, 41, 58]

def insertion_sort(arr)
    (1...arr.length).each do |ind1|
        (ind1...arr.length).to_a.reverse.each do |ind2|
            if arr[ind2-1] > arr[ind2]
                arr[ind2-1], arr[ind2] = arr[ind2], arr[ind2-1]
            end
        end 
    end
    return arr
end

p insertion_sort(arr)

