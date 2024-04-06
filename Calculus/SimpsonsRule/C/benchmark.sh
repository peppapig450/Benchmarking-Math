#!/bin/bash

# List of functions to integrate
functions=(
  "sin(x^3)"
  "cos(2*pi*x) + sin(3*pi*x)"
  "tan(x)"
  "exp(x) * cos(x)"
  "1 / (1 + exp(-2*x))"
  "abs(x - 0.5)"
  "sqrt(abs(x - 0.75))"
)

# Loop through each function in the list
for func in "${functions[@]}"; do
  # Run hyperfine benchmark for each program with the current function
  hyperfine --warmup 3 --runs 10 \
    './simpsons_rule "$func" 0 1 100000' \
    './simpsons_rule_fast_math "$func" 0 1 100000' \
    './simpsons_rule_o2 "$func" 0 1 100000'
done
