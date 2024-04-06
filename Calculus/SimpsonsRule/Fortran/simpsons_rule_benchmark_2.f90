program simpsons_rule_benchmark
    implicit none
    character(len=100) :: func_str, a_str, b_str, n_str
    real :: a, b, result
    integer :: num_intervals

    ! Check if the correct number of command-line arguments is provided
    if (command_argument_count() /= 4) then
        print *, "Usage: ./simpsons_rule_benchmark 'function' 'lower' 'upper' 'num_intervals'"
        stop
    end if

    ! Get function expression, lower limit, upper limit, and number of intervals
    call get_command_argument(1, func_str)
    call get_command_argument(2, a_str)
    call get_command_argument(3, b_str)
    call get_command_argument(4, n_str)

    ! Convert strings to numbers
    read(a_str, *) a
    read(b_str, *) b
    read(n_str, *) num_intervals

    ! Integrate using Simpson's Rule
    result = simpsons_rule(func_str, a, b, num_intervals)

    ! Print the result
    print *, "Approximation of integral: ", result

contains

    ! Function to evaluate the function expression
    real function eval_func(x, func_str)
        implicit none
        real :: x
        character(len=100) :: func_str
        real :: result

        ! Parse and evaluate the function expression
        read(func_str, *) result
        result = result(x)

        eval_func = result
    end function eval_func

    ! Function to integrate using Simpson's rule
    real function simpsons_rule(func_str, a, b, num_intervals)
        implicit none
        real :: a, b
        character(len=100) :: func_str
        integer :: num_intervals
        real :: h, sum
        real :: x

        ! Calculate the interval length
        h = (b - a) / num_intervals

        ! Initialize the sum
        sum = 0.0

        ! Apply Simpson's rule
        sum = sum + eval_func(a, func_str)
        do x = a + h, b - h, h
                sum = sum + 4.0 * eval_func(x, func_str)
        end do
        sum = sum + eval_func(b, func_str)
        sum = sum * h / 3.0

        simpsons_rule = sum
    end function simpsons_rule

end program simpsons_rule_benchmark

