from collections import deque

# adjencency list


friends_graph = {
    "Kendrick Lamar": ["Rick Ross", "Pusha T", "Future"],
    "Rick Ross": ["Kendrick Lamar", "Pusha T"],
    "Pusha T": ["Kendrick Lamar", "Future", "Rick Ross"],
    "Future": ["Kendrick Lamar", "Pusha T", "Rihanna", "Megan Thee Stallion", "Metro Booming"],
    "Rihanna": ["The Weekend", "ASAP Rocky", "Future"],
    "The Weekend": ["Rihanna"],
    "ASAP Rocky": ["Rihanna"],
    "Metro Booming": ["Future"],
    "Megan Thee Stallion": ["Future"],
    "Drake": []
}


def friend_distance(graph, start, target):
    visited = set()
    q = deque()
    q.append((start, 0))

    while q:
        current, num_hops = q.popleft()
        if current == target:
            print(num_hops)
            return num_hops

        for friend in graph[current]:
            if not friend in visited:
                visited.add(friend)
                q.append((friend, num_hops + 1))


def friend_path(graph, start, target):
    pass


def are_direct_friends(graph, person1, person2):
    return person2 in graph[person1]


friend_distance(friends_graph, "Metro Booming", "Rick Ross")

# separate drake to drake_1 and drake_2 add adjencency between drake_1 and jcole
# and drake2_ to future
