#!/usr/bin/env bash

PATH=$PATH:/home/nginx/.bun/bin

[ ! -f .env ] && [ -f .env.example ] && cp .env.example .env
bun install
bun run build