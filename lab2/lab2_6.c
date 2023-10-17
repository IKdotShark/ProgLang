#include <stdio.h>
#include <stdlib.h>

struct Stack {
    char data;
    struct Stack* next;
};

struct Stack* createNode(char data) {
    struct Stack* newNode = (struct Stack*)malloc(sizeof(struct Stack));
    if (newNode == NULL) {
        printf("Error of getting memory for node\n");
        exit(EXIT_FAILURE);
    }
    newNode->data = data;
    newNode->next = NULL;
    return newNode;
}

// Функция для добавления элемента в стек
void push(struct Stack** stack, char data) {
    struct Stack* newNode = createNode(data);
    newNode->next = *stack;
    *stack = newNode;
}

// Функция для извлечения элемента из стека
char pop(struct Stack** stack) {
    if (*stack == NULL) {
        printf("Stack is free, can't use pop\n");
        exit(EXIT_FAILURE);
    }
    struct Stack* temp = *stack;
    char data = temp->data;
    *stack = temp->next;
    free(temp);
    return data;
}

// Функция для просмотра верхнего элемента стека
char peek(struct Stack* stack) {
    if (stack == NULL) {
        printf("Stack is free, can't use peek\n");
        exit(EXIT_FAILURE);
    }
    return stack->data;
}

int main() {
    char infixExpr[100];
    printf("Input infix expression: ");
    scanf("%s", infixExpr);

    struct Stack* oper = NULL;
    int i = 0;
    printf("Postfix expression: ");
    while (infixExpr[i] != '\0') {
        char c = infixExpr[i];
        if (isdigit(c)) {
            printf("%c ", c);
        } else if (c == '+' || c == '-' || c == '*' || c == '/') {
            while (oper != NULL && (peek(oper) == '*' || peek(oper) == '/') && (c == '+' || c == '-')) {
                printf("%c ", pop(&oper));
            }
            push(&oper, c);
        } else if (c == '(') {
            push(&oper, c);
        } else if (c == ')') {
            while (oper != NULL && peek(oper) != '(') {
                printf("%c ", pop(&oper));
            }
            pop(&oper);
        }
        i++;
    }

    while (oper != NULL) {
        printf("%c ", pop(&oper));
    }

    printf("\n");
    return 0;
}
