#include <stdio.h>
#include <stdlib.h>

struct Node {
    int data;
    struct Node* next;
};

struct Stack {
    struct Node* top;
};

struct Node* createNode(int data) {
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    if (newNode == NULL) {
        printf("Error of getting memory for node\n");
        exit(EXIT_FAILURE);
    }
    newNode->data = data;
    newNode->next = NULL;
    return newNode;
}

struct Stack* createStack() {
    struct Stack* newStack = (struct Stack*)malloc(sizeof(struct Stack));
    if (newStack == NULL) {
        printf("Error of getting memory for \n");
        exit(EXIT_FAILURE);
    }
    newStack->top = NULL;
    return newStack;
}

// Функция для добавления элемента в стек
void push(struct Stack* stack, int data) {
    struct Node* newNode = createNode(data);
    newNode->next = stack->top;
    stack->top = newNode;
}

// Функция для извлечения элемента из стека
int pop(struct Stack* stack) {
    if (stack->top == NULL) {
        printf("Stack is free, can't use pop\n");
        exit(EXIT_FAILURE);
    }
    struct Node* temp = stack->top;
    int data = temp->data;
    stack->top = temp->next;
    free(temp);
    return data;
}

// Функция для просмотра верхнего элемента стека
int peek(struct Stack* stack) {
    if (stack->top == NULL) {
        printf("Stack is free, can't use peek\n");
        exit(EXIT_FAILURE);
    }
    return stack->top->data;
}

int main() {
    struct Stack* stack = createStack();

    push(stack, 10);
    push(stack, 20);
    push(stack, 30);
    push(stack, 40);
    push(stack, 50);

    printf("Upper element of stack: %d\n", peek(stack));

    while (stack->top != NULL) {
        printf("%d \n", pop(stack));
    }

    free(stack);

    return 0;
}