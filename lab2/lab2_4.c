#include <stdio.h>
#include <stdlib.h>

struct Node {
    int data;
    struct Node* next;
};

struct Stack {
    struct Node* top;
    int size;
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

struct Stack* createStack(int maxSize) {
    struct Stack* newStack = (struct Stack*)malloc(sizeof(struct Stack));
    if (newStack == NULL) {
        printf("Error of getting memory for \n");
        exit(EXIT_FAILURE);
    }
    newStack->top = NULL;
    newStack->size = 0;
    return newStack;
}

//Проверка заполненности стака
int isStackFull(struct Stack* stack, int maxSize) {
    return maxSize <= 0 || stack->size >= maxSize;
}

// Функция для добавления элемента в стек
void push(struct Stack* stack, int data, int maxSize){
    if (isStackFull(stack, maxSize)) {
        printf("Stack is full, can't use push\n");
        return;
    }
    struct Node* newNode = createNode(data);
    newNode->next = stack->top;
    stack->top = newNode;
    stack->size++;
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
    stack->size--;
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

//Функция для вывода, если стек заполнен 
void checker(struct Stack* stack, int maxSize) {
    if (isStackFull(stack, maxSize)) {
        printf("Stack is full\n");
    } else {
        printf("Stack is not full\n");
    }
}

int main() {
    int maxSize;
    printf("Input max size of stack");
    scanf("%d", &maxSize);
    struct Stack* stack = createStack(maxSize);

    checker(stack, maxSize); 

    push(stack, 10, maxSize);
    push(stack, 20, maxSize);
    push(stack, 30, maxSize);
    push(stack, 40, maxSize);
    push(stack, 50, maxSize);

    checker(stack, maxSize); 

    printf("Upper element of stack: %d\n", peek(stack));

    while (stack->top != NULL) {
        printf("%d \n", pop(stack));
    }

    free(stack);
// функция для размерности стека, чтобы считала, для проверки создания узла стека заполнения памяти 
    return 0;
}