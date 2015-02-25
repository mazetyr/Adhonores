#include <mlx.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <unistd.h>
#include "rtv1.h"

int rotate_x(struct,int angle)
{
  double m[3][3];
  double save_vx;
  double save_vy;

  save_vx = vec->vx;
  save_vy = vec->vy;
  angle = (angle * M_PI) / 180;
  m[0][0] = 0;
  m[0][1] = 0;
  m[0][2] = 0;
  m[1][0] = 1;
  m[1][1] = sin(angle);
  m[1][2] = cos(angle);
  m[2][0] = 0;
  m[2][1] = cos(angle);
  m[2][2] = sin(angle);
  vec.vx = m[0][0] * save_vx + m[0][1] * save_vy + m[0][2] * vec.vz;
  vec.vy = m[1][0] * save_vx + m[1][1] * save_vy + m[1][2] * vec.vz;
  vec.vz = m[2][0] * save_vx + m[2][1] * save_vy + m[2][2] * vec.vz;
  return (vec);
}

int rotate_y(struct, int angle)
{
  double m[3][3];
  double save_vx;
  double save_vy;

  save_vx = vec.vx;
  save_vy = vec.vy;
  angle = (angle * M_PI) / 180;
  m[0][0] = cos(angle);
  m[0][1] = 0;
  m[0][2] = -sin(angle);
  m[1][0] = 0;
  m[1][1] = 0;
  m[1][2] = 1;
  m[2][0] = sin(angle);
  m[2][1] = 0;
  m[2][2] = -cos(angle);
  vec.vx = m[0][0] * save_vx + m[0][1] * save_vy + m[0][2] * vec.vz;
  vec.vy = m[1][0] * save_vx + m[1][1] * save_vy + m[1][2] * vec.vz;
  vec.vz = m[2][0] * save_vx + m[2][1] * save_vy + m[2][2] * vec.vz;
  return (vec);
}

void                    my_pixel_put_to_image(unsigned long img_color,char *data, struct t_img, /*int sizeline,int bpp,*/ int x, int y)
{
  unsigned char         color1;
  unsigned char         color2;
  unsigned char         color3;

  color1 = (img_color & 0xFF0000) >> 16;
  color2 = (img_color & 0xFF00) >> 8;
  color3 = (img_color & 0xFF);
  data[y * t_img.sizeline + x * t_img.bpp / 8 ] = color1;
  data[y * t_img.sizeline + x * t_img.bpp / 8 + 1] = color2;
  data[y * t_img.sizeline + x * t_img.bpp / 8 + 2] = color3;
}


int     graph()
{
  unsigned long         img_color;
  void                  *mlx_ptr;
  void                  *win_ptr;
  void                  *img_ptr;
  char                  *data;
  /*  int                   sizeline;                                                                                                                                                         
  int                   endian;                                                                                                                                                               
  int                   bpp;*/
  int                   x;
  int                   y;
  int                   z;
  int                   r;
  struct t_img          t_img;

  mlx_ptr = mlx_init();
  if (mlx_ptr == NULL)
    return (1);
  img_ptr = mlx_new_image(mlx_ptr, 500, 500);
  data = mlx_get_data_addr(img_ptr, &t_img.bpp, &t_img.sizeline, &t_img.endian);
  img_color = mlx_get_color_value(mlx_ptr, 0xFEB577);
  //  my_pixel_put_to_image(img_color, data, sizeline, bpp, x, y);                                                                                                                            
  win_ptr = mlx_new_window(mlx_ptr, 500, 500, "WOLF3D" );
  while (x != 200)
    {
      my_pixel_put_to_image(img_color, data, t_img, /*sizeline, bpp,*/ x, 50);
      x++;
    }
  mlx_put_image_to_window(mlx_ptr, win_ptr, img_ptr, 0, 0);
  my_hook(mlx_ptr, win_ptr, img_ptr);
  return (0);
}
