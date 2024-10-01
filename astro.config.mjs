import { defineConfig } from 'astro/config';

export default defineConfig({
  site: 'https://tendagaming.com.br',
  // outDir: 'public',
  // publicDir: 'static',
  vite: {
    css: {
      preprocessorOptions: {
        scss: {
          api: 'modern-compiler' // or "modern"
        }
      }
    }
  }
});
