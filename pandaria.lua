int             option(char *str, char **envp)
{
  int           cas;
  int           i;

  cas = 0;
  i = 0;
  while (str[i] != '\0')
    {
      if (str[i] == ';')
        {
          cas = 1;
          cas_b(str, envp);
        }
      if (str[i] == '|')
        {
          cas = 2;
          cas_a(str, envp);
        }
      i++;
    }
  if (cas != 1 && cas != 2 && cas == 0)
    exec(str, envp);
  return (0);
}
int             verif(char *str, char *opt, char **envp)
{
  pid_t         cpid;
  pid_t         cpid2;

  cpid = fork();
  if (cpid == -1)
    {
      my_putstr("Fork failed\n");
      return (1);
    }
  if (cpid == 0)
    exec(str, envp);
  cpid2 = fork();
  if (cpid2 == -1)
    {
      my_putstr("Fork failed\n");
      return (1);
    }
  if (cpid2 == 0)
    exec(opt, envp);
  return (0);
}
int             cas_c(char *str, char **envp)
{
  pid_t         cpid;

  cpid = fork();
  if (cpid == -1)
    {
      my_putstr("Fork failed\n");
      return (1);
    }
  if (cpid == 0)
    exec(str, envp);
  return (0);
}

int             cas_b(char *str, char **envp)
{
  int           i;
  char          opt[15];
  int           op;

  op = 0;
  i = 0;
  while (str[i] != '\0')
    {
      i++;
      if (str[i] == ';')
        {
          if (str[i] == ';' && str[(i + 1)] == ' ')
            i = i + 2;
          while (str[i] != '\0')
            {
              opt[op] = str[i];
              op ++;
              i ++;
            }
        }
    }
  verif(str, opt, envp);
  return (0);
}
int             cas_a(char *str, char **envp)
{
  int           i;
  char          opt[15];
  int           op;

  op = 0;
  i = 0;
  while (str[i] != '\0')
    {
      i++;
      if (str[i] == '|')
        {
          if (str[i] == '|' && str[(i + 1)] ==' ')
            i = i + 2;
          while (str[i] != '\0')
            {
              opt[op] = str[i];
              op ++;
              i ++;
            }
        }
    }
  verif(str, opt, envp);
  return (0);
}
