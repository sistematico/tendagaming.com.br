#!/bin/bash

[ -d /home/lucas/cdn/tendagaming ] && rsync -avzz /home/lucas/cdn/tendagaming/ nginx@eris:/var/www/cdn.tendagaming.com.br/
[ -d /home/lucas/code/tendagaming/errors ] && scp /home/lucas/code/tendagaming/errors/error.html nginx@eris:/var/www/tendagaming.com.br/errors/
