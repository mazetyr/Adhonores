void            aff_message(int k)
{
  static int    i;
  static char   c;

  if (i > 7)
    {
      if (c == '\0')
        my_putchar('\n');
      else
        my_putchar(c);
      c = 0;
      i = 0;
    }
  c += k << i;
  i++;
}

void            recep_message(int sign)
{
   if (sign == SIGUSR1)
    aff_message(1);
   if (sign == SIGUSR2)
     aff_message(0);
}

int             main()
{
  my_putstr("Serveur PID : ");
  my_put_nbr(getpid());
  my_putchar('\n');
  if (signal(SIGUSR1, recep_message) == SIG_ERR)
    {
      my_putstr("Error of signal SIGUSR1\n");
      exit(1);
    }
  if (signal(SIGUSR2, recep_message) == SIG_ERR)
    {
      my_putstr("Error of signal SIGUSR2\n");
      exit(1);
    }
  while (42)
    {
    }
  return (0);
}
