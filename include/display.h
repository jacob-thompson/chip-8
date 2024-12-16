#include <stdbool.h>

#include <SDL.h>

#define SCREEN_WIDTH 640
#define SCREEN_HEIGHT 320
#define EXIT_SUCCESS 0
#define EXIT_FAILURE 1

/**
    * The display struct.
    * Contains the SDL window, renderer, and the pixels to be drawn.
*/
typedef struct display {
    SDL_Window *window;
    SDL_Renderer *renderer;
    bool pixels[SCREEN_HEIGHT][SCREEN_WIDTH];
    bool powered_on;
} display;

/**
    * Initialize the display.
    * @param display the display
    * @return 0 on success, 1 on failure
*/
int init_display(display *display);

/**
    * Draw the background of the display.
    * @param display the display
    * @return 0 on success, 1 on failure
*/
int draw_background(display *display);

/**
    * Draw the pixels of the display.
    * @param display the display
    * @return 0 on success, 1 on failure
*/
int draw_pixels(display *display);
