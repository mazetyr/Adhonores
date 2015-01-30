test
int             exec(char *str)
{
  char          *newav[] = { NULL };
  char          *newenviron[] = { NULL };
  int           val;

  newav[0] = str;
  val = execve(newav[0], newav, newenviron);
  if (val == -1)
    {
      my_putstr("Failed command\n");
      exit(EXIT_FAILURE);
    }
  return (0);
}
