#!/bin/bash

# hyprctl dispatch -- exec ncmpcpp

hyprctl dispatch -- exec $(compgen -c | ncmpcpp)
