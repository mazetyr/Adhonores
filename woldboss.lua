#include <unistd.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include "all.h"
#include <assert.h>

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

int mini(char **envp)
{
  char *str;
  static char buffer[BUFFER_SIZE];
  int i;
  int k;
  int j;
  char *bin;

  i = 0;
  j = 0;
  my_putstr("$>");
  str = malloc(BUFFER_SIZE * sizeof(char));
  bin  = "/bin/";
  k = read (0, buffer, BUFFER_SIZE);
  if (k == 0)
    return (1);
  while (j != 5)                                                                                                                                                                          
    {                                                                                                                                                                                         
      str[j] = bin[j];                                                                                                                                                                        
      j++;                                                                                                                                                                                    
      }
  while (buffer[i] != '\0')
    {
      str[j] = buffer[i];
      i = i + 1;
      j++;
    }
  str[j] = '\0';                                                                                                                                                                            
  printf("%s", str);
  my_exec(str, envp);
  free(str);
  mini(envp);
  return (0);
}
