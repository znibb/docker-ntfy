#!/bin/bash
if [ ! -f .env ]; then
  cp ./files/.env.example .env
fi
if [ ! -f ./files/user.db ]; then
  touch ./files/user.db
fi