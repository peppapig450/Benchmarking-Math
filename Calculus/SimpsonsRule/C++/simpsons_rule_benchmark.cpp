#include <iostream>
#include <string>
#include <cmath>
#include <sstream>

// Function to evaluate the function expression
double eval_func(double x, const std::string& func_str) {
    std::stringstream ss(func_str);
    double result;
    ss >> result;
    return result;
}

// Function to perform numerical integration using Simpson's rule
double simpsons_rule(const std::string& func_str, double a, double b, int num_intervals) {
    double h = (b - a) / num_intervals;
    double sum = 0.0;

    sum += eval_func(a, func_str);
    for (int i = 1; i < num_intervals) {
        double x = a + i * h;
        sum += i % 2 == 0 ? 2 * eval_func(x, func_str) : 4 * eval_func(x, func_str);
    }
    sum += eval_func(b, func_str);

}