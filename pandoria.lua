#include <mlx.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <unistd.h>
#include "rtv1.h"

void                    my_pixel_put_to_image(int img_color,t_ptr *t_ptr, int x, int y)
{
  unsigned char         color1;
  unsigned char         color2;
  unsigned char         color3;

  color1 = (img_color & 0xFF0000) >> 16;
  color2 = (img_color & 0xFF00) >> 8;
  color3 = (img_color & 0xFF);
  t_ptr->data[y * t_ptr->sizeline + x * t_ptr->bpp / 8 ] = color1;
  t_ptr->data[y * t_ptr->sizeline + x * t_ptr->bpp / 8 + 1] = color2;
  t_ptr->data[y * t_ptr->sizeline + x * t_ptr->bpp / 8 + 2] = color3;
}

int     calc(t_ptr *t_ptr, t_vec *t_vec)
{
  t_vec->img_color = 0x000000;
  t_vec->n = 1000;
  sphere(RSPHERE, &t_vec);
  return (t_vec->img_color);
}

int                     main()
{
  int                   x;
  int                   y;
  struct s_ptr          t_ptr;
  struct s_vec          t_vec;

  x = 0;
  t_ptr.mlx_ptr = mlx_init();
  if (t_ptr.mlx_ptr == NULL)
    return (1);
  t_ptr.img_ptr = mlx_new_image(t_ptr.mlx_ptr, 800, 800);
  t_ptr.data = mlx_get_data_addr(t_ptr.img_ptr, &t_ptr.bpp, &t_ptr.sizeline, &t_ptr.endian);
  while (x++ < XMAX)
    {
      y = 0;
      while (y++ < YMAX)
        my_pixel_put_to_image(calc(&t_ptr, &t_vec),&t_ptr,x, y);
    }
  t_ptr.win_ptr = mlx_new_window(t_ptr.mlx_ptr, 800, 800, "RTV1" );
  mlx_put_image_to_window(t_ptr.mlx_ptr, t_ptr.win_ptr, t_ptr.img_ptr, 0, 0);
  my_hook(&t_ptr);
  return (0);
}

int     gere_key(int keycode)
{
  if (keycode == LEFT_KEY)
    my_putstr("gauche\n");
  if (keycode == RIGHT_KEY)
    my_putstr("droite\n");
  if (keycode == UP_KEY)
    my_putstr("haut\n");
  if (keycode == DOWN_KEY)
    my_putstr("bas\n");
  if (keycode == END_KEY)
    {
      my_putstr("\033[1;31mExit touch: End of prog\n\033[0;0m");
      exit(0);
    }
  return (0);
}

void    my_hook(t_ptr *t_ptr)
{
  mlx_hook(t_ptr->win_ptr, KeyPress, KeyRelease, &gere_key, &t_ptr);
  mlx_loop(t_ptr->mlx_ptr);
}

int             my_delta(double a, double b, double delta, t_vec *t_vec)
{
  double        x1;
  double        x2;

  if (delta > 0)
    {
      x1 = (-b - sqrt(delta)) / (2 * a);
      x2 = (-b + sqrt(delta)) / (2 * a);
    }
  if (x1 > 0 && (x1 < x2) && x1 < t_vec->n)
    {
      t_vec->n = x1;
      t_vec->img_color = 0xFF0000;
    }
  else if (x2 > 0 && (x2 < x1) && x2< t_vec->n)
    {
      t_vec->n = x2;
      t_vec->img_color = 0xFF0000;
    }
}

int             sphere(int rayon, t_vec *t_vec)
{
  double        a;
  double        b;
  double        c;
  double        delta;

  a = pow(t_vec->vx, 2) + pow(t_vec->vy, 2) + pow(t_vec->vz, 2);
  b = (2 * t_vec->dx * t_vec->vx) + (2 * t_vec->dy * t_vec->vy) + (2 * t_vec->dz * t_vec->vz);
  c = (pow(t_vec->dx, 2) + pow(t_vec->dy, 2) + pow(t_vec->dz, 2)) - pow(rayon, 2);
  delta = ((b * b) - (4 * a * c));
  my_delta(a, b, delta, t_vec);
  return (0);
}

fonction pour init les valeurs()                                                                                                                                                                        
{                                                                                                                                                                                             
  struct s_vec t_vec;
  t_vec.dx = 1;                                                                                                                                                                               
  t_vec.dy = 1;                                                                                                                                                                               
  t_vec.dz = 1;                                                                                                                                                                               
  t_vec.vx = 1;                                                                                                                                                                               
  t_vec.vy = 1;                                                                                                                                                                               
  t_vec.vz = 1;                                                                                                                                                                               
  sphere(RSPHERE, &t_vec);                                                                                                                                                                    
  return (0);                                                                                                                                                                                 
} 


#ifndef          RTV1_H_
# define         RTV1_H_

#define         END_KEY (65307)
#define         UP_KEY (65362)
#define         LEFT_KEY (65361)
#define         RIGHT_KEY (65363)
#define         DOWN_KEY (65364)
#define         XMAX (800)
#define         YMAX (800)
#define         RSPHERE (10)
#define         RCYLINDRE (10)

typedef struct  s_ptr
{
  void          *mlx_ptr;
  void          *win_ptr;
  void          *img_ptr;
  char          *data;
  int           sizeline;
  int           endian;
  int           bpp;
  char          *str;
}               t_ptr;

typedef struct  s_vec
{
  double        a;
  double        b;
  double        c;
  double        delta;
  double        angle;
  int           dx;
  int           dy;
  int           dz;
  int           vx;
  int           vy;
  int           vz;
  int           img_color;
  int           n;
}               t_vec;

#endif /* !RTV1_H_ */
