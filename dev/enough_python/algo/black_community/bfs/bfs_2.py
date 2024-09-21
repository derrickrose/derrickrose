# https://leetcode.com/problems/sliding-puzzle/description/


import copy


def build_board_id(board):
    values = []
    for row in board:
        for var in row:
            values.append(var)
    return "".join(values)


def find_zero(board):
    for y in range(len(board)):
        for x in range(len(board[0])):
            if board[y][x] == 0:
                return y, x


def get_possible_boards(board: list[list]) -> list[list[list]]:
    boards = []
    # move left
    zero_y, zero_x = find_zero(board)
    print("y, x", zero_y, zero_x)
    if zero_x > 0:  # possible to move left
        first_board = copy.deepcopy(board)
        temp = first_board[zero_y][zero_x - 1]
        first_board[zero_y][zero_x - 1] = 0
        first_board[zero_y][zero_x] = temp
        boards.append(first_board)
    # move right
    if zero_x < len(board[0]) - 1:
        second_board = copy.deepcopy(board)
        temp = second_board[zero_y][zero_x + 1]
        second_board[zero_y][zero_x + 1] = 0
        second_board[zero_y][zero_x] = temp
        boards.append(second_board)
    # move up
    if zero_y > 0:
        third_board = copy.deepcopy(board)
        temp = third_board[zero_y - 1][zero_x]
        third_board[zero_y - 1][zero_x] = 0
        third_board[zero_y][zero_x] = temp
        boards.append(third_board)
    # move down
    if zero_y < len(board) - 1:
        quatro = copy.deepcopy(board)
        temp = quatro[zero_y + 1][zero_x]
        quatro[zero_y + 1][zero_x] = 0
        quatro[zero_y][zero_x] = temp
        boards.append(quatro)
    return boards


if __name__ == '__main__':
    # 1 | 2 | 3
    # 4 | 0 | 5
    starting_board = [[1, 2, 3], [4, 0, 5]]
    target_board = [[1, 2, 3], [4, 5, 0]]
    print(get_possible_boards(starting_board))
