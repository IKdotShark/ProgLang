    %{
    #include <stdio.h>
    #include <stdlib.h>
    #include <time.h>
    void yyerror(const char *str){
        fprintf(stderr,"Ошибка:%s\n",str);
    }
    int heater_temp = 0;
    int teapot_temp = 0;
    int program = 0;
    int track = 0;
    int light = 0;
    int danger_stat = 0;
    int yylex();                    
    int yywrap(){return 1;}
    extern FILE *yyin,*yyout;
    %}
    %token PC MOTION HEATER TIME CHECK MUSIC TEAPOT DANGER ALL
    %token STATE DETECTION DEGREES NUMBER PROGRAM TRACK
    %%
    commands:
        |commands start;
    start:
        Motion_detection
        |	Heater
        |	Time
        |	PC_set
        |   MUSIC_set
        |   teapot
        |   danger
        |	Check
        ;

    Time:
        TIME {
        time_t rawtime;
        struct tm* timeinfo;
        char mas[100];
        time(&rawtime);
        timeinfo = localtime(&rawtime);
        fprintf(yyout, "Время: ");
        strftime(mas, sizeof(mas), "%I:%M%p", timeinfo);
        fprintf(yyout, "%s\n", mas);

        int hour = timeinfo->tm_hour;
        int min = timeinfo->tm_min;

        if (mas[5] == 'A') {
            if (hour >= 6 && hour < 9) {
                fprintf(yyout, "Доброе утро!\n");
            }
            else if (hour >= 0 && hour < 6) {
                fprintf(yyout, "Доброй ночи!\n");
            }
        }
        else if (mas[5] == 'P') {
            if (hour >= 9 && hour < 18) {
                fprintf(yyout, "Добрый день!\n");
            } 
            else if (hour >= 18 && hour < 24) {
                fprintf(yyout, "Добрый вечер!\n");
            }
        }
        };

    Motion_detection:
        MOTION DETECTION{
                if($2){fprintf(yyout,"Датчик движения заметил активность -> включаю свет\n");
                light=1;
                }
                else{fprintf(yyout,"Движения не обнаружены -> выключаю свет\n");
                light=0;
                }
        };

    Heater:
        HEATER STATE NUMBER DEGREES{
                if($2){
                    if($3 > 100){heater_temp = 80;}
                    else{heater_temp=$3;}
                    fprintf(yyout,"Включаю обогреватель -> устанавливаю заданную температуру ");fprintf(yyout,"%d",heater_temp);}
                else if(danger_stat = 0){fprintf(yyout,"Выключаю обогреватель\n");heater_temp=0;}
                };	

    PC_set:
        PC STATE NUMBER PROGRAM{
            if($2){
                if (program == 0){fprintf(yyout,"Включаю ПК\n");}
                    program=$3;
                    if(program == 1){fprintf(yyout,"Запускаю браузер\n");}
                    if(program == 2){fprintf(yyout, "Запускаю Visual Studio Code\n");}
                    if(program == 3){fprintf(yyout, "Запускаю Battlestate Games Launcher\n");}
                }
            else {fprintf(yyout,"Выключаю ПК\n");program=0;}
            };

    MUSIC_set:
        MUSIC STATE NUMBER TRACK{
            if($2){
                if (track == 0){fprintf(yyout,"Включаю музыкальный центр\n");}
                    track=$3;
                    if(track == 1){fprintf(yyout,"Включаю музыку 60-х годов\n");}
                    if(track == 2){fprintf(yyout, "Включаю чарты\n");}
                    if(track == 3){fprintf(yyout, "Включаю Jeremy Soule - Steel of Steel (Музыка боя из игры The Elder Scrolls V: Skyrim)\n");}
                }
            else if(danger_stat = 0){fprintf(yyout,"Выключаю музыкальный центр\n");track=0;}
            };

    teapot:
        TEAPOT STATE NUMBER DEGREES{
            if($2){
                if($3 > 101){teapot_temp = 100;}
                    else{teapot_temp=$3;}
                teapot_temp=$3;
                fprintf(yyout,"Включаю подогрев чайника -> устанавливаю заданную температуру ");fprintf(yyout,"%d",teapot_temp);
            }
                else {fprintf(yyout,"Выключаю чайник\n"); teapot_temp=0;}
            };	

    danger:
        DANGER STATE{
            if($2){
                fprintf(yyout, "Включен режим опастности\n");
                track = 3;
                heater_temp = 60;
                danger_stat = 1;
            }
            else {
                fprintf(yyout,"Выключаю статус опастности\n");
                danger_stat=0;
                heater_temp = 0;
                track = 0;
            }
        };

    Check:
        CHECK{
            fprintf(yyout,"Статус:\n");
            if(light==0){fprintf(yyout,"Свет выключен\n");}
            else {fprintf(yyout,"Свет включен\n");}

            if(heater_temp==0){fprintf(yyout,"Обогреватель выключен\n");}
            else{fprintf(yyout,"Обогреватель включен на ");fprintf(yyout,"%d",heater_temp);fprintf(yyout," градусов\n");}	
            
            if(teapot_temp==0){fprintf(yyout,"Чайник выключен\n");}
            else{fprintf(yyout,"Чайник включен на ");fprintf(yyout,"%d",teapot_temp);fprintf(yyout," градусов\n");}	
            
            if(program==0){fprintf(yyout,"ПК выключен\n");}
            else{
                if      (program == 1) {fprintf(yyout,"ПК включен и на нем запущен браузер\n");}
                else if (program == 2) {fprintf(yyout,"ПК включен и на нем запущен Visual Studio Code\n");}
                else if (program == 3) {fprintf(yyout, "ПК включен и на нем запущен Battlestate Games Launcher\n");}
                else {fprintf(yyout,"ПК включен\n"); }
                }
            
            if(track==0){fprintf(yyout,"Музыкальный центр выключен\n");}
            else{
                if      (track == 1) {fprintf(yyout,"Музыкальный центр включен, играет музыка 60-х годов\n");}
                else if (track == 2) {fprintf(yyout,"Музыкальный центр включен, играют треки из чартов\n");}
                else if (track == 3) {fprintf(yyout,"Музыкальный центр включен, играет Jeremy Soule - Steel of Steel (Музыка боя из игры The Elder Scrolls V: Skyrim)\n");}
                else {fprintf(yyout,"Музыкальный центр включен\n"); }
                }
        };
    %%
    
    int main(){
        yyin=fopen("input.txt","r");
        yyout=fopen("output.txt","w");
        yyparse();
    }