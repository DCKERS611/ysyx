#include <stdio.h>

#define ROWS 5
#define COLS 5
#define CAPACITY (ROWS * COLS)

struct point {
    int row;
    int col;
};

static int maze[ROWS][COLS] = {
    {0, 1, 0, 0, 0},
    {0, 1, 0, 1, 0},
    {0, 0, 0, 0, 0},
    {0, 1, 1, 1, 0},
    {0, 0, 0, 1, 0}
};

static struct point stack[CAPACITY];
static int top;
static struct point predecessor[ROWS][COLS];

static void push(struct point p)
{
    stack[top++] = p;
}

static struct point pop(void)
{
    return stack[--top];
}

static int is_empty(void)
{
    return top == 0;
}

static int same_point(struct point a, struct point b)
{
    return a.row == b.row && a.col == b.col;
}

static void initialize_predecessor(void)
{
    for (int row = 0; row < ROWS; row++) {
        for (int col = 0; col < COLS; col++) {
            predecessor[row][col].row = -1;
            predecessor[row][col].col = -1;
        }
    }
}

static void visit(int row, int col, struct point pre)
{
    struct point next = {row, col};
    maze[row][col] = 2;
    predecessor[row][col] = pre;
    push(next);
}

static struct point search(void)
{
    const int dr[] = {0, 1, 0, -1};
    const int dc[] = {1, 0, -1, 0};
    const struct point goal = {ROWS - 1, COLS - 1};
    struct point current = {0, 0};

    initialize_predecessor();
    maze[0][0] = 2;
    push(current);

    while (!is_empty()) {
        current = pop();
        if (same_point(current, goal))
            return current;

        for (int direction = 0; direction < 4; direction++) {
            int row = current.row + dr[direction];
            int col = current.col + dc[direction];

            if (row >= 0 && row < ROWS &&
                col >= 0 && col < COLS && maze[row][col] == 0)
                visit(row, col, current);
        }
    }

    return (struct point){-1, -1};
}

static void print_path_forward(struct point p)
{
    if (p.row == -1 && p.col == -1) 
    return ;
    
    print_path_forward(predecessor[p.row][p.col]);
    printf("[%d, %d]\n" , p.row , p.col);

}

int main(void)
{
    struct point goal = search();

    if (goal.row == -1)
        puts("No path!");
    else
        print_path_forward(goal);

    return 0;
}
