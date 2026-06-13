// Renderiza public/ e gera screenshots desktop + celular em shots/
import { chromium } from 'playwright';
import { createServer } from 'http';
import { readFileSync, existsSync, mkdirSync } from 'fs';
import { extname, join, normalize } from 'path';

const types = {
  '.html': 'text/html', '.css': 'text/css', '.js': 'text/javascript',
  '.png': 'image/png', '.jpg': 'image/jpeg', '.svg': 'image/svg+xml',
  '.webp': 'image/webp', '.ico': 'image/x-icon',
};

const srv = createServer((req, res) => {
  let p = decodeURIComponent(req.url.split('?')[0]);
  if (p === '/') p = '/index.html';
  const f = normalize(join('public', p));
  if (!f.startsWith('public') || !existsSync(f)) { res.writeHead(404); res.end(); return; }
  res.writeHead(200, { 'content-type': types[extname(f)] || 'application/octet-stream' });
  res.end(readFileSync(f));
}).listen(8777);

mkdirSync('shots', { recursive: true });
const browser = await chromium.launch();

for (const [name, viewport, deviceScaleFactor, isMobile] of [
  ['desktop', { width: 1440, height: 900 }, 1, false],
  ['celular', { width: 390, height: 844 }, 2, true],
]) {
  const page = await browser.newPage({ viewport, deviceScaleFactor, isMobile, hasTouch: isMobile });
  await page.emulateMedia({ reducedMotion: 'reduce' });
  await page.goto('http://localhost:8777/', { waitUntil: 'networkidle', timeout: 90000 });
  // rola até o fim e volta pra disparar animações de entrada/lazy-load
  await page.evaluate(() => new Promise((done) => {
    let y = 0;
    const t = setInterval(() => {
      y += 600; window.scrollTo(0, y);
      if (y >= document.body.scrollHeight) { clearInterval(t); window.scrollTo(0, 0); setTimeout(done, 1000); }
    }, 120);
  }));
  await page.screenshot({ path: `shots/${name}.jpg`, fullPage: true, type: 'jpeg', quality: 85 });
  await page.close();
  console.log(`ok: shots/${name}.jpg`);
}

await browser.close();
srv.close();
