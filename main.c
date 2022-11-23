#include <stdio.h>
#include <stdlib.h>
#include <time.h>
extern double countExp(double accuracy);
#define max_accuracy 0.5
int main(int argc, char **argv) {
    int length;
    int i;
    double accuracy;
    double rand_number;
    double exp;
    clock_t begin;
    clock_t end;
    double time_spent;
    FILE *input, *output;
    //if there is not second argument or second argument equels 0 we will have entering from console
    if (argc < 2 || atoi(argv[1]) == 0) {
        do {
            printf("Print accuracy < %f and > 10^-15 \n", max_accuracy);
            scanf("%lf", &accuracy);
        } while (accuracy > 0.5 || accuracy < 1e-15);
        //if second argument equels 1 we will have entering from file.
    } else if (atoi(argv[1]) == 1) {
        if (argc >= 3) {
            input = fopen(argv[2], "r");
        } else {
            input = fopen("input.txt", "r");
        }
        if (!input) {
            return 1;
        }
        fscanf(input, "%lf", &accuracy);
        if (accuracy > max_accuracy || accuracy < 1e-15) {
            return 1;
        }
        //if second argument equels 2 we will have random generation, and we can put third argument for seed.
    } else if (atoi(argv[1]) == 2) {
        srand(time(NULL));
        rand_number = rand();
        accuracy = (rand_number / 3259.0 - (int)(rand_number / 3259)) / 3.0 + 1e-14;
    }
    // call function that fill array B
    begin = clock();
    for (i = 0; i < 500000; ++i) {
        exp = countExp(accuracy);
    }
    end = clock();
    time_spent = (double) (end - begin) / CLOCKS_PER_SEC;
    // if we put data from file we will have output to file
    if (argc > 1 && atoi(argv[1]) == 1) {
        if (argc >= 4) {
            output = fopen(argv[3], "w");
        } else {
            output = fopen("output.txt", "w");
        }
        if (!output) {
            return 1;
        }
        fprintf(output, "time spent: %lf sec\n", time_spent);
        fprintf(output, "exp = %lf \n", exp);
        fprintf(output, "accuracy = %lf \n", accuracy);
        return 0;
    }
    // if we have random input of input from console we will have output to console
    printf("time spent: %lf sec\n", time_spent);
    printf("exp = %.15lf \n", exp);
    printf("accuracy = %.15lf \n", accuracy);
    return 0;
}
