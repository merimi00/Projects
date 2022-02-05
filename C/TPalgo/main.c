#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdbool.h>

//main partie 1
int main()
{
    /***question 1: e = ∑∞n=0 1/n!***/

    printf("fact_div de 7: %f\n" , fact_div(7));//2.718254
    printf("fact_div de 5: %f\n" , fact_div(5));//2.716667
    printf("fact_div de 2: %f\n" , fact_div(2));//2.500000
    printf("fact_div de 1: %f\n" , fact_div(1));//2.000000
    printf("fact_div de 0: %f\n" , fact_div(0));//1.000000

    int test = 30000;
    printf("fact_divT de %d: %f\n" , test, fact_divT(test));
    printf("fact_div de %d: %f\n" , test, fact_div(test));

    /***question 2***/ //calculer (1 + 10^-k )^(10^k)/
    printf("puissanceI(-3,5.0): %f\n" , puissanceI(-3,5.0));
    printf(" puissanceR(-3,5.0): %f\n" , puissanceR(-3,5.0));
    printf(" puissanceR2(-5,5.0): %f\n" , puissanceR2(-3,5.0));
    printf(" puissanceRT(-3,5.0): %f\n" , puissanceRT(-3,5.0));

    int k = 6;
    printf("k = %d; 10^k = %f \n", k, puissanceI(k,10));

    //printf("(1 + 10^-k )^(10^k) iterative: %f\n" , puissanceI(puissanceI(k,10),1.0+puissanceI(-k,10)));
    //printf("(1 + 10^-k )^(10^k) recursive: %f\n" , puissanceR(puissanceR(k,10),1+puissanceR(-k,10)));
    printf("(1 + 10^-k )^(10^k) recursive p=2n: %f\n" , puissanceR2(puissanceR2(k,10),1.0+puissanceR2(-k,10)));
    //printf("(1 + 10^-k )^(10^k) recursive terminale: %f\n" , puissanceRT(puissanceRT(k,10),1.0+puissanceRT(-k,10)));

    clock_t begin = clock();
    printf("(1 + 10^-k )^(10^k) recursive p=2n: %f\n" , puissanceR2(puissanceR2(k,10),1.0+puissanceR2(-k,10)));
    clock_t end = clock();
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
    printf("time: %f\n", time_spent);

    /***question 3***/ //Ackermann

    printf("Ack(0,0): %d\n; Ack(1,0): %d\n; Ack(2,0): %d\n; Ack(3,0): %d\n; Ack(4,0): %d\n; Ack(5,0): %d\n" ,
            Ack(0,0), Ack(1,0),Ack(2,0),Ack(3,0),Ack(4,0), Ack(5,0));//6 secondes

    printf("Ackrec(0,0): %d\n; Ackrec(1,0): %d\n; Ackrec(2,0): %d\n; Ackrec(3,0): %d\n; Ackrec(4,0): %d\n" ,
           Ackrec(0,0), Ackrec(1,0),Ackrec(2,0),Ackrec(3,0),Ackrec(4,0)); //6 secondes mais sans m=5

    printf("Ack(2,3): %d; Ackrec(2,3): %d\n" , Ack(2,3), Ackrec(2,3));
    printf("Ack(3,4): %d; Ackrec(3,4): %d\n" , Ack(3,4), Ackrec(3,4));


    /***question 4***/

     printf("suiteXrec(0): %f\n" , suiteXrec(0));
     printf("suiteXrec(1): %f\n" , suiteXrec(1));
     printf("suiteXrec(2): %f\n" , suiteXrec(2));
     printf("suiteXrec(3): %f\n" , suiteXrec(3));
     printf("suiteXrec(5): %f\n" , suiteXrec(5));
     printf("suiteXrec(10): %f\n" , suiteXrec(10));
     printf("suiteXrec(50): %f\n" , suiteX(50));
     printf("suiteXrec(100): %f\n" , suiteX(100));



    return 0;
}



//main partie 2
/*
void poup (Liste l)
{
        printf("Double Affichage \n") ;
        affiche_rec(l) ;
        affiche_iter(l) ;

        printf("Longueur en double %d %d \n\n",
                           longueur_rec(l),
                           longueur_iter(l)
               ) ;
}

int main(int argc, char** argv)
{
    Liste l ;

        initVide (&l) ;

          poup(l) ;

             empile(4, &l) ;

          poup(l) ;

             empile(5, &l) ;
             empile(6, &l) ;
             empile(7, &l) ;
             empile(8, &l) ;
             empile(9, &l) ;

          poup(l) ;

        VireDernier_rec  (&l) ;
        VireDernier_iter (&l) ;
        depile(& l) ;

          poup(l) ;

    VideListe(&l);
    return 0;
}
*/


//main partie 2
