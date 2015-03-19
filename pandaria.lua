#include <unistd.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

int     main(int ac, char **av)
{
  int   pid;

  if (ac != 3)
    {
      my_putstr("Program need 2 Arguments\n");
      return (1);
    }
  pid = my_get_nbr(av[1]);
  if (pid < 1)
    {
      my_putstr("Pid can't be egal to 0\n");
      return (1);
    }
  my_putstr("Server Pid : ");
  my_put_nbr(get_pid());
  my_putchar('\n');
  pipe();
}

int     pipe()
{
  int   pipefd[2];
  int   error;
  int   pid;
  int   buff[512];
  int   len;

  error = pipe(pipefd);
  if (error == -1)
    {
      write(2, "error on pipe\n", strlen("error on pipe\n"));
      return (1);
    }
  if ((pid = fork()) == -1)
    {
      write(2, "error on fork\n", strlen("error on fork\n"));
      return (1);
    }
  if (pid == 0)
    {
      // Client Part //                                                                                                                                                                       
      // Ajout d'un read pour lire ce que le client écrit //                                                                                                                                  
      close(pipefd[0]);
      write(pipefd[1], "Bonjour!", 8);
    }
  else
    {
      // Server Part //                                                                                                                                                                       
      close(pipefd[1]);
      len = read(pipefd[0], buff, 511);
      if (len == -1)
        {
          write(2, "error on read\n", strlen("error on read\n"));
          return (1);
        }
      buff[len] = '\0';
      write(1, buff, len);
    }
  return (0);
}

int     client()
{
  // Envoie un sign au serveur //                                                                                                                                                             
  // Ajout de la partie client part //                                                                                                                                                        
  // Envoie d'un signal kill au server //                                                                                                                                                     
  // Fin //                                                                                                                                                                                   
  return (0);
}

int     server()
{
  // Donne sont Pid //                                                                                                                                                                        
  // Attend le signal du client //                                                                                                                                                            
  // Ajout de la partie serveur part //                                                                                                                                                       
  // Si reception d'un signal kill -> Reboucle inf //                                                                                                                                         
  // Fin //                                                                                                                                                                                   
  return (0);
}
