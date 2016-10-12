program problem13
  implicit none

!This program is designed to find the largest number
!with the most collatz steps that is less than 
!1,000,000

  integer*8 :: i,j,k,n,m, store1, store2
  integer*8, dimension(1000000) :: col, pos

  real :: start, end

!This starts the time counter to see how lomg
!it will take for the program to terminate
  call cpu_time(start)

  k = 800000
  n = 1

1  n = n + k

!This loop is where the collatz sequence for each
!number is defined
  do while(k.lt.1000000)

     i = 1

     do while(n.gt.1)

!This is the collatz definition        
        if(mod(n,2).eq.0)then
           n = n/2
        else
           n = (3*n) + 1
        end if
        
        i = i + 1
        
     end do

!Element assignment for each sequence
     k = k + 1
     pos(k) = k !Stores the number being analized
     col(k) = i !Stores the number of elements in the sequence

     goto 1 !Ensures that the loop exicutes correctly

  end do

!This is loop is used to find the largest number with
!the largest sequence 
  do i = 3, k

     if(col(i-1).gt.col(i))then
        col(i) = col(i-1)
        store1 = col(i)
     else
        store1 = col(i)
     end if

  end do

!This loop ensures that the largest number with
!the largest sequence was found and has the 
!relevent information printed out to the screen
  do i = 2, k
     if(store1.eq.col(i))then
        write(*,*)pos(i),store1
        call cpu_time(end) !stop the timer
        write(*,*)'Time to exicute = ',end-start
!Program needs to be told to stop when the desired
!result is found
        stop'IN THE NAME OF LOVE' !I was bored
     end if
  end do

end program problem13
