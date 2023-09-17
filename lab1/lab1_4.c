#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    FILE *file = fopen (argv[1], "r");
    int len = sizeof(file);
    char arr[len]; 
    if (file == NULL){
        printf("ERROR of inputing file");
        exit(EXIT_FAILURE);
    }
    while (fgets(arr, len, file) != NULL)
    {
        printf("%s", arr);
    }
    
    fclose(file);

    return 0;
}
