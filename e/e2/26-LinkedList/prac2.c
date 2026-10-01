#include <assert.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct DNode DNode;

struct DNode {
    int value ;
    DNode *prev;
    DNode *next;
};

typedef struct {
    DNode head_sentinel;
    DNode tail_sentinel;
    size_t size;
}DList;

void dlist_init(DList *list)
{
    list->head_sentinel.prev = NULL;
    list->head_sentinel.next = &list->tail_sentinel;
    
    list->tail_sentinel.prev = &list->head_sentinel;
    list->tail_sentinel.next = NULL;

    list->size = 0;
}

int dlist_push_front (DList *list , int value) 
{
    DNode *node = malloc(sizeof(*node));
    if (node == NULL) return 0;

    node->value = value;
    node->prev = &list->head_sentinel;
    node->next = list->head_sentinel.next;

    list->head_sentinel.next->prev = node;
    list->head_sentinel.next = node;
    list->size ++;

    return 1;
}

int dlist_push_back (DList *list , int value)
{
    DNode *node = malloc(sizeof(*node));
    if (node == NULL) return 0;

    node->value = value;
    node->prev = list->tail_sentinel.prev;
    node->next = &list->tail_sentinel;

    list->tail_sentinel.prev->next = node;
    list->tail_sentinel.prev = node;
    list->size ++;
    
    return 1;
}

int dlist_insert_before (DList *list , DNode *position , int value)
{
    if (position == NULL
            || position == &list->head_sentinel
            || position == &list->tail_sentinel)
        return 0;

    DNode *node = malloc(sizeof(*node));
    if (node == NULL) return 0;
    node->value = value;
    node->prev = position->prev;
    node->next = position;

    position->prev->next = node;
    position->prev = node;
    list->size ++;
    
    return 1;
}

DNode *dlist_find (DList *list , int target)
{
    for (DNode *p = list->head_sentinel.next ; p != &list->tail_sentinel ; p = p->next) {
        if (p->value == target) return p;
    }
    return NULL;
}

void dlist_print_forward (const DList *list)
{
    for (const DNode *p = list->head_sentinel.next ; p != &list->tail_sentinel ; p = p->next) {
        printf("%d " , p->value);
    }
    printf("\n");
}

void dlist_print_backward (const DList *list)
{
    for (const DNode *p = list->tail_sentinel.prev ; p != &list->head_sentinel ; p = p->prev) {
        printf("%d " , p->value);
    }
    printf("\n");
}

int dlist_validate (const DList *list)
{
    if (list->head_sentinel.next == &list->tail_sentinel) {
        if (list->tail_sentinel.prev != &list->head_sentinel) return 0;
        if (list->size != 0) return 0;

        return 1;
    }

    size_t count = 0;
    const DNode *p = list->head_sentinel.next;

    while (p != &list->tail_sentinel) {
        if (p->next->prev != p) return 0;
        if (p->prev->next != p) return 0;

        count ++;
        p = p->next;
    }

    if (list->head_sentinel.next->prev != &list->head_sentinel) return 0;
    if (list->tail_sentinel.prev->next != &list->tail_sentinel) return 0;
    if (count != list->size) return 0;

    return 1;
}

void dlist_destroy (DList *list)
{
    DNode *p = list->head_sentinel.next;
    while (p != &list->tail_sentinel) {
        DNode *next = p->next;
        free(p);
        p = next;
    }
    dlist_init(list);
}

int dlist_remove_first (DList *list , int target)
{
    DNode *p = dlist_find(list , target);
    if (p == NULL) return 0;

    p->next->prev = p->prev;
    p->prev->next = p->next;
    free(p);
    list->size --;
    return 1;
}

int main(void)
{
    DList list;
    dlist_init(&list);

    assert(dlist_validate(&list));

    assert(dlist_push_back(&list, 10));
    assert(dlist_push_back(&list, 20));
    assert(dlist_push_front(&list, 5));
    assert(dlist_push_back(&list, 30));

    DNode *position = dlist_find(&list, 20);
    assert(position != NULL);

    assert(
        dlist_insert_before(
            &list,
            position,
            15
        )
    );

    assert(dlist_validate(&list));

    dlist_print_forward(&list);
    dlist_print_backward(&list);

    assert(dlist_remove_first(&list, 5));
    assert(dlist_remove_first(&list, 30));
    assert(dlist_remove_first(&list, 20));
    assert(!dlist_remove_first(&list, 99));

    assert(dlist_validate(&list));
    assert(list.size == 2);

    dlist_print_forward(&list);
    dlist_print_backward(&list);

    dlist_destroy(&list);

    assert(list.size == 0);
    assert(dlist_validate(&list));

    return 0;
}
