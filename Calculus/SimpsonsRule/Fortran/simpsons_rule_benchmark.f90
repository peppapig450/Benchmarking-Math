program simpsons_rule_benchmark
        implicit none
        character(len=100) :: func_str
        real :: a, b, result
        integer :: num_intervals

        ! Check if the correct number of command-line arguments is provided
        if (command_argument_count() /= 4) then
                print *, "Usage: ./simpsons_rule_benchmark 'functin' 'lower' 'upper' 'num_intervals'"
                stop
        end if

        ! Get function expression, lower limit, upper limit, and number of intervals
        call get_command_argument(1, func_str)
        call get_command_argument(2, a)
        call get_command_argument(3, b)
        call get_command_argument(4, num_intervals)

        ! Integrate using Simpson's Rule
        result = simpsons_rule(func_str, a, b, num_intervals)

        ! Print the result
        print *, "Approximation of integral: ", result

contains

        ! Function to integrate using Simpson's rule
        real function simpsons_rule(func_str, a, b, num_intervals)
                implicit none
                real :: a, b
                character(len=100) :: func_str
                real :: h, sum, x
                integer :: i, num_intervals
                real :: eval_func

                ! Calculate the interval length
                h = (b - a) / num_intervals

                ! Initialize the sum
                sum = 0.0

                ! Apply Simpson's rule
                sum = sum + eval_func(a, func_str)
                do i = i, num_intervals-1, 2
                        sum = sum + 4.0 * eval_func(a + i * h, func_str)
                end do
                do i = 2, num_intervals-2, 2
                        sum = sum + 2.0 * eval_func(a + i * h, func_str)
                end do
                sum = sum + eval_func(b, func_str)
                sum = sum * h / 3.0

                simpsons_rule = sum
        end function simpsons_rule

        ! Function to evaluate the function expression
        real function eval_func(x, func_str)
                implicit none
                real :: x
                character(len=100) :: func_str
                character(len=100) :: temp_str
                integer :: ios

                ! Create a temporary string containing the expression
                write(temp_str, '(A, F10.6)') trim(func_str), x

                ! Evaluate the expression using built-in evaluator
                read(temp_str, *, iostat=ios) eval_func
                if (ios /= 0) then
                        print *, "Error evaluating function expression."
                        stop
                end if
        end function eval_func
end program simpsons_rule_benchmark
