#!/bin/python3

import math
import os
import random
import re
import sys


#
# Complete the 'climbingLeaderboard' function below.
#
# The function is expected to return an INTEGER_ARRAY.
# The function accepts following parameters:
#  1. INTEGER_ARRAY ranked
#  2. INTEGER_ARRAY player
#


def climbingLeaderboard(ranked, player):
    current_ranking = 0
    previous_rank_score = -1
    play_index = len(player) - 1
    for rank in range(len(ranked)):
        current_rank_score = ranked[rank]
        if current_rank_score != previous_rank_score:
            current_ranking += 1
        previous_rank_score = current_rank_score
        play_score = player[play_index]
        if play_score >= current_rank_score:
            for play in reversed(range(play_index + 1)):
                play_score = player[play]
                if play_score >= current_rank_score:
                    player[play] = current_ranking
                    play_index -= 1
                else:
                    break
    current_ranking += 1
    if play_index >= 0:
        for play in reversed(range(play_index + 1)):
            player[play] = current_ranking
    return player


if __name__ == '__main__':
    table = climbingLeaderboard([100, 100, 50, 40, 40, 20, 10], [5, 25, 50, 120])
    print(table)
