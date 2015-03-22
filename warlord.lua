void            serv_aff(int mess)
{
  static int    conpt;
  static char   m_mess;

  if (conpt > 7)
    {
      if (m_mess == '\0')
        my_putchar('\n');
      else
        my_putchar(m_mess);
      m_mess = 0;
      conpt = 0;
    }
  m_mess = m_mess + (mess << conpt);
  conpt++;
}

void            serv_start(int sign)
{
  if (sign == SIGUSR1)
    serv_aff(1);
  if (sign == SIGUSR2)
    serv_aff(0);
}

int             main()
{
  my_putstr("\033[33mServer Pid : \033[0m");
  my_put_nbr(getpid());
  my_putstr("\n\n\033[2mWaiting client messages\n\n\033[0m");
  if (signal(SIGUSR1, serv_start) == SIG_ERR)
    {
      my_putstr(FAIL_SIGN);
      exit(1);
    }
  if (signal(SIGUSR2, serv_start) == SIG_ERR)
    {
      my_putstr(FAIL_SIGN);
      exit(1);
    }
  while (42)
    {
    }
  return (0);
}
