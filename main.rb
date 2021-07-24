def make_change(amt, arr = [25, 10, 5, 1])
    change = []
    return [amt] if amt == 1
    return change if amt < 1
    i = 0
    j = 0
    hash = nil
    while j < arr.length
        if amt >= arr[j] && arr[j] != 1
            if hash == nil
                hash = {amt % arr[j] => arr[j]}
            elsif amt % arr[j] == 0 && (amt / arr[j] - amt / hash.values[0]).abs < 2
                hash = {amt % arr[j] => arr[j]}
            elsif amt / arr[j] <  amt / hash.values[0]
                hash = {amt % arr[j] => arr[j]}
            end
        end
        j += 1
    end

    if hash != nil
        change << hash.values[0]
        change += make_change(amt - hash.values[0], arr)
    else
        amt.times do
            change << 1
        end
    end
    return change
end
