#include "minunit.h"
#include <lcthw/list.h>
#include <assert.h>

static List *list = NULL;
char *test1 = "test1 data";
char *test2 = "test2 data";
char *test3 = "test3 data";

char *test_create()
{
    list = List_create();
    mu_assert(list != NULL, "Failed to create list.");

    return NULL;
}

char *test_destroy()
{
    List_clear_destroy(list);

    return NULL;
}

char *test_push_pop()
{
    List_push(list, test1);
    mu_assert(List_last(list) == test1, "Wrong last value.");

    List_push(list, test2);
    mu_assert(List_last(list) == test2, "Wrong last value");

    List_push(list, test3);
    mu_assert(List_last(list) == test3, "Wrong last value.");
    mu_assert(List_count(list) == 3, "Wrong count on push.");

    char *val = List_pop(list);
    mu_assert(val == test3, "Wrong value on pop.");

    val = List_pop(list);
    mu_assert(val == test2, "Wrong value on pop.");

    val = List_pop(list);
    mu_assert(val == test1, "Wrong value on pop.");
    mu_assert(List_count(list) == 0, "Wrong count after pop.");

    return NULL;
}

char *test_unshift()
{
    List_unshift(list, test1);
    mu_assert(List_first(list) == test1, "Wrong first value.");

    List_unshift(list, test2);
    mu_assert(List_first(list) == test2, "Wrong first value");

    List_unshift(list, test3);
    mu_assert(List_first(list) == test3, "Wrong last value.");
    mu_assert(List_count(list) == 3, "Wrong count on unshift.");

    return NULL;
}

char *test_remove()
{
    // we only need to test the middle remove case since push/shift
    // already tests the other cases

    char *val = List_remove(list, list->first->next);
    mu_assert(val == test2, "Wrong removed element.");
    mu_assert(List_count(list) == 2, "Wrong count after remove.");
    mu_assert(List_first(list) == test3, "Wrong first after remove.");
    mu_assert(List_last(list) == test1, "Wrong last after remove.");

    return NULL;
}

char *test_shift()
{
    mu_assert(List_count(list) != 0, "Wrong count before shift.");

    char *val = List_shift(list);
    mu_assert(val == test3, "Wrong value on shift.");

    val = List_shift(list);
    mu_assert(val == test1, "Wrong value on shift.");
    mu_assert(List_count(list) == 0, "Wrong count after shift.");

    return NULL;
}

char *test_split()
{
    List *l = List_create();
    mu_assert(l != NULL, "Failed to create a list.");

    char *a = "a"; char *b = "b"; char *c = "c";
    List_push(l,a);
    List_push(l,b);
    List_push(l,c);

    ListNode *node_b = l->first->next;
    List *right = List_split(l , node_b);

    mu_assert(right != NULL, "split returned NULL.");
	mu_assert(List_count(l) == 1, "Wrong left count after split.");
    mu_assert(List_count(right) == 2, "Wrong right count after split.");
    mu_assert(List_first(l) == a, "Wrong left first.");
    mu_assert(List_last(l) == a, "Wrong left last.");
    mu_assert(List_first(right) == b, "Wrong right first.");
    mu_assert(List_last(right) == c, "Wrong right last.");

    ListNode *curr = right->last;
    ListNode *walked_back = NULL;
    while (curr != NULL) {
        walked_back = curr;
        curr = curr->prev;
    }

    fprintf(stderr, "DEBUG right: first=%p last=%p walked_back=%p", (void*)right->first , (void*)right->last , (void*)walked_back);
    mu_assert(walked_back == right->first, "Right list prev-chain not NULL.");

    mu_assert(l->first->prev == NULL, "Left list head's prev not NULL.");

    mu_assert(l->last->next == NULL, "Left tail still points into right.");

    List_destroy(l);
    List_destroy(right);
    return NULL;
}

char *test_split_head()
{
    List *l = List_create();
    char *a = "a"; char *b = "b";
    List_push(l, a); List_push(l, b);

    List *right = List_split(l, l->first);   // 从头切

    mu_assert(List_count(l) == 0, "Left should be empty after head split.");
    mu_assert(l->first == NULL && l->last == NULL, "Left pointers not NULL.");
    mu_assert(List_count(right) == 2, "Right should have all nodes.");

    List_destroy(l); List_destroy(right);
    return NULL;
}


char *test_join()
{
    List *left = List_create();
    List *right = List_create();
    mu_assert(left && right, "Failed to create lists.");

    char *a = "a"; char *b = "b"; char *c = "c"; char *d = "d";
    List_push(left, a); List_push(left, b);        // left = [a, b]
    List_push(right, c); List_push(right, d);      // right = [c, d]

    int rc = List_join(left, right);
    mu_assert(rc == 0, "join failed.");

    // left 现在是 [a, b, c, d]
    mu_assert(List_count(left) == 4, "Wrong count after join.");
    mu_assert(List_first(left) == a, "Wrong first.");
    mu_assert(List_last(left) == d, "Wrong last.");

    // 关键：反向遍历，从 d 用 prev 一路走回 a，验证接缝处(b->next=c, c->prev=b)没断
    int seen = 0;
    ListNode *cur = left->last;
    while (cur != NULL) { seen++; cur = cur->prev; }
    mu_assert(seen == 4, "Prev-chain broken at the join seam.");

    // right 现在应是空壳
    mu_assert(List_count(right) == 0, "right not emptied.");
    mu_assert(right->first == NULL && right->last == NULL, "right pointers not cleared.");

    List_destroy(left);    // 释放从 right 搬来的节点
    List_destroy(right);   // right 已是空壳，安全
    return NULL;
}

char *all_tests() {
    mu_suite_start();

    mu_run_test(test_create);
    mu_run_test(test_push_pop);
    mu_run_test(test_unshift);
    mu_run_test(test_remove);
    mu_run_test(test_shift);
    mu_run_test(test_destroy);
	mu_run_test(test_split);
	mu_run_test(test_split_head);
	mu_run_test(test_join);

    return NULL;
}

RUN_TESTS(all_tests);
