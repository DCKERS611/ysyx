#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "ex19.h"
#include <assert.h>


int Monster_attack(void *self, int damage)
{
    assert(self != NULL);
    assert(damage >= 0);
    Monster *monster = self;
    assert(monster->proto.description != NULL);

    printf("You attack %s!\n", monster->_(description));

    monster->hit_points -= damage;

    if(monster->hit_points > 0) {
        printf("It is still alive.\n");
        return 0;
    } else {
        printf("It is dead!\n");
        return 1;
    }
}

int Monster_init(void *self)
{
    assert(self != NULL);
    Monster *monster = self;
    monster->hit_points = 10;
    return 1;
}

Object MonsterProto = {
    .init = Monster_init,
    .attack = Monster_attack
};


void *Room_move(void *self, Direction direction)
{
    assert(self != NULL);
    assert(direction >= NORTH && direction <= EAST);
    Room *room = self;
    Room *next = NULL;

    if(direction == NORTH && room->north) {
        printf("You go north, into:\n");
        next = room->north;
    } else if(direction == SOUTH && room->south) {
        printf("You go south, into:\n");
        next = room->south;
    } else if(direction == EAST && room->east) {
        printf("You go east, into:\n");
        next = room->east;
    } else if(direction == WEST && room->west) {
        printf("You go west, into:\n");
        next = room->west;
    } else {
        printf("You can't go that direction.");
        next = NULL;
    }

    if(next) {
        next->_(describe)(next);
    }

    return next;
}


int Room_attack(void *self, int damage)
{
    assert(self != NULL);
    assert(damage >= 0);
    Room *room = self;
	if (room == NULL || damage < 0) return 0;
    if (room->bad_guy == NULL) {
		puts("There's nothing to attack her.\n");
		return 0;
	}

	return room->bad_guy->_(attack)(room->bad_guy, damage);
}


Object RoomProto = {
    .move = Room_move,
    .attack = Room_attack
};


void *Map_move(void *self, Direction direction)
{
    assert(self != NULL);
    assert(direction >= NORTH && direction <= EAST);
    Map *map = self;
    assert(map->location != NULL);
	if (map == NULL || map->location == NULL) return NULL;
    
    Room *next = map->location->_(move)(map->location, direction);

    if(next) {
        map->location = next;
    }

    return next;
}

int Map_attack(void *self, int damage)
{
    assert(self != NULL);
    assert(damage >= 0);
    Map* map = self;
    assert(map->location != NULL);
	if (map == NULL || map->location == NULL) return 0;

    return map->location->_(attack)(map->location, damage);
}


int Map_init(void *self)
{
    assert(self != NULL);
    Map *map = self;
    if (map == NULL) return 0;

    // make some rooms for a small map
	map->rooms[0] = NEW(Room, "The great hall");
    if (map->rooms[0] == NULL) return 0;
    map->rooms[1] = NEW(Room, "The throne room");
    if (map->rooms[1] == NULL) return 0;
    map->rooms[2] = NEW(Room, "The arena");
    if (map->rooms[2] == NULL) return 0;
    map->rooms[3] = NEW(Room, "The kitchen");
    if (map->rooms[3] == NULL) return 0;
    map->monster = NEW(Monster, "The evil minotaur");
    if (map->monster == NULL) return 0;

    Room *hall = map->rooms[0];
    Room *throne = map->rooms[1];
    Room *arena = map->rooms[2];
    Room *kitchen = map->rooms[3];

    hall->north = throne;
    throne->south = hall;
    throne->west = arena;
    arena->east = throne;
    throne->east = kitchen;
    kitchen->west = throne;
    arena->bad_guy = map->monster;

    map->start = hall;
    map->location = hall;
    return 1;
}

void Map_destroy(void *self)
{
    assert(self != NULL);
    Map *map = self;

    if(map->monster) {
        map->monster->_(destroy)(map->monster);
    }

    for(int i = 0; i < 4; i++) {
        if(map->rooms[i]) {
            map->rooms[i]->_(destroy)(map->rooms[i]);
        }
    }

    Object_destroy(map);
}

Object MapProto = {
    .init = Map_init,
    .destroy = Map_destroy,
    .move = Map_move,
    .attack = Map_attack
};

int process_input(Map *game)
{
    assert(game != NULL);
    assert(game->location != NULL);
    printf("\n> ");

    int ch = getchar();
	if (ch == EOF) return 0;
	
	int rest;
	while ((rest = getchar()) != '\n' && rest != EOF) {
		
	}

    int damage = rand() % 4;

    switch(ch) {
        case 'q':
            printf("Giving up? You suck.\n");
            return 0;
            break;

        case 'n':
            game->_(move)(game, NORTH);
            break;

        case 's':
            game->_(move)(game, SOUTH);
            break;

        case 'e':
            game->_(move)(game, EAST);
            break;

        case 'w':
            game->_(move)(game, WEST);
            break;

        case 'a':

            game->_(attack)(game, damage);
            break;
        case 'l':
            printf("You can go:\n");
            if(game->location->north) printf("NORTH\n");
            if(game->location->south) printf("SOUTH\n");
            if(game->location->east) printf("EAST\n");
            if(game->location->west) printf("WEST\n");
            break;

        default:
            printf("What?: %d\n", ch);
    }

    return 1;
}

int main(int argc, char *argv[])
{
    assert(argc >= 0);
    assert(argv != NULL);
    // simple way to setup the randomness
    srand(time(NULL));

    // make our map to work with
    Map *game = NEW(Map, "The Hall of the Minotaur.");
	if (game == NULL ) {
		fputs("Failed to create the game map.\n" , stderr);
		return EXIT_FAILURE;
	}

    game->location->_(describe)(game->location);

    while(process_input(game)) {
    	
	}

	game->_(destroy)(game);
	return EXIT_SUCCESS;
}
