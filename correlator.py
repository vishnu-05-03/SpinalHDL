def shift_right(lst):
    return [0] + lst[:len(lst)-1]

def shift_left(lst):
    return lst[1:] + [0]

def correlation(signal1, signal2):
    result = []
    length = len(signal1) + len(signal2) - 1
    padded_signal1 = [0]*(length - len(signal1)) + signal1
    padded_signal2 = signal2 + [0]*(length - len(signal2))
    count = 0

    for i in range(length):
        value = 0
        for j in range(length):
            value += padded_signal1[j] * padded_signal2[j]
        
        result.append(value)

        if count < len(signal1)-1 :
            padded_signal2 = shift_right(padded_signal2)
            count += 1
        else:
            padded_signal1 = shift_left(padded_signal1)
    
    return result

# Example usage
signal2 = [1, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0]
signal1 = [0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 1]
correlation_signal = correlation(signal1, signal2)
print(correlation_signal)
