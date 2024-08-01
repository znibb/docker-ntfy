#!/bin/bash
if [ ! -f .env ]; then
  cp ./files/.env.example .env
fi
if [ ! -f ./data/user.db ]; then
  touch ./data/user.db
fi