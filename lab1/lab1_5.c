#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]){
    //FILE *inputFile,*outputFile;
    //const int cons = 100;
    //char inputFileName[cons],outputFileName[cons],text[cons];
    FILE *inputFile = fopen(argv[1], "r");
    if (inputFile == NULL){
        printf("ERROR of openning input file\n");
        exit(EXIT_FAILURE);
    }

    int counter,len = 0;

    while (!feof(inputFile)){
        if (fgetc(inputFile) == '\n'){
            counter++;
        }
        else{
            len++;
        }
    }

    int i = 0;
    char TextInFile[counter][len];
    fseek(inputFile, 0, SEEK_SET);
    while (!feof(inputFile))
    {
        fgets(TextInFile[i],len-1,inputFile);
        i++;
    }

    fclose(inputFile);

    inputFile = fopen(argv[1], "w");

    printf("What u wanna see in file\n");
    char newtext[300];
    fgets(newtext,300,stdin);
    fputs(newtext, inputFile);
    
    for (int j = 0; j < counter; j++){
        fputs(TextInFile[j],inputFile);
    }

    /*fgets(text, cons, stdin);fclose(inputFile);

    printf("Name of input File");
    fgets(inputFileName, cons, stdin);
    inputFile = fopen(inputFileName, "r");
    if (inputFile == NULL){
        perror("ERROR of openning input file");
        exit(EXIT_FAILURE);
    }

    printf("Name of output File");
    fgets(outputFileName, cons, stdin);
    outputFile = fopen(outputFileName, "a");
    if (outputFile == NULL){
        perror("ERROR of openning output file");
        exit(EXIT_FAILURE);
    }

    fputs(text, outputFile);

    char ch;
    while ((ch = fgetc(inputFile)) != EOF){
        fputc(ch, outputFile);
    }
    
    fclose(inputFile);
    fclose(outputFile);*/
    
    fclose(inputFile);

    return 0;
}