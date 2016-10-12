def search1(a,b,k):
    values1 = range(3,k)
    for j in values1:
        if(a[j-1] > a[j]):
            a[j] = a[j-1]
            store = a[j]
        else:
            store = a[j]

    values2 = range(2,k)
    for j in values2:
        if(store == a[j]):
            print b[j], store
            break

#This code is intended to calculate the number of steps
#in a collatz chain for numbers below a specified value

k = 837000 #Starting value

pos = [1]*1000001 #Array for numbers being checked
col = [1]*1000001 #Array for number of steps in collatz chain

while(k < 838000):
    i = 1 #Initializer
    n = 1 + k #Initializer and Step for generating collatz chain
    #This loop finds the number of steps in the collatz chain
    while(n > 1):
        if( (n%2) == 0):
            n = n/2
        else:
            n = (3*n)+1

        i = i + 1 #Incrimenter
        
    k = k + 1 #Incrimenter
    pos[k] = k #Number being checked
    col[k] = i #Number of steps in collatz chain

search1(col,pos,k)
#print search2(col,k)


