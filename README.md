# 🎪 Tenda Gaming

<div align="center">
  <img src="./static/img/ogp.png" alt="Tenda">
</div>

![pages](https://gitlab.com/sistematico/tendagaming/badges/main/pipeline.svg?key_text=Gitlab+Pages&key_width=85)

```sh
bun create astro@latest -- --template basics
```

[![Open in StackBlitz](https://developer.stackblitz.com/img/open_in_stackblitz.svg)](https://stackblitz.com/github/withastro/astro/tree/latest/examples/basics)
[![Open with CodeSandbox](https://assets.codesandbox.io/github/button-edit-lime.svg)](https://codesandbox.io/p/sandbox/github/withastro/astro/tree/latest/examples/basics)
[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/withastro/astro?devcontainer_path=.devcontainer/basics/devcontainer.json)

> 🧑‍🚀 **Seasoned astronaut?** Delete this file. Have fun!

![just-the-basics](https://github.com/withastro/astro/assets/2244813/a0a5533c-a856-4198-8470-2d67b1d7c554)

## 🚀 Estrutura do projeto

Inside of your Astro project, you'll see the following folders and files:

```text
/
├── static/
│   └── favicon.svg
├── src/
│   ├── components/
│   │   └── card.astro
│   ├── layouts/
│   │   └── base.astro
│   └── pages/
│       └── index.astro
└── package.json
```

Astro looks for `.astro` or `.md` files in the `src/pages/` directory. Each page is exposed as a route based on its file name.

There's nothing special about `src/components/`, but that's where we like to put any Astro/React/Vue/Svelte/Preact components.

Any static assets, like images, can be placed in the `public/` directory.

## 🧞 Commands

Todos os comandos devem rodar na raíz do projeto, em um terminal:

| Comando                   | Ação                                             |
| :------------------------ | :----------------------------------------------- |
| `bun install`             | Instala as dependências                          |
| `bun run dev`             | Starts local dev server at `localhost:4321`      |
| `bun run build`           | Build your production site to `./dist/`          |
| `bun run preview`         | Preview your build locally, before deploying     |
| `bun run astro ...`       | Run CLI commands like `astro add`, `astro check` |
| `bun run astro -- --help` | Get help using the Astro CLI                     |

## 🖥️ Nginx config files

/etc/nginx/sites.d/55-tendagaming.com.br

```
server {
    listen 80;
    listen [::]:80;

    server_name *.tendagaming.com.br;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    listen [::]:443 ssl;

    ssl_certificate         /etc/letsencrypt/live/tendagaming.com.br/fullchain.pem;
    ssl_certificate_key     /etc/letsencrypt/live/tendagaming.com.br/privkey.pem;

    server_name w.tendagaming.com.br wa.tendagaming.com.br wp.tendagaming.com.br whatsapp.tendagaming.com.br;
    return 301 https://chat.whatsapp.com/CVT4SRba3iAHUYbc4dV3y1;
}

server {
    listen 443 ssl;
    listen [::]:443 ssl;

    ssl_certificate         /etc/letsencrypt/live/tendagaming.com.br/fullchain.pem;
    ssl_certificate_key     /etc/letsencrypt/live/tendagaming.com.br/privkey.pem;

    server_name d.tendagaming.com.br dc.tendagaming.com.br discord.tendagaming.com.br;
    return 301 https://discord.gg/k9RM7gRfKa;
}

server {
    listen 443 ssl;
    listen [::]:443 ssl;

    ssl_certificate         /etc/letsencrypt/live/tendagaming.com.br/fullchain.pem;
    ssl_certificate_key     /etc/letsencrypt/live/tendagaming.com.br/privkey.pem;

    server_name t.tendagaming.com.br tl.tendagaming.com.br tlgr.tendagaming.com.br telegram.tendagaming.com.br;
    return 301 https://t.me/tndgaming;
}

server {
    listen 443 ssl;
    listen [::]:443 ssl;

    ssl_certificate         /etc/letsencrypt/live/tendagaming.com.br/fullchain.pem;
    ssl_certificate_key     /etc/letsencrypt/live/tendagaming.com.br/privkey.pem;

    server_name r.tendagaming.com.br rd.tendagaming.com.br red.tendagaming.com.br reddit.tendagaming.com.br;
    return 301 https://www.reddit.com/r/tendagaming;
}

# path: /etc/nginx/sites-available/cdn.tendagaming.com.br
# https://gist.github.com/alsyundawy/5b54f8c6023ffbdc5af272d09c51e9c2
# https://github.com/lalizita/nginx-cache
# https://dev.to/janreges/how-to-build-a-cdn-23-server-and-reverse-proxy-configuration-16md

server {
    listen 443 ssl;
    listen [::]:443 ssl;

    ssl_certificate         /etc/letsencrypt/live/tendagaming.com.br/fullchain.pem;
    ssl_certificate_key     /etc/letsencrypt/live/tendagaming.com.br/privkey.pem;

    server_name cdn.tendagaming.com.br;
    root /var/www/cdn.tendagaming.com.br;

    include conf.d/tnd-errors.conf;

    location ~* .(mp4|jpg|jpeg|png|gif|webp|css|mp3|wav|swf|mov|doc|pdf|xls|ppt|docx|pptx|xlsx)$ {
        expires 90d; # max
        gzip on;
        gzip_types *;
    }

#   location ~* .(gif|jpg|jpeg|png|avi|mpg|mpeg|mp4|htm|html|js|css|mp3|ico|flv)$ {
#     expires max;
#     proxy_set_header  X-Real-IP  $remote_addr;
#     proxy_pass https://cdn.tendagaming.com.br;
#     proxy_ignore_headers X-Accel-Expires Expires Cache-Control;
#     proxy_store /var/www/cache$uri;
#     proxy_store_access user:rw group:rw all:r;
#   }

    location ~ /\. { deny all; }
    location ~ ~$ { deny all; }
    location ~ \.php$ { deny all; }
}
```

/etc/nginx/conf.d/tnd-errors.conf

```
error_page 400 401 402 403 404 405 406 407 408 409 410 411 412 413 414 415 416 417 418 421 422 423
424 425 426 428 429 431 451 500 501 502 503 504 505 506 507 508 510 511 /error.html;

location = /error.html {
  ssi on;
  internal;
  auth_basic off;
  root /var/www/tendagaming.com.br/errors;
}
```

## 🕐 ChangeLog

- `2024/09/23` - `bun` atualizado para `1.1.20`
  - updated `hono` Vue component

## 👀 Saiba mais

Leia a documentação do [Astro](https://docs.astro.build).
