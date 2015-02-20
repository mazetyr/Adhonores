#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int     main()
{
  char  *menu[5];
  char  *alu[4];
  char  *str;
  int   c;
  int   z;
  static char buffer[500];
  int   i;
  int   k;

  z = 0;
  menu[0] = "\033[1;33m !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\033[0m\n";
  menu[1] = "\033[1;33m !! \033[0m\033[1;35mBienvenue dans le Jeu des Allumettes \033[0m\033[1;33m!!\033[0m\n";
  menu[2] = "\033[1;33m !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\033[0m\n";
  menu[3] = "\033[1;31m\n\n Règles :\033[1m\n\n Afin de vous déplacer utilisez les touches z et s. Pour supprimer une allumette appuyer sur entrer.\n\n";
  menu[4] = "\033[1;37m\n Bonne Chance et Bon Jeu \033[0m\n\n";
  alu[0] = "    |    ";
  alu[1] = "   |||   ";
  alu[2] = "  |||||  ";
  alu[3] = " ||||||| ";
  while (z < 5)
    {
      my_putstr(menu[z]);
      z++;
    }
  z = 0;
  while (z < 4)
    {
      my_putstr(alu[z]);
      my_putchar('\n');
      z ++;
    }
  i = 0;
  my_putstr("\nVeuillez choisir une ligne : ");
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
  c = 0;
  my_putstr("Vous avez choisi la ligne : ");
  my_put_nbr((str[0] - 48));
  my_putstr("\n\n");
  while (c < 4)
    {
      if (c == (str[0] - 48))
          alu[c] = "";
      my_putstr(alu[c]);
      my_putchar('\n');
      c++;
    }
}
