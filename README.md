# Andromeda · website

Static site for the Andromeda student club (Tec de Monterrey, Guadalajara). No build step, no framework, nothing to install — every library and font is in `assets/`, so the site doesn't depend on any outside CDN.

```
index.html             the whole site (HTML + CSS + JS)
favicon.svg            browser tab icon
apple-touch-icon.png   iPhone home-screen icon
og.jpg                 preview image when the link is shared (WhatsApp, Discord, Instagram…)
assets/fonts.css       self-hosted fonts (Archivo, Instrument Sans/Serif, IBM Plex Mono)
assets/fonts/          font files
assets/js/             three.js, GSAP + ScrollTrigger, Lenis
vercel.json            caching + security headers
robots.txt
```

## Deploy to Vercel

**Option A — drag & drop (fastest)**
1. Unzip this folder.
2. Go to vercel.com → **Add New… → Project**, and drag the `andromeda-web` folder onto the page.
3. Framework preset: **Other**. Leave Build Command and Output Directory empty. Deploy.

**Option B — GitHub (best for a team)**
1. Create a GitHub repo and push the contents of this folder to it.
2. vercel.com → **Add New… → Project → Import** the repo. Preset **Other**, no build command. Deploy.
3. From then on, every push to `main` redeploys the site automatically.

**Option C — CLI**
```
npm i -g vercel
cd andromeda-web
vercel          # preview
vercel --prod   # production
```

## After the first deploy (once you know the URL)

Link previews on WhatsApp/Facebook/Discord need a *full* URL for the image. In `index.html`, change both
`/og.jpg` → `https://YOUR-DOMAIN/og.jpg` (the `og:image` and `twitter:image` lines near the top).

Custom domain: Vercel project → **Settings → Domains**.

## Editing content

Everything the club fills in over time lives in one place: the `CONFIG` object at the start of the main `<script>` in `index.html` (search for `const CONFIG`).

| Field | What it controls |
| --- | --- |
| `discordInvite` | Every Discord button on the page |
| `instagram`, `tiktok` | Leave empty to hide; fill `handle` + `url` to show them |
| `contactEmail` | Footer email + copy button |
| `sessions` | Schedule, place, first session date |
| `advisor` | Faculty advisor name, department, photo |
| `council` | Board roles — add, remove or reorder; the page adjusts |
| `missions[]` | Projects. `status`: `pendiente` · `curso` · `lanzado` (only mark `lanzado` when it's real — it becomes a planet in the background) |
| `collab` | Partner areas/clubs and their joint missions |

**Photos:** put them in an `img/` folder and use normal paths, e.g. `photo: "img/miguel.jpg"`. Square images around 600×600 work best.

To test locally before pushing: `npx serve .` (or `python3 -m http.server`) and open the printed address. Opening `index.html` by double-clicking won't load the fonts/libraries, because they use absolute `/assets/…` paths.
