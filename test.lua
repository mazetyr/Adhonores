#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "allum.h"
#include "my.h"

#define IA (0)
#define PLAYER (1)

void    result(int player)
{
  int   nb_ligne;

  nb_ligne = 0;
  if (nb_ligne == 1)
    {
      if (player == IA)
        {
          my_putstr("\033[1;31m\n\n YOU WIN !!!!\033[0m");
          exit(0);
        }
      else if (player == PLAYER)
        {
          my_putstr("\033[1;31m\n\n YOU LOOSE !!!!\033[0m");
          exit(0);
        }
    }
}

void    aff(char **str, int nb)
{
  int   i;

  i = 0;
  while (i != nb)
    {
      my_putstr(str[i]);
      i++;
    }
}

int     count(char **alu)
{
  int   i;
  int   nb_alu;
  int   ligne;

  nb_alu = 0;
  i = 0;
  ligne = 0;
  while (alu[ligne][i] != '\n' && ligne != 4)
    {
      if (alu[ligne][i] == '|')
        nb_alu++;
      i++;
      if (alu[ligne][i] == '\n')
        {
          my_put_nbr(nb_alu);
          my_putchar('\n');
          ligne++;
          i = 0;
        }
    }
  return (nb_alu);
}

int     ia_turn(char **alu)
{
  int   nb_alu;
  int   alu_ia;

  result(IA);
  nb_alu = count(alu);
  alu_ia = nb_alu % 4;
  alu[alu_ia] = "\n";
  my_putstr("\n\nordi turn:\n");
  aff(alu, 4);
  return (0);
}

int jeux()
{
  char *alu[4];
  char *str;
  int k;

  alu[0] = "   |\n";
  alu[1] = "  |||\n";
  alu[2] = " |||||\n";
  alu[3] = "|||||||\n";
  aff(menu, 5);
  aff(alu, 4);
  while (42)
    {
      result(PLAYER);
      my_putstr("\nVeuillez choisir une ligne : ");
      str = malloc(500 * sizeof(char));
      k = read (0, str, 500);
      if (k == 0)
        return (1);
      my_putstr("Vous avez choisi la ligne : ");
      my_put_nbr((str[0] - 49));
      my_putstr("\n\n");
      alu[(str[0] - 49)] = "\n";
      aff(alu, 4);
      ia_turn(alu);
    }
}

int main()
{
  char *menu[5];

  menu[0] = "\033[1;33m !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\033[0m\n";
  menu[1] = "\033[1;33m !! \033[0m\033[1;35mBienvenue dans le Jeu des Allumettes \033[0m\033[1;33m!!\033[0m\n";
  menu[2] = "\033[1;33m !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\033[0m\n";
  menu[3] = "\033[1;31m\n\n Règles :\033[1m\n\n Indiquer la ligne puis le nombre d'allumettes que vous souhaitez enlever.\n\n";
  menu[4] = "\033[1;37m\n Bonne Chance et Bon Jeu \033[0m\n\n";
  jeux();
}
