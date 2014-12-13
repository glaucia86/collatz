#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) 
{
  
  unsigned long collatz(unsigned long n){
    // Iteration
    unsigned long count = 1;
    while (n > 1) {
    //  printf("%ld => %ld\n", count, n );
      if (n % 2 == 0){
        n = n / 2;
      } else {
        n =  (n*3) + 1;
      }
      count++;
    }
    return count;
  }
  

  
  //printf("%s \n\n",argv[1]);

  int max_range = atoi(argv[1]);


  int count = 1;

  unsigned long max_count = 0;
  unsigned long max_steps = 0;

  while(count < max_range){

      unsigned long steps = collatz(count);

      if( steps > max_steps ){
        max_count = count;
        max_steps = steps;
      }

      count++;
  }

  printf("%ld => %ld \n",max_count,max_steps );

  return 0;

}


      