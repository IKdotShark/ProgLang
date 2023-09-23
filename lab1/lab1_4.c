#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    FILE *file = fopen (argv[1], "r");

    if (file == NULL){
        printf("ERROR of inputing file");
        exit(EXIT_FAILURE);
    }
    
    fseek(file, 0, SEEK_END);
    long len = ftell(file);
    fseek(file, 0, SEEK_SET);

    char *arr = (char *)malloc(len); 
    
    while (fgets(arr, len, file) != NULL)
    {
        printf("%s", arr);
    }
    
    free(arr);
    
    fclose(file);

    return 0;
}
