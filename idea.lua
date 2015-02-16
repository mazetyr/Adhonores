On stock les allum dans une liste chaînée,
On modifie avec les termcaps pour read sans appuyer sur entrer
Une fois cela fait on peut se déplace sur les allum,
On clique sur entrer pour supprimé une allum puis on return au code les allum restante et l'ia joue
Ect ect
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int     main()
{
  char  *menu;
  char  *alum;
  char  *str;

  menu = " !! Bienvenue dans le Jeu des Allumettes !!\n\n Pour pouvoir jouer, déplacez-vous avec vos touches et appuyer sur entrer pour retirer des allumettes\n\n";
  alum = " | \n || \n ||| \n |||| \n";
  printf("%s", menu);
  printf("%s", alum);
  static char   buffer[500];
  int   i;
  int   k;

  i = 0;
  str = malloc(500 * sizeof(char));
  k = read (0, buffer, 500);
  if (k == 0)
    return (1);
  while (buffer[i] != '\0')
    {
      str[i] = buffer[i];
      i = i + 1;
    }
  str[i] = '\0';
  printf("%s", str);
}

/*                                                                                                                                                                                            
** Si read retourne 0 (on lui envoye une touche)                                                                                                                                              
** On check quelle touche et taper si c'est l'une des quatres flêches, on se déplace                                                                                                          
** Si on envoye "entrer" à read, elle retour une valeur différente,                                                                                                                           
** Si c'est le cas on remove le char ciblé                                                                                                                                                    
*/
