#include <stdio.h>

struct item
{
    char name[100];
    double price;
};

int compar(const void *a, const void *b){
    double price_a = ((struct item*)a)->price;
    double price_b = ((struct item*)b)->price;

    if (price_a == price_b) return 0;
    else if (price_a < price_b) return -1;
    else return 1;
}

int main(int argc, char const *argv[2])
{
    struct item items[100]; // less than 100 items

    FILE *file = fopen(argv[1], "r");

    if (file == NULL) {
        printf("ERROR of inputing file 1");
        return -1;
        //exit(EXIT_FAILURE);
    }

    int counter = 0;
    while (fscanf(file, "%1000s %lf", items[counter].name, &
     items[counter].price) == 2 && counter < 100) {
        counter++;
    }

    fclose(file);

    if (counter > 0){
        qsort(items, counter, sizeof(struct item), compar);

        file = fopen(argv[2], "w");
        if (file == NULL) {
        printf("ERROR of inputing file 2");
        return -1;
        //exit(EXIT_FAILURE);
        }

        for (int i = 0; i < counter; i++) {
            fprintf(file, "%s %.2f\n", items[i].name, items[i].price);
        }

        fclose(file);
        printf("Success\n");
    }
    else{
        printf("Error of reading data from file 1");
    }

    return 0;
}
