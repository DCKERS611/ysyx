#include <lcthw/list.h>
#include <lcthw/dbg.h>

List *List_create()
{
    return calloc(1, sizeof(List));
}

void List_destroy(List *list)
{
    LIST_FOREACH(list, first, next, cur) {
        if(cur->prev) {
            free(cur->prev);
        }
    }

    free(list->last);
    free(list);
}

void List_clear(List *list)
{
    LIST_FOREACH(list, first, next, cur) {
        free(cur->value);
    }
}

void List_clear_destroy(List *list)
{
    List_clear(list);
    List_destroy(list);
}

void List_push(List *list, void *value)
{
    ListNode *node = calloc(1, sizeof(ListNode));
    check_mem(node);

    node->value = value;

    if(list->last == NULL) {
        list->first = node;
        list->last = node;
    } else {
        list->last->next = node;
        node->prev = list->last;
        list->last = node;
    }

    list->count++;

error:
    return;
}

void *List_pop(List *list)
{
    ListNode *node = list->last;
    return node != NULL ? List_remove(list, node) : NULL;
}

void List_unshift(List *list, void *value)
{
    ListNode *node = calloc(1, sizeof(ListNode));
    check_mem(node);

    node->value = value;

    if(list->first == NULL) {
        list->first = node;
        list->last = node;
    } else {
        node->next = list->first;
        list->first->prev = node;
        list->first = node;
    }

    list->count++;

error:
    return;
}

void *List_shift(List *list)
{
    ListNode *node = list->first;
    return node != NULL ? List_remove(list, node) : NULL;
}

void *List_remove(List *list, ListNode *node)
{
    void *result = NULL;

    check(list->first && list->last, "List is empty.");
    check(node, "node can't be NULL");

    if(node == list->first && node == list->last) {
        list->first = NULL;
        list->last = NULL;
    } else if(node == list->first) {
        list->first = node->next;
        check(list->first != NULL,
                "Invalid list, somehow got a first that is NULL.");
        list->first->prev = NULL;
    } else if(node == list->last) {
        list->last = node->prev;
        check(list->last != NULL,
                "Invalid list, somehow got a last that is NULL.");
        list->last->next = NULL;
    } else {
        ListNode *after = node->next;
        ListNode *before = node->prev;
        after->prev = before;
        before->next = after;
    }

    list->count--;
    result = node->value;

    free(node);

error:
    return result;
}

List *List_copy(List *list)
{
    List *copy = List_create();
    check_mem(copy);

    LIST_FOREACH(list , first , next, cur) {
        List_push(copy , cur->value);
    }

    return copy;
error:
    return NULL;
}

int List_join(List *left , List *right)
{
    check(left != NULL , "List left cannot be NULL.");
    check(right != NULL , "List right cannot be NULL.");

    if (right->first == NULL) return 0;

    if (left->first == NULL) {
        left->first = right->first;
        left->last = right->last;
    } else {
        left->last->next = right->first;
        right->first->prev = left->last;
        left->last = right->last;
    }

    left->count += right->count;

    right->first = NULL;
    right->last = NULL;
    right->count = 0;

    return 0;

error:
    return -1;
}

List *List_split(List *list , ListNode *node)
{
    List *right = NULL;
    ListNode *curr  =NULL;
    ListNode *before = NULL;
    int left_count = 0;

    check(list != NULL, "List_split: list is NULL.");
    check(node != NULL, "List_spilt: node is NULL.");
    
    for (curr = list->first ; curr != NULL && curr != node;curr = curr->next)
    {
        left_count ++;
    }

    check(curr == node, "List_spilt: node is not in list.");

    right = List_create();
    check_mem(right);

    before = node->prev;
    right->first = node;
    right->last = list->last;
    right->count = list->count - left_count;

    if (before != NULL) {
        before->next = NULL;
    } else {
        list->first = NULL;
    }

    list->last = before;
    list->count = left_count;
    node->prev = NULL;

    return right;

error:
    return NULL;
}

