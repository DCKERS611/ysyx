#include <assert.h>
#include <stddef.h>
#include <stdio.h>

#define CAPACITY 6
#define NIL (-1)

typedef struct {
    int value;
    int next;
} StaticNode;

typedef struct {
    StaticNode nodes[CAPACITY];

    int head;
    int free_head;

    size_t size;
} StaticList;

void slist_init (StaticList *slist)
{
    slist->head = NIL;
    slist->free_head = 0;
    slist->size = 0;
    
    for (int i = 0 ; i < CAPACITY ; i ++) {
        slist->nodes[i].next = (i + 1) < CAPACITY ? i + 1 : NIL;
        slist->nodes[i].value = 0;
    }
}

int slist_insert_sorted (StaticList *slist , int value)
{
    if (slist->free_head == NIL) return 0;
    
    int index = slist->free_head;
    slist->free_head = slist->nodes[index].next;

    slist->nodes[index].value = value;
    slist->size ++;

    int cur = slist->head;
    int pre = NIL;
    while (cur != NIL && slist->nodes[cur].value <= value) {
        pre = cur;
        cur = slist->nodes[cur].next;
    }

    if (pre == NIL) {
        slist->nodes[index].next = slist->head;
        slist->head = index;
    } else {
        slist->nodes[index].next = slist->nodes[pre].next;
        slist->nodes[pre].next = index;
    }

    return 1;
}

int slist_find (const StaticList *slist , int target)
{
    int cur = slist->head;
    while (cur != NIL) {
        if (slist->nodes[cur].value == target) 
            return cur;
        cur = slist->nodes[cur].next;
    }
    return NIL;
}

int slist_remove_first (StaticList *slist , int target)
{
    int cur = slist->head;
    int pre = NIL;
    while (cur != NIL) {
        if (slist->nodes[cur].value == target) {
                if (pre == NIL) slist->head = slist->nodes[cur].next;
                else slist->nodes[pre].next = slist->nodes[cur].next;

                slist->nodes[cur].next = slist->free_head;
                slist->free_head = cur;
                slist->size --;
                
                return 1;
        }
        pre = cur;
        cur = slist->nodes[cur].next;
    }
    return 0;
}

void slist_reverse (StaticList *slist)
{
    int cur = slist->head;
    int pre = NIL;
    while (cur != NIL) {
        int next = slist->nodes[cur].next;
        slist->nodes[cur].next = pre;
        pre = cur;
        cur = next;
    }
    slist->head = pre;
}

void slist_print (const StaticList *slist)
{
    int cur = slist->head;
    while (cur != NIL) {
        printf("%d " , slist->nodes[cur].value);
        cur = slist->nodes[cur].next;
    }
    printf("\n");
}

int slist_validate (const StaticList *slist)
{
    if (slist == NULL || slist->size > CAPACITY) return 0;
    
    int seen[CAPACITY] = {0};
    size_t used_count = 0;
    int pre = NIL;
    int cur = slist->head;

    while (cur != NIL) {
        if (cur < 0 || cur >= CAPACITY) return 0;

        if (seen[cur]) return 0;
        seen[cur] = 1;

        if (pre != NIL && slist->nodes[pre].value > slist->nodes[cur].value) return 0;

        used_count ++;
        pre = cur;
        cur = slist->nodes[cur].next;
    }

    if (used_count != slist->size) return 0;

    size_t free_count = 0;
    cur = slist->free_head;
    while (cur != NIL) {
        if (cur < 0 || cur >= CAPACITY) return 0;
        if (seen[cur]) return 0;
        seen[cur] = 1;

        free_count ++;
        cur = slist->nodes[cur].next;
    }

    if (used_count + free_count != CAPACITY) return 0;

    return 1;
}

void slist_destroy (StaticList *slist)
{
    slist->head = NIL;
    slist->free_head = 0;
    slist->size = 0;
    for (int i = 0 ; i < CAPACITY ; i ++) {
        slist->nodes[i].next = (i + 1) < CAPACITY ? i + 1 : NIL;
        slist->nodes[i].value = 0;
    }
}

static void expect_values(const StaticList *slist, const int expected[], size_t expected_size)
{
    assert(slist->size == expected_size);
    int cur = slist->head;
    size_t i = 0;

    while (cur != NIL) {
        assert(i < expected_size);
        assert(slist->nodes[cur].value == expected[i]);
        i++;
        cur = slist->nodes[cur].next;
    }

    assert(i == expected_size);
}

int main(void)
{
    StaticList list;
    slist_init(&list);
    assert(slist_validate(&list));
    expect_values(&list, NULL, 0);

    int result = slist_insert_sorted(&list, 30);
    assert(result == 1);
    result = slist_insert_sorted(&list, 10);
    assert(result == 1);
    result = slist_insert_sorted(&list, 20);
    assert(result == 1);
    result = slist_insert_sorted(&list, 20);
    assert(result == 1);
    result = slist_insert_sorted(&list, 5);
    assert(result == 1);
    result = slist_insert_sorted(&list, 40);
    assert(result == 1);

    const int full_values[] = {5, 10, 20, 20, 30, 40};
    expect_values(&list, full_values, 6);
    assert(slist_validate(&list));

    int index = slist_find(&list, 20);
    assert(index != NIL);
    assert(list.nodes[index].value == 20);
    assert(slist_find(&list, 99) == NIL);

    result = slist_insert_sorted(&list, 25);
    assert(result == 0);
    expect_values(&list, full_values, 6);

    result = slist_remove_first(&list, 20);
    assert(result == 1);
    const int after_remove[] = {5, 10, 20, 30, 40};
    expect_values(&list, after_remove, 5);
    assert(slist_validate(&list));

    result = slist_insert_sorted(&list, 25);
    assert(result == 1);
    const int after_reuse[] = {5, 10, 20, 25, 30, 40};
    expect_values(&list, after_reuse, 6);
    assert(slist_validate(&list));

    result = slist_remove_first(&list, 5);
    assert(result == 1);
    result = slist_remove_first(&list, 40);
    assert(result == 1);
    result = slist_remove_first(&list, 99);
    assert(result == 0);

    const int before_reverse[] = {10, 20, 25, 30};
    expect_values(&list, before_reverse, 4);
    assert(slist_validate(&list));

    slist_reverse(&list);
    const int reversed[] = {30, 25, 20, 10};
    expect_values(&list, reversed, 4);

    slist_reverse(&list);
    expect_values(&list, before_reverse, 4);
    assert(slist_validate(&list));

    slist_destroy(&list);
    expect_values(&list, NULL, 0);
    assert(slist_validate(&list));

    printf("all static-list tests passed\n");
    return 0;
}
