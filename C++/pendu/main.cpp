#include <iostream>
#include <string>
#include "fct.h"
using namespace std;

int main()
{
    cout << "Bienvenue dans le pendu!" << endl;

    //les varibles globales
    string solution = "pendu";
    char letter;
    string solutionEtoilee = star(solution);
    int coup = 5;

    for( int i = coup; i>0; i-- ){

        cout << "Devinez ce mot, "<< solutionEtoilee << "\n Il vous reste " << i <<" coup a jouer \n"<<endl;

        cout<< "Proposez une lettre : ";
        cin>>letter;

        if( inc(solution,letter) ){ i++; }

        solutionEtoilee = apparaitre(solutionEtoilee,letter,solution);

        cout << solutionEtoilee <<endl;

        if(solution == solutionEtoilee){
            cout<< "Bravo! Vous avez gagné!" <<endl;
            i = 1;
       }else if(i == 1){
           cout << "dommage, vous n'avez pas trouve le mot \n   "<< solution <<endl;
           }
    }

    return 0;
}


