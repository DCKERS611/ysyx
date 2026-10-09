#ifndef _LCTHW_LIST_ALGOS_H_
#define _LCTHW_LIST_ALGOS_H_

#include <lcthw/list.h>

typedef int (*List_compare)(const void *a, const void *b);

int List_bubble_sort(List *list , List_compare cmp);

List *List_merge_sort(List *list , List_compare cmp);

int List_insert_sorted(List *list, void *val , List_compare cmp);
#endif
