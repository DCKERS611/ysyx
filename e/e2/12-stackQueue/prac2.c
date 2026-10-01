#include <stdio.h>

#define ROWS 5
#define COLS 5

static int maze[ROWS][COLS] = {
    {0, 1, 0, 0, 0},
    {0, 1, 0, 1, 0},
    {0, 0, 0, 0, 0},
    {0, 1, 1, 1, 0},
    {0, 0, 0, 1, 0}
};

/* 顺序：右、下、左、上 */
static const int dr[4] = {
    0 , 1 , 0 , -1
};

static const int dc[4] = {
    1 , 0 , -1 , 0
};

/* 返回1表示从(row,col)可以到达终点，返回0表示不可以 */
static int dfs(int row, int col)
{
    /* TODO 3：越界、墙或已访问时返回0 */
    if (row < 0 || row >= ROWS || col < 0 || col >= COLS || maze[row][col] != 0)
        return 0;

    /* TODO 4：把当前位置标记为已访问 */
    maze[row][col] = 2;

    /* TODO 5：当前位置是终点时，打印终点并返回1 */
    if (row == ROWS - 1 && col == COLS - 1){
        printf("goal : (%d,%d)\n" , row , col);
        return 1;
    }

    for (int direction = 0; direction < 4; direction++) {
        /* TODO 6：用dr、dc计算相邻位置next_row、next_col */
        int next_row = row + dr[direction];
        int next_col = col + dc[direction];

        /* TODO 7：递归搜索邻居；成功时打印当前点并返回1 */
        if(dfs(next_row , next_col)) {
            printf("(%d,%d)\n" , row , col);
            return 1;
        }
    }

    return 0;
}

int main(void)
{
    if (!dfs(0, 0))
        puts("No path!");

    return 0;
}
