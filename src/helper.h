#pragma once
#include <SFML/System/Vector2.hpp>

// Helper functions will be contained in this file. 

// wrap around position to keep it within the range [-1, 1] for both x and y coordinates
inline void wrapAround (sf::Vector2f& pos) {
    if (pos.x > 1.0f) 
        pos.x = pos.x - 2.0f;
    if (pos.x < -1.0f) 
        pos.x = pos.x + 2.0f;
    if (pos.y > 1.0f) 
        pos.y = pos.y - 2.0f;
    if (pos.y < -1.0f) 
        pos.y = pos.y + 2.0f;
}

// check if two circles collide based on their positions and radii
inline bool checkCollision(const sf::Vector2f& pos1, float radius1, const sf::Vector2f& pos2, float radius2) {
    float dx = pos1.x - pos2.x;
    float dy = pos1.y - pos2.y;
    float distanceSquared = dx * dx + dy * dy;
    float radiusSum = radius1 + radius2;
    return distanceSquared <= (radiusSum * radiusSum);
}