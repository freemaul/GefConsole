#ifndef GEFCONSOLE_HPP
#define GEFCONSOLE_HPP

//#include <psl1ght/types.h>
#include <ft2build.h>
#include FT_FREETYPE_H 

typedef enum {
	RGB = 0,
	ARGB = 1,
} console_mode;

typedef struct {
	int		textsize;
	int		height,width;
	int		posx,posy;
	console_mode	mode;
	char		color[4];
	char		background_color[4];
	int		background;
	FT_Library	ft_library;
	FT_Face		ft_face;
}console_attribute;

#define CONSOLE_ATTR_DEFAULT {0,0,0,0,0,RGB,{0,0,0,0},{0,0,0,0},0,NULL,NULL}

typedef struct {
	console_attribute	attr;
	char**			buffer;
	int			nb_line,nb_car_per_line;
	int			line_current;
	int			line_next;
	int			line_top;
	int			car_current;
	FT_Library		ft_library;
	FT_Face			ft_face;
}console;


console*	Create_console(console_attribute);
void		Delete_console(console*);
int		Console_get_textsize(const console*);
int		Console_get_height(const console*);
int		Console_get_width(const console*);
int		Console_get_posx(const console*);
int		Console_get_posy(const console*);
void		Console_set_posx(console*,int);
void		Console_set_posy(console*,int);
void		Console_set_color(console*,const char*,size_t);
void		Console_enable_background(console*,int);
void		Console_set_background_color(console*,const char*,size_t);


void		Console_putc(console*,char);
void		Console_print(console*,const char*);
void		Console_printf(console* cons,const char* fmt,...);
void		Console_clear(console*);
void		Console_draw(const console*,char*,int,int);

#endif // GEFCONSOLE_HPP

