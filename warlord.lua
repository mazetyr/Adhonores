void    my_aff(char *buff)
{
  int   i;
  int   power;
  char  c;

  i = 0;
  c = 0;
  power = 7;
  while (i < 8)
    c = c + (buff[i++] * my_power_rec(2, power--));
  my_putchar(c);
}

void    serv_start(int sign)
{
  static int    i;
  static char   buff[8];

  if (sign == SIGUSR1)
    {
      buff[i++] = 0;
    }
  if (sign == SIGUSR2)
    {
      buff[i++] = 1;
    }
  if (i == 8)
    {
      my_aff(buff);
      i = 0;
      while (i < 7)
        buff[i++] = 0;
      i = 0;
    }
}

void    serv_standby()
{
  while (1)
    {
      usleep(1000);
      signal(SIGUSR1, serv_start);
      signal(SIGUSR2, serv_start);
    }
}
void    my_signal()
{
  if (signal(SIGUSR1, serv_standby) == SIG_ERR)
    my_wfail(FAIL_SIGN);
  if (signal(SIGUSR2, serv_standby) == SIG_ERR)
    my_wfail(FAIL_SIGN);
}

int     main(int ac, char **av)
{
  if (ac == 1)
    {
      my_signal();
      my_putstr("\033[33mServer Pid : \033[0m");
      my_put_nbr(getpid());
      my_putstr("\n\n\033[2mWaiting client messages\n\n\033[0m");
    }
  if (av != NULL);
  else
    my_wfail(FAIL_AC);
  serv_standby();
  return (0);
}
