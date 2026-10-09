#include "minunit.h"
#include <lcthw/list_algos.h>
#include <assert.h>
#include <string.h>
#include <time.h>

char *values[] = {"XXXX", "1234", "abcd", "xjvef", "NDSS"};
#define NUM_VALUES 5

List *create_words()
{
    int i = 0;
    List *words = List_create();

    for(i = 0; i < NUM_VALUES; i++) {
        List_push(words, values[i]);
    }

    return words;
}

int is_sorted(List *words)
{
    LIST_FOREACH(words, first, next, cur) {
        if(cur->next && strcmp(cur->value, cur->next->value) > 0) {
            debug("%s %s", (char *)cur->value, (char *)cur->next->value);
            return 0;
        }
    }

    return 1;
}

char *test_bubble_sort()
{
    List *words = create_words();

    // 应该能排序一个需要排序的链表
    int rc = List_bubble_sort(words, (List_compare)strcmp);
    mu_assert(rc == 0, "Bubble sort failed.");
    mu_assert(is_sorted(words), "Words are not sorted after bubble sort.");

    // 对已经有序的链表也应该工作
    rc = List_bubble_sort(words, (List_compare)strcmp);
    mu_assert(rc == 0, "Bubble sort of already sorted failed.");
    mu_assert(is_sorted(words), "Words should be sort if already bubble sorted.");

    List_destroy(words);

    // 空链表也应该工作
    words = List_create(words);
    rc = List_bubble_sort(words, (List_compare)strcmp);
    mu_assert(rc == 0, "Bubble sort failed on empty list.");
    mu_assert(is_sorted(words), "Words should be sorted if empty.");

    List_destroy(words);

    return NULL;
}

char *test_merge_sort()
{
    List *words = create_words();

    // 应该能排序一个需要排序的链表
    List *res = List_merge_sort(words, (List_compare)strcmp);
    mu_assert(is_sorted(res), "Words are not sorted after merge sort.");

    List *res2 = List_merge_sort(res, (List_compare)strcmp);
    mu_assert(is_sorted(res), "Should still be sorted after merge sort.");
    List_destroy(res2);
    List_destroy(res);

    List_destroy(words);

    return NULL;
}

// List *make-random(int n);
List *make_words(int n)
{
    List *l = List_create();
    char *pool[] = {"apple","banana","cat","dog","elephant","fox","grape","house"};
    int pool_size = 8;
    for (int i = 0; i < n; i++) {
        List_push(l, pool[i % pool_size]);
    }
    return l;
}

char *test_perf()
{
	int n = 5000;

	List *list = make_words(n);
    clock_t t1 = clock();
    List_bubble_sort(list , (List_compare)strcmp);
    clock_t t2 = clock();
    double bubble_time = (double)(t2 - t1) / CLOCKS_PER_SEC;
	List_destroy(list);

	List *list2 = make_words(n);
    t1 = clock();
	List *sorted = List_merge_sort(list2, (List_compare)strcmp);
    t2 = clock();
    double merge_time = (double)(t2 - t1) / CLOCKS_PER_SEC;
	List_destroy(list2);
	List_destroy(sorted);

    printf("n=%d: bubble=%.6f s, merge=%.6f s\n", n, bubble_time, merge_time); 
    return NULL;
}

char *test_insert_sorted()
{
    // 场景1：空链表插入
    List *l = List_create();
    int rc = List_insert_sorted(l, "banana", (List_compare)strcmp);
    mu_assert(rc == 0, "insert into empty failed.");
    mu_assert(List_count(l) == 1, "Wrong count after empty insert.");
    mu_assert(strcmp(List_first(l), "banana") == 0, "Wrong value.");
    List_destroy(l);

    // 场景2：插到中间
    l = List_create();
    List_push(l, "apple");    // l = [apple, cat]
    List_push(l, "cat");
    rc = List_insert_sorted(l, "banana", (List_compare)strcmp);
    mu_assert(rc == 0, "insert middle failed.");
    mu_assert(is_sorted(l), "List not sorted after middle insert.");
    mu_assert(List_count(l) == 3, "Wrong count.");
    mu_assert(strcmp(List_first(l), "apple") == 0, "Wrong first.");
    mu_assert(strcmp(List_last(l), "cat") == 0, "Wrong last.");
    List_destroy(l);

    // 场景3：插到最前
    l = List_create();
    List_push(l, "banana");
    List_push(l, "cat");
    rc = List_insert_sorted(l, "apple", (List_compare)strcmp);
    mu_assert(rc == 0, "insert head failed.");
    mu_assert(is_sorted(l), "Not sorted after head insert.");
    mu_assert(strcmp(List_first(l), "apple") == 0, "apple should be first.");
    List_destroy(l);

    // 场景4：插到最后
    l = List_create();
    List_push(l, "apple");
    List_push(l, "banana");
    rc = List_insert_sorted(l, "cat", (List_compare)strcmp);
    mu_assert(rc == 0, "insert tail failed.");
    mu_assert(is_sorted(l), "Not sorted after tail insert.");
    mu_assert(strcmp(List_last(l), "cat") == 0, "cat should be last.");
    List_destroy(l);

    return NULL;
}

char *all_tests() {
    mu_suite_start();

    mu_run_test(test_bubble_sort);
    mu_run_test(test_merge_sort);

    mu_run_test(test_perf);
    mu_run_test(test_insert_sorted);
    return NULL;
}

RUN_TESTS(all_tests);
