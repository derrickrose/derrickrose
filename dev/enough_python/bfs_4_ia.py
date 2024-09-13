def minJumps(arr):
    n = len(arr)

    # Create jumps array and initialize it with float('inf'). Also
    # initialize first element of jumps array to 0
    jumps = [float('inf')] * n
    jumps[0] = 0

    # Create a dictionary to stores all indices with
    # their value as key.
    indices = {}
    for i in range(n):
        if arr[i] not in indices:
            indices[arr[i]] = [i]
        else:
            indices[arr[i]].append(i)

            # Build the jumps array incrementally using values of jumps[i] for
    # i = 1 to len(arr)-1. jumps[i] = Minimum number of steps to
    # reach arr[i] from arr[0]
    for i in range(1, n):
        prev = i - 1
        next = i + 1
        sameValueIndexes = indices[arr[i]] if arr[i] in indices else []

        # iterate through all reachable indices to current index
        for j in [prev, next] + sameValueIndexes:
            if 0 <= j < i:
                jumps[i] = min(jumps[i], jumps[j] + 1)

        # Clear the list of same value indices to avoid
        # counting them again.
        indices[arr[i]].clear()

    return jumps[-1]  # Return the minimum number of jumps to reach end


# test
arr = [1, 5, 3, 5, 8, 7, 3, 5, 0]
print('Minimum number of jumps to reach end is ', minJumps(arr))
