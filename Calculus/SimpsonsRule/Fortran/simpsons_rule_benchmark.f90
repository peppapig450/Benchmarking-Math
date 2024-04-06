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



