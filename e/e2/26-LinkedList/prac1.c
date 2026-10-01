#include <stdio.h>
#include <assert.h>
#include <stdlib.h>

typedef struct Node Node;

struct Node {
    int value;
    Node* next;
};

Node *create_node (int value)
{
    Node *node = malloc(sizeof(*node));
    if (node == NULL) {
        perror("malloc");
        return NULL;
    }

    node->value = value;
    node->next = NULL;
    return node;
}

int insert_node (Node **head_addr , int value)
{
    if (head_addr == NULL) return 0;

    Node *new_node = create_node(value);
    if (new_node == NULL) return 0;

    Node **pp = head_addr;
    while (*pp != NULL && (*pp)->value <= value) pp = &(*pp)->next;
    
    new_node->next = *pp;
    *pp = new_node;
    return 1;
}

const Node *find_node (const Node *head , int target)
{
    const Node *p = head;
    while (p != NULL) {
        if (p->value == target) return p;
            p = p->next;
    }
    return NULL;
}

int remove_first_node (Node **head_addr , int target)
{
    if (head_addr == NULL) return 0;

    Node **pp = head_addr;
    while (*pp != NULL) {
        if ((*pp)->value == target) {
            Node *victim = *pp;
            *pp = victim->next;
            free(victim);
            return 1;
        }
        pp = &(*pp)->next;
    }
    return 0;
}

void reverse_list (Node **head_addr)
{
    if (head_addr == NULL) return ;
    
    Node *cur = *head_addr;
    Node *pre = NULL;
    while (cur != NULL) {
        Node *next = cur->next;
        cur->next = pre;
        pre = cur;
        cur = next;
    }
    *head_addr = pre;
}

void visit_list (const Node *head , void (*visit)(int value , void *context) , void *context)
{
    const Node *p = head;
    while (p != NULL) {
        visit(p->value , context);
        p = p->next;
    }
}

void destroy_list(Node **head_addr)
{
    if (head_addr == NULL) return;

    Node *p = *head_addr;
    while (p != NULL) {
        Node *next = p->next;
        free(p);
        p = next;
    }
    *head_addr = NULL;
}

static void print_value(int value , void *context)
{
    FILE *stream = context;
    fprintf(stream, "%d ", value);
}

static void print_list(const Node *head)
{
    visit_list(head , print_value, stdout);

    putchar('\n');
}

int main ()
{
    Node *head = NULL;

    assert(insert_node(&head, 30));
    assert(insert_node(&head, 10));
    assert(insert_node(&head, 20));
    assert(insert_node(&head, 20));
    assert(insert_node(&head, 40));

    print_list(head);

    const Node *found = find_node(head, 20);
    assert(found != NULL);
    assert(found->value == 20);
    assert(find_node(head, 99) == NULL);

    assert(remove_first_node(&head, 20));
    assert(!remove_first_node(&head, 99));

    print_list(head);

    reverse_list(&head);
    print_list(head);

    destroy_list(&head);
    assert(head == NULL);

    return 0;
}
