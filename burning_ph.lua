int     xor(void *param)
{
  int   a;
  int   b;
  int   result;

  if (a == 0)
    {
      if (b == 0)
        0;
      if (b == 0)
        1;
    }
  if (a == 1)
    {
      if (b == 1)
        0;
      if (b == 0)
        1;
    }
  return ();
}

int     chiffrement()
{
  64b / 4;
  G = 16;
  D = 2 16;

  D1 = G0 xor D0;
  G1 = D0;
  G2 = D1:
  D2 = G1 xor D1;
  Gn = Dn


}

int     main(int ac, char **av)
{
  char  *str;

  if (ac < 2)
    {
      printf("Failed : Argument manquant\n");
  str = av[1];
  if (str[0] == '-')
    {
      if (str[1] == 'e')
        printf("Chiffrement\n");
      if (str[1] == 'd')
        printf("Déchiffrement\n");
      if (str[1] == 'f')
        printf("Fichier source est : %s\n", av[2]);
      if (str[1] == 'o')
        printf("Fichier contenant le resultat de l'opération est : %s\n", av[2]);
      if (str[1] == 'k')
        printf("La clé est le fichier : %s\n", av[2]);
    }
  return (0);
}
