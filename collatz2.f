      implicit none
      
      integer*8 i,j,k,n,m,store1,store2
      integer*8 col(1000000),pos(1000000)
      real start,finish

      call cpu_time(start)

      k=836000
      n=1

 1    n=n+k

      do while(k.lt.838000)
         i=1
         do while(n.gt.1)
            if(mod(n,2).eq.0)then
               n=n/2
            else
               n=(3*n)+1
            end if
            i=i+1
         end do
         k=k+1
         pos(k)=k
         col(k)=i
         goto 1
      end do

      do i=3,k
         if(col(i-1).gt.col(i))then
            col(i)=col(i-1)
            store1=col(i)
         else
            store1=col(i)
         end if
      end do

      do i=2,k
         if(store1.eq.col(i))then
            write(*,*)pos(i),store1
            call cpu_time(finish)
            write(*,*)'Time to exicute= ',(finish-start)*1000,'ms'
            stop'IN THE NAME OF LOVE'
         end if
      end do

      end
