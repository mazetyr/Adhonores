
#include "client.h"

void    my_down(int pid, char msg)
{
  char  c;

  c = 0;
  while (c < 8)
    {
      usleep(100);
      if (((msg >> c) & 1) == 1)
        {
          if (kill(pid, SIGUSR1) == -1)
            my_wfail(FAIL_KILL);
        }
      else
        {
          if (kill(pid, SIGUSR2) == -1)
            my_wfail(FAIL_KILL);
        }
      c++;
    }
}

void    my_client(char **av)
{
  int   i;
  char  *str;

  str = av[2];
  i = 0;
  while (str[i] != '\0')
    {
      my_down(my_getnbr(av[1]), str[i]);
      i++;
    }
  my_down(my_getnbr(av[1]), str[i]);
}

void    check_sign(int sign)
{
  int   sign2;

  sign2 = sign;
  if (sign2 == 0)
    exit(EXIT_FAILURE);
}

int     main(int ac, char **av)
{
  if (ac == 3)
    {
      if (signal(SIGUSR1, check_sign) == SIG_ERR)
        my_wfail(FAIL_SIGN);
      if (signal(SIGUSR2, check_sign) == SIG_ERR)
        my_wfail(FAIL_SIGN);
      my_client(av);
    }
  else
    my_wfail(FAIL_AC);
  return (0);
}

#include "serv.h"

void            my_aff(int k)
{
  int           c;
  static int    i;

  c = 0;
  if (c > -1)
    {
      c += (k << i);
      i++;
    }
  if (i > 7)
    {
      if (c == '\0')
        my_putchar('\n');
      else
        my_putchar(c);
      c = 0;
      i = 0;
    }
}

void    check_sign()
{
  int   sign;

  sign = 0;
  if (sign == SIGUSR1)
    my_aff(1);
  if (sign == SIGUSR2)
    my_aff(0);
}

void    my_signal()
{
  if (signal(SIGUSR1, check_sign) == SIG_ERR)
    my_wfail(FAIL_SIGN);
  if (signal(SIGUSR2, check_sign) == SIG_ERR)
    my_wfail(FAIL_SIGN);
}

int     main(int ac, char **av)
{
  if (ac == 1)
    {
      my_signal();
      my_putstr(SERV_PID);
      my_put_nbr(getpid());
      my_putchar('\n');
    }
  if (av != NULL);
  else
    my_wfail(FAIL_AC);
  while (1)
    check_sign();
}

void    my_w_fail(char c)
{
  write(2, &c, 1);
}

void    my_wfail(char *str)
{
  int   i;

  i = 0;
  while (str[i] != '\0' && str != NULL)
    {
      my_w_fail(str[i]);
      i++;
    }
  exit(EXIT_FAILURE);
}

