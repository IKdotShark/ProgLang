#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void randomArr(int arr[], int len){
    for(int i = 0; i < len; i++){
        arr[i] = rand() % 100 + 1;
    }
}

void outputArr(int arr[], int len){
    for(int i = 0; i < len; i++){
        printf("%d", arr[i]);
        printf("\n");
    }
    printf("\n");
}

/*void fileArr(int arr[], int len){
    FILE *file = fopen (argv[1], "w");
    if(file == NULL){
        printf("ERROR of inputing file");
        exit(EXIT_FAILURE);
    }

    for (int i = len - 1 ; i >= 0 ; i--)
    {
        fprintf(file, "%d\n", arr[i]);
    }

    fclose(file);
}*/

int main(int argc,char *argv[]){
    int arrlen;
    printf("Input length of array: ");
    scanf("%d", &arrlen);

    if (arrlen <=0)
    {
        printf("Error of length of array");
        return 1;
    }
    
    int *newrandomArray = malloc(arrlen * sizeof(int));
    srand(time(NULL));
    randomArr(newrandomArray, arrlen);
    printf("Made array\n");
    outputArr(newrandomArray, arrlen);

    FILE *file;
    file = fopen (argv[1], "w");

    if(file == NULL){
        printf("ERROR of inputing file");
        exit(EXIT_FAILURE);
    }

    for(int i = arrlen - 1;i >= 0; i--){
        fprintf(file, "%d", newrandomArray[i]);
        fputs("\n", file);
    }

    fclose(file);

    free(newrandomArray);

    return 0;
}