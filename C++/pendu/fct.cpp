#include "fct.h"
#include<string>
#include<iostream>
using namespace std;


//renvoie une chaine d'etoile au lieu du mot
string star(string a){
    string sol;
    for(int i=0;i<a.size();i++){
        sol+='*';
    }
    return sol;
}

//verifie si la lettre est dans le mot
bool inc(string a,char letter){
    for(int i=0;i<a.size();i++){
        if(letter == a[i]){return true;}
    }
    return false;
}

//fait apparaitre une lettre correctement devinée
string apparaitre(string solutionEtoilee, char letter, string solution){

    for(int i = 0; i < solution.size(); i++){
        if(letter == solution[i]){
            solutionEtoilee[i] = letter;
        }
    }
    return solutionEtoilee;
}

