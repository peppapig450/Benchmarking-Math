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
  # Run hyperfine benchmark for the Fortran program with the current function
  # hyperfine --warmup 5 --runs 10 "./simpsons_rule \"$func\" 0 1 100000"
  echo "Evaluating ${func}" 
  ./simpsons_rule "${func}" 2 20 100000
done

