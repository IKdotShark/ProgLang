#include <stdio.h>

int main(){
    double a,b,c,x;
    printf("Input a: ");
    scanf("%lf",&a);
    printf("\n");
    printf("Input b: ");
    scanf("%lf",&b);
    printf("\n");
    printf("Input c: ");
    scanf("%lf",&c);
    printf("\n");
    x = (c-b)/a;
    printf("x = %lf\n",x);
    return 0;
}