int             message_bin(int pid, char charactere)
{
  int           i;

  i = 0;
  while (i < 8)
    {
      usleep(100000);
      if (charactere % 2 == 0)
        kill(pid, SIGUSR1);
      else
        kill(pid, SIGUSR2);
      i++;
      charactere = charactere / 2;
    }
}

void            message(int pid, char *str)
{
  int           i;

  i = 0;
  my_putstr(str);
  while (str[i] != '\0')
    {
      message_bin(pid, str[i]);
      i++;
    }
}

int             main(int ac, char **av)
{
  int           pid;

  if (ac != 3)
    {
      my_putstr("Program needs 2 args\n");
      exit(0);
    }
  pid = my_getnbr(av[1]);
  if (pid <= 0)
    {
      my_putstr("PID needs to be strict sup to 0\n");
      exit(0);
    }
  message(pid, av[2]);
  return (0);
}
