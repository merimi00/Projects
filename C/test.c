/* malloc example: random string generator*/
#include <stdio.h>      /* printf, scanf, NULL */
#include <stdlib.h>     /* malloc, free, rand */

int f (int a){
  int i = 0; int tm =1; int sum = 1;
  while(sum<=a){
    i = i+1;
    tm = tm+2;
    sum = tm + sum;
  }
  return i;
}



int main ()
{
  /**
  int i,n;
  char * buffer;

  printf ("How long do you want the string? ");
  scanf ("%d", &i);

  buffer = (char*) malloc (i+1);
  if (buffer==NULL) exit (1);

  for (n=0; n<i; n++)
    buffer[n]=rand()%26+'a';
  buffer[i]='\0';

  printf ("Random string: %s\n",buffer);
  free (buffer);
**/
   f (0);
   f (1);
   f (2);
   f (3);
   f (4);
   f (5);
   f (6);

  return 0;
}
