'''
 le jeu du pendu 
'''
#renvoie une chaine d'etoile au lieu du mot
def star(a):
        sol = ''
        i = 0
        while (i<len(a)):
            sol += '*'
            i+=1
        return sol

#verifie si la lettre est dans le mot        
def inc(a,letter):
    if(a in letter): return True
    return False
    '''i=0 while (i<len(a)):if(letter == a[i]): return True i+=1 return False'''

#//fait apparaitre une lettre correctement devinée
def apparaitre(solutionEtoilee, letter, solution):
        i = 0
        listofreturn = []
        res = ""
        while (i < len(solution)):
            if(letter == solution[i]):
                listofreturn += solution[i]
            else: 
                listofreturn += solutionEtoilee[i]
            i+=1 
        
        return res.join(listofreturn)


if __name__ == '__main__':

    print("Bienvenue dans le pendu! \n")

    #les varibles globales
    solution = "sandwitch"
    #letter = ''
    solutionEtoilee = star(solution)
    coup = 5


    i = coup
    while (i>0):

        print("Devinez ce mot, ", solutionEtoilee, "\nIl vous reste ", i, " coup a jouer\n")
        letter = input("Proposez une lettre: ")

        if(letter in solution):
             i+=1

        solutionEtoilee = apparaitre(solutionEtoilee,letter,solution)

        print(solutionEtoilee, "\n") 

        if(solution == solutionEtoilee):
            print("Bravo! Vous avez gagné!\n")
            i = 1
        elif(i == 1):
            print("dommage, vous n'avez pas trouve le mot \n ", solution)

        i-=1   
