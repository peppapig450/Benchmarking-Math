#include <stdio.h>
#include <stdlib.h>
#include <math.h>

double eval_func(double x, char* func_str) {
    double result;
    char temp_str[100];

    // Construct the expression with the value of X
    snprintf(temp_str, sizeof(temp_str), "%s %lf", func_str, x);

    // Evaluate the expression using sscanf
    sscanf(temp_str, "%lf", &result);

    return result;
}

double simpsons_rule(char* func_str, double a, double b, int num_intervals) {
    double h = (b - a) / num_intervals;
    double sum = 0.0;
    int i;

    sum += eval_func(a, func_str);
    for (i = 1; i < num_intervals; i++) {
        double x = a + i * h;
        sum += i % 2 == 0 ? 2 * eval_func(x, func_str) : 4 * eval_func(x, func_str);
    }
    sum += eval_func(b, func_str);

    return sum * h / 3.0;
}

int main(int argc, char *argv[]) {
    if (argc != 5) {
        printf("Usage: ./simpsons_rule_benchmark 'function' 'lower' 'upper' 'num_intervals'\n");
        return 1;
    }

    char *func_str = argv[1];
    double a = atof(argv[2]);
    double b = atof(argv[3]);
    int num_intervals = atoi(argv[4]);

    double result = simpsons_rule(func_str, a, b, num_intervals);

    printf("Approximation of integral: %lf\n", result);

    return 0;
}