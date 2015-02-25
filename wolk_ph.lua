#include <unistd.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <stdio.h>
#include <assert.h>
#include "my.h"
#include "all.h"

extern char     **environ;

int             exec(char *str, char **envp)
{
  char          **new;
  int           val;

  new = my_str_to_wordtab(str);
  val = execve(new[0], new, envp);
  if (val == -1)
    {
      my_putstr("Command not found\n");
    }
  return (0);
}

int             option(char *str, char **envp)
{
  pid_t         cpid;

  cpid = fork();
  if (cpid == -1)
    {
      my_putstr("Fork failed\n");
      return (1);
    }
  if (cpid == 0)
    {
      exec(str, envp);
    }
  return (0);
}

int             minishell()
{
  char          *str;
  static char   buffer[BUFFER_SIZE];
  int           i;
  int           k;
  char          *bin;
  int           j;

  i = 0;
  j = 0;
  bin = "/bin/";
  my_putstr("$>");
  str = malloc(BUFFER_SIZE * sizeof(char));
  k = read (0, buffer, BUFFER_SIZE);
  if (k == 0)
    return (1);
  while (j != 5)
    {
      str[j] = bin[j];
      j ++;
    }
  while (buffer[i] != '\0')
    {
      str[j] = buffer[i];
      i = i + 1;
      j = j + 1;
    }
  str[j] = '\0';
  option(str, environ);
  minishell();
  return (0);
}

int             main()
{
  minishell();
  return (0);
}
