# Asteroids Game
## Tutorial Exercise 5: Asteroid Collisions and Death Animation

## 1. Introduction

In this tutorial exercise, we will explore collision handling and an animated effect for asteroids hit by projectiles. The starter code provides the collision checks, the dying-asteroid state, the animation timer, and the shaders and textures used to draw the effect.

**Learning Objective:** Understand how collisions change game-object state, and use an asteroid's elapsed dying time to select the texture shown during its death animation.

## 2. Collision Handling

### Collision Detection and State Changes

Collisions are checked between projectiles and live asteroids, and between the ship and live asteroids. The game treats each object as a circle for collision detection. It compares the squared distance between their centers with the square of the sum of their radii: a collision occurs when `distanceSquared <= (radius1 + radius2)^2`. This avoids calculating a square root for each check.

When a projectile overlaps a live asteroid, the asteroid is removed from the live-asteroid list and added to the dying-asteroid list with its elapsed dying time set to zero. The projectile that hit it is removed as well. The asteroid is no longer treated as live, but its saved position and scale are retained so its death animation can be drawn.

Ship collisions are also detected against live asteroids. Currently, a ship collision only prints a message; it does not remove the asteroid or apply a gameplay response.

## 3. Dying Asteroid Animation

The death effect is made from a sequence of 10 explosion textures (downloaded from [craftpix.net](https://craftpix.net/freebies/free-animated-explosion-sprite-pack/)). Each dying asteroid has its own timer, which advances by the elapsed time between frame updates. The animation lasts a fixed time interval, after which that asteroid is removed from the dying list.

The timer is needed to determine how far the animation has progressed for each asteroid. Since different asteroids can be hit at different times, each needs its own elapsed time to show the appropriate part of the sequence. Advancing the timer by elapsed frame time also keeps the animation duration consistent if the frame rate changes.

### Sprites, Quads, and the Death Shader

A **sprite** is a 2D image displayed in the scene, usually by mapping an image texture onto a rectangle. For the death effect, each dying asteroid is drawn as a textured quad (a rectangle made from two triangles). The quad is generated as four vertices and drawn as a triangle strip; it is scaled and positioned to match the asteroid.

The death shader handles this quad-based sprite. Its vertex shader uses the dying asteroid's position and scale to transform the quad's vertices and passes texture coordinates to the fragment shader. Its fragment shader samples the currently bound explosion texture at those coordinates to produce the sprite's pixels. The elapsed dying time determines which explosion texture is bound for that frame.

The quad starts as four vertices centered at the origin. To draw it over the dying asteroid, scale its vertices by the asteroid's size and translate them to the asteroid's position. These operations belong in the death vertex shader.

## 4. Student Tasks

Starter code for this exercise is provided in the repository. Most functionality is already implemented. Complete these tasks:

1. In `asteroids.cpp`, select and bind the explosion texture that corresponds to each asteroid's elapsed dying time.
2. In `shaders/death.vert`, scale the quad vertices using the asteroid's scale and position the quad using the asteroid's position.

Compile and run the program. Fire projectiles at asteroids and confirm that each hit triggers an animation that appears at the asteroid's location, progresses through its textures, and ends after its allotted duration.

## Submission

Submit your completed exercise via **Gradescope** under the assignment titled **Tutorial Exercise 5** before the end of your scheduled tutorial session.

Upload only the files you modified (`asteroids.cpp` and `shaders/death.vert`); do not upload the entire repository.
