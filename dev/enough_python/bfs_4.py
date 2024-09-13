entry = [1, 5, 3, 5, 8, 7, 3, 5, 0]
# number of jump to reach from first index to last index if you can go forward or backward or jump to index of same value
#
from collections import deque


def build_graph(valores: list[int]) -> dict[int, list]:
    map_value_index: dict[int, list] = {}
    index = 0
    for val in valores:
        indexes = []
        if val not in map_value_index.keys():
            indexes.append(index)
        else:
            indexes = list(map_value_index[val])
            indexes.append(index)
        map_value_index[val] = indexes
        index += 1
    jumping_graph: dict[int, list] = {}
    for key in map_value_index.keys():
        for val in map_value_index[key]:
            values = list(map_value_index[key])
            values.remove(val)
            jumping_graph[val] = values
    for var in jumping_graph.keys():
        related_nodes = list(jumping_graph[var])
        if var == 0:
            related_nodes.append(var + 1)
        elif var == (len(valores) - 1):
            related_nodes.append(var - 1)
        else:
            related_nodes.append(var + 1)
            related_nodes.append(var - 1)
        jumping_graph[var] = related_nodes
    return jumping_graph


def jump(graph, start, target):
    visited = set()
    q = deque()
    q.append((start, 0))

    while q:
        current, num_hops = q.popleft()
        if current == target:
            return num_hops

        for friend in graph[current]:
            if not friend in visited:
                visited.add(friend)
                q.append((friend, num_hops + 1))


print(jump(build_graph(entry), 0, (len(entry) - 1)))
