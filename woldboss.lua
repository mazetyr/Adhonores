#include <unistd.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include "all.h"
#include "my.h"

int     exec(char *str)
{
  char  *av[] = {NULL};
  char  *envp[] = {NULL};
  int   ret;

  av[0] = str;
  ret = execve(av[0], av, envp);
  if (ret == -1)
    my_putstr("Command fail\n");
  return (0);
}

int     mini()
{
  char  *str;
  static char buffer[BUFFER_SIZE];
  int   i;
  int   k;
  int   j;

  i = 0;
  j = 5;
  my_putstr("$>");
  str = malloc(BUFFER_SIZE * sizeof(char));
  k = read (0, buffer, BUFFER_SIZE);
  if (k == 0)
    return (1);
  str = "/bin/";
  while (buffer[i] != '\0')
    {
      str[j] = buffer[i];
      i = i + 1;
      j++;
    }
  str[j] = '\0';
  exec(str);
  free(str);
  mini();
  return (0);
}

int main()
{
  mini();
  return (0);
}
