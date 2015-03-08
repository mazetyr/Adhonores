void            prompt(int *a_t, int pow)
{	
  int           i;
  i = 0;
  while (a_t[i])
    {
      if (pow - 1 == 0)
	{
	  if (a_t[i] != 0)
	    printf("%d", a_t[i]);
	}
      else if (a_t[i] != 0)
        {
          if (pow == 1)
            {
              if (a_t[i + 1] > 0)
                printf("%dx + ", a_t[i]);
              else
                printf("%dx ", a_t[i]);
            }
          else
            {
              if (a_t[i + 1] > 0)
		printf("%dx^%d + ", a_t[i], pow - 1);
              else
                printf("%dx^%d ", a_t[i], pow - 1);
            }
        }
      i++;
      pow--;
    }
}
int		verif_env(char **env)
{
  int		i;
  int		flag;
  i = 0;
  flag = 0;
  while (env[i])
    if (strncmp("DISPLAY=", env[i++], 8) == 0)
      flag = 1;
  return (flag);
}
int		verif_string(char *str)
{
  int           i;
  int           pipe;
  i = 0;
  pipe = 0;
  while (str[i])
    {
      if ((str[i] >= '0' && str[i] <= '9') || str[i] == '-')
	i++;
      else if (str[i] == '|')
	{
	  if (((str[i + 1] >= '0' && str[i + 1] <= '9') ||		\
	       str[i + 1] == '-') && (str[i - 1] >= '0' && str[i - 1] <= '9'))
	    {
	      pipe++;
	      i++;
	    }
	  else
	    {
  printf("\033[01;31m Character n°%d is not correct !\n\033[0m ", i+1);
  exit(EXIT_FAILURE);
	}
      else
	{
  printf("\033[01;31m Character n°%d is not correct !\n\033[0m “, i+1);
  exit(EXIT_FAILURE);
    }
  return (pipe + 1);
}
#include	<sys/timeb.h>
#include	<time.h>
void		algo_horner(int *tab, int pow_nb)
{
  int		i;
  int		ret;
  double	stone;
  i = 0;
  ret = 0;
  stone = 0;
  while (stone <= 1000)
    {
      ret = 0;
      for (i = 0 ; i <= pow_nb ; i++)
	ret= stone * ret + tab[i];
      stone += 0.001;
    }
  usleep(4000);
void		algo_naif(int *tab, int pow_nb)
{
  int		i;
  int		ret;
  int		stock;
  double	stone;
  i = 0;
  stone = 0;
  while (stone <= 1000)
    {
      ret = 0;
      i = 0;
      stock = pow_nb;
      for (stock = pow_nb ; stock > 0 ; stock--)
	{
	  ret += tab[i] * puiss(stone, stock);
	  i++;
	}
      stone += 0.001;
    }
}
void		horner(int *tab, int pow)
{
  struct timeb	*t;
  int		time;
  time = 0;
  t = malloc(sizeof(struct timeb));
  printf("Méthode de Horner:\t");
  ftime(t);
  time = t->millitm;
  algo_horner(tab, pow);
  ftime(t);
  time = abs(time - t->millitm);
  printf("%d millisecondes\n", time);
}
void		naif(int *tab, int pow)
{
  struct timeb	*t;
  int		time;
  time = 0;
  t = malloc(sizeof(struct timeb));
  printf("Algorithme naïf:\t");
  ftime(t);
  time = t->millitm;
  algo_naif(tab, pow);
  ftime(t);
  time = abs(time - t->millitm);
  printf("%d millisecondes\n", time);
}
void		ex1(char *str)
{
  char		**tab;
  int		*tab_int;
  int		pow;
  if (str[0] == '\0')
      printf("\033[01;31m Format string non valid for string n°1. You must enter numbers\n\033[0m ");
  exit(EXIT_FAILURE)
  printf("\033[01;37m");
  printf("Evaluation du polynôme: ");
  pow = verif_string(str);
  tab = my_str_to_wordtab(str);
  tab_int = tab_int(tab, pow + 1);
  prompt(tab_int, pow);
  printf(" en 1.000.000 de points\n");
  naif(tab_int, pow);
  horner(tab_int, pow + 1);
  free(tab);
  printf("\033[0m");
}
void		opt2(int ac, char **av)
{
  char		**t1;
  char		**t2;
  int		*t_int;
  int		*t_int2;
  int		puis;
  int		puis2;
  int		i;
  i = 1;
  if (ac % 2 != 0)
    {
  printf("\033[01;31m You must enter a pair number of arguments. '%d' is not pair\n\033[0m ", ac);
  exit(EXIT_FAILURE);

  while (av[i])
    {
      if (av[i][0] == '\0')
	  printf("\033[01;31m Format string non valid for string n°%d. You must enter numbers\n\033[0m ", i);
  exit(EXIT_FAILURE)
      pow = verif_string(av[i]);
      tab = my_str_to_wordtab(av[i]);
      tab_int = reverse_tab(t1, puis + 1);
      i++;
      if (av[i][0] == '\0')
	  printf("\033[01;31m Format string non valid for string n°%d. You must enter numbers\n\033[0m ", i);
  exit(EXIT_FAILURE)
      pow2 = verif_string(av[i]);
  printf("\t\t");
  prompt(t_int, puis);
  printf("\n\n");
      tab2 = my_str_to_wordtab(av[i]);
      tab_int2 = reverse_tab(t2, puis2 + 1);
      i++;
  printf("\t\t");
  prompt(t_int2, puis2);
  printf("\n\n");
    }
}
int		main(int ac, char **av, char **env)
{
  if (verif_env(env) == 0)
{
  printf("\033[01;31m You disabled display environment. End of program !\n\033[0m ");
  exit(EXIT_FAILURE);
}
  if (ac < 2)
    {
  printf("\033[01;31m You must enter at least 1 argument !\n\033[0m ");
  exit(EXIT_FAILURE);
}
  else if (ac == 2)
    ex1(av[1]);
  else
    ex2(ac - 1, av);
  return (0);
}
int		puiss(int nb, int puiss)
{
  if (puiss == 0)
    return (1);
  else if (puiss < 0)
    return (0);
  else
    return (nb * puiss(nb, puiss - 1));
}
int		*tab_int(char **tab, int size)
{
  int		*tab2;
  int		i;
  i = 0;
  tab2 = malloc(size * sizeof(int));
  while (tab[i])
    {
      tab2[i] = atoi(tab[i]);
      i++;
    }
  return (tab2);
}
int		* reverse_tab (char **tab, int size)
{
  int		*t2;
  int		i;
  int		sa_size;
  s_size = size;
  i = 0;
  tab2 = malloc(size * sizeof(int));
  while (i < s_size - 1)
    {
      t2[i] = atoi(tab[size - 2]);
      i++;
      size--;
    }
  return (t2);
}
#ifndef		TRANSFERT_H_
# define	TRANSFERT_H_
# include	<math.h>
# include	<sys/types.h>
# include	<sys/wait.h>
# include	<stdlib.h>
# include	<unistd.h>
# include	<stdio.h>
# include	<string.h>
char		**my_str_to_wordtab(char *);
int		* tab_int(char **, int);
int		*reverse_tab(char **, int);
int		verif_env(char **);
int		verif_string(char *);
int		puiss(int, int);
void		opt1(char *);
void		opt2(int, char **);
void		prompt(int *, int);
#endif		/* !TRANSFERT_H_ */
