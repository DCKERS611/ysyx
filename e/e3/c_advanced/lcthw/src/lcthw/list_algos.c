#include <lcthw/list_algos.h>
#include <lcthw/dbg.h>

static void ListNode_swap(ListNode *a , ListNode *b)
{
    void *temp = a->value;
    a->value = b->value;
    b->value = temp;
}

int List_bubble_sort(List *list , List_compare cmp)
{
    int sorted = 1;
    if (list->count <= 1) return 0;

    do {
        sorted = 1;
        LIST_FOREACH(list , first , next , curr) {
            if (curr->next) {
                if (cmp(curr->value , curr->next->value) > 0) {
                    ListNode_swap(curr, curr->next);
                    sorted = 0;
                }
            }
        }
    } while(!sorted);

    return 0;
    
}

static List *List_merge(List *left, List *right, List_compare cmp)
{
    List *result = List_create();
    check_mem(result);

    while (List_count(left) > 0 || List_count(right) > 0) {
        if (List_count(left) > 0 && List_count(right) > 0) {
            if (cmp(List_first(left), List_first(right)) <= 0) {
                List_push(result, List_shift(left));
            } else {
                List_push(result, List_shift(right));
            }
        } else if (List_count(left) > 0) {
            List_push(result, List_shift(left));
        } else {
            List_push(result, List_shift(right));
        }
    }

    return result;
error:
    return NULL;
}

List *List_merge_sort(List *list, List_compare cmp)
{
    check(list != NULL, "List is NULL.");
    check(cmp != NULL, "cmp is NULL.");

    if (List_count(list) <= 1) {
        return list;
    }

    int middle = List_count(list) / 2;

    ListNode *mid_node = list->first;
    for (int i = 0 ; i < middle ; i ++) mid_node = mid_node->next;

    List *right = List_split(list, mid_node);
    List *left = list;

    left = List_merge_sort(left , cmp);
    right = List_merge_sort(right , cmp);

    return List_merge(left , right , cmp);

error:
    return NULL;
}
int List_insert_sorted(List *list , void *val , List_compare cmp)
{
    check(list != NULL, "List is NUll.");
    check(cmp != NULL, "cmp is NULL.");

    ListNode *mid = NULL;
    if (list->first == NULL) {
        List_push(list , val);
        return 0;
    }

    LIST_FOREACH(list, first , next ,curr) {
        if (cmp(curr->value , val) > 0) {
            break;
        }
    }

    if (curr == NULL) {
        List_push(list , val);
        return 0;
    }

    if (curr == list->first) {
        List_unshift(list , val);
        return 0;
    }

    mid = calloc(1, sizeof(ListNode));
    check_mem(mid);
    mid->value = val;

    ListNode *before = curr->prev;

    mid->next = curr;
    mid->prev = before;

    before->next = mid;
    curr->prev = mid;

    list->count ++;
    return 0;

error:
    if (mid) free(mid);
    return -1;
}
