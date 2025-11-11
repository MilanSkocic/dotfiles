program post
    integer :: STATUS 
    character(len=:), allocatable :: cmd, pkg, apt
    
    apt = "sudo apt install "
    pkg = " gcc gfortran "

    call system(apt//pkg, STATUS)
    if (STATUS /= 0) then
        print *, "apt failed."
    end if
end program
