    %{
    #include <stdio.h>
    #include <stdlib.h>
    #include <time.h>
    void yyerror(const char *str){
        fprintf(stderr,"Ошибка:%s\n",str);
    }
    int light=0;
    int heater_temp=0;
    int program=0;
    int yylex();                    t = 0;
    int yywrap(){return 1;}
    extern FILE *yyin,*yyout;
    %}
    %token PC MOTION HEATER TIME CHECK
    %token STATE DETECTION DEGREES NUMBER PROGRAM
    %%
    commands:
        |commands start;
    start:
        Motion_detection
        |	Heater
        |	Time
        |	PC_set
        |	Check
        ;

    Motion_detection:
        MOTION DETECTION{
                if($2){fprintf(yyout,"Датчик движения заметил активность -> включаю свет\n");light=1;}
                else{fprintf(yyout,"Движения не обнаружены -> выключаю свет\n");light=0;}
                };

    Heater:
        HEATER STATE NUMBER DEGREES{
                if($2){heater_temp=$3;fprintf(yyout,"Включаю обогреватель -> устанавливаю заданную температуру");}
                else{fprintf(yyout,"Выключаю обогреватель\n");heater_temp=0;}
                };	

    Time:
        TIME {
            time_t rawtime;
            struct tm* timeinfo;
            char mas[80];
            time(&rawtime);
            timeinfo = localtime(&rawtime);
            fprintf(yyout, "Время:");
            strftime(mas, 8, "%I:%M%p", timeinfo);
            fprintf(yyout, "%s\n", mas);
            int hour = atoi(mas);
            if (mas[5] == 'A') {
                if (hour >= 6 && hour < 9) {
                    fprintf(yyout, "Доброе утро!\n");
                }
            } else if (mas[5] == 'P') {
                if (hour >= 9 && hour < 18) {
                    fprintf(yyout, "Добрый день!\n");
            } else if (hour >= 18 && hour < 24) {
                    fprintf(yyout, "Вечер добрый!\n");
            } else if (hour >= 0 && hour < 6) {
                    fprintf(yyout, "Доброй ночи!\n");
            }
            }
        };

    PC_set:
        PC STATE NUMBER PROGRAM{
            if($2){
                if(program==0){fprintf(yyout,"Включаю ПК\n");}
                else{fprintf(yyout,"Запускаю браузер\n");}
                program=$3;}
            else {fprintf(yyout,"Выключаю ПК\n");program=0;}
            };

    Check:
        CHECK{
            fprintf(yyout,"Статус:\n");
            if(light==0){fprintf(yyout,"Свет выключен\n");}
            else {fprintf(yyout,"Свет включен\n");}
            if(heater_temp==0){fprintf(yyout,"Обогреватель выключен\n");}
            else{fprintf(yyout,"Обогреватель включен на ");fprintf(yyout,"%d",heater_temp);fprintf(yyout," градусов\n");}	
            if(program==0){fprintf(yyout,"ПК выключен\n");}
            else{
                if (program == 1)   {fprintf(yyout,"ПК включен и на нем запущен браузер\n");}
                else if (program == 2) {fprintf(yyout,"ПК включен и на нем запущен Visual Studio Code\n");}
                else {fprintf(yyout,"ПК включен\n"); }
                }
        };
    %%
    int main(){
        yyin=fopen("enter.txt","r");
        yyout=fopen("exit.txt","w");
        yyparse();
    }