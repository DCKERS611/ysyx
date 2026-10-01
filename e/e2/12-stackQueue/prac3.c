#include <stdio.h>

#define ROWS 5
#define COLS 5
#define QUEUE_CAPACITY 5

struct point {
    int row;
    int col;
};

static struct point queue[QUEUE_CAPACITY];
static int head;
static int tail;

static int maze[ROWS][COLS] = {
    {0, 1, 0, 0, 0},
    {0, 1, 0, 1, 0},
    {0, 0, 0, 0, 0},
    {0, 1, 1, 1, 0},
    {0, 0, 0, 1, 0}
};

static const int dr[4] = {0, 1, 0, -1};
static const int dc[4] = {1, 0, -1, 0};

static int is_empty(void)
{
    return head == tail;
}
static int is_full(void)
{
    /* TODO 2：本实现永久空出一个数组位置 */
    return (tail + 1) % QUEUE_CAPACITY == head; 
}

static int enqueue(struct point p)
{
    /* TODO 3：队满返回0，否则入队并返回1 */
    if(is_full()) {
        printf("queue is full !\n");
        return 0;
    }

    queue[tail] = p;
    tail = (tail + 1) % QUEUE_CAPACITY;
    return 1;
}

static struct point dequeue(void)
{
    /* TODO 4：取出队头，然后循环移动head */
    struct point p = queue[head];
    head = (head + 1) % QUEUE_CAPACITY;
    return p;
}

/* 返回1表示可达，0表示不可达，-1表示队列容量不足 */
static int bfs(void)
{
    struct point start = {0, 0};
    struct point goal = {ROWS - 1, COLS - 1};

    maze[start.row][start.col] = 2;
    if (!enqueue(start))
        return -1;

    while (!is_empty()) {
        struct point current = dequeue();

        if (current.row == goal.row && current.col == goal.col)
            return 1;

        for (int direction = 0; direction < 4; direction++) {
            int row = current.row + dr[direction];
            int col = current.col + dc[direction];

            if (row >= 0 && row < ROWS &&
                col >= 0 && col < COLS && maze[row][col] == 0) {
                struct point next = {row, col};

                if (!enqueue(next))
                    return -1;
                maze[row][col] = 2;
            }
        }
    }

    return 0;
}

int main(void)
{
    int result = bfs();

    if (result == 1)
        puts("Path exists.");
    else if (result == 0)
        puts("No path.");
    else
        puts("Queue capacity is insufficient.");

    return 0;
}
