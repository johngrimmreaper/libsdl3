// Copyright 2022 quyykk
// SPDX-License-Identifer: Zlib

#include <iostream>
#include <SDL3/SDL.h>
#include <SDL3/SDL_main.h>

int main()
{
	if(!SDL_Init(SDL_INIT_VIDEO))
		return -1;

	std::cout << "initialized!\n";
	return 0;
}
