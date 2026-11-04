# Andromeda · website

Static site for the Andromeda student club (Tec de Monterrey, Guadalajara). No build step, no framework — every library and font is in `assets/`, so the site doesn't depend on any outside CDN.

```
index.html             the whole site (HTML + CSS + JS)
favicon.png            browser tab icon
apple-touch-icon.png   iPhone home-screen icon
og.jpg                 preview image when the link is shared (WhatsApp, Discord, Instagram…)
assets/fonts.css       self-hosted fonts (Archivo, Instrument Sans/Serif, IBM Plex Mono)
assets/fonts/          font files
assets/js/             three.js, GSAP + ScrollTrigger, Lenis
img/                   (create it) club photos, mission covers and screenshots
vercel.json            caching + security headers
.vercelignore          keeps repo-only files off the live site
```

## Publishing

This repo is connected to Vercel: **every commit to `main` goes live automatically** in about 30 seconds. No computer setup needed.

- **Edit from anywhere:** open a file on github.com, click the pencil, change it, and click **Commit changes**.
- **Add photos:** go into the `img/` folder (create it the first time via *Add file → Upload files*, typing `img/` before the name) and upload.
- **Undo a bad change:** Vercel → Deployments → pick an older one → **Promote to Production** (instant), or revert the commit on GitHub.

## Link previews

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
| `advisor` | Faculty advisor name, department, photo (top corner of the heptagon) |
| `council` | Board roles — add, remove or reorder; the heptagon redraws itself with that many corners. `short` = the name shown on phones (full name appears when tapped) |
| `gallery` | "Bitácora visual" photo strip: `{ image: "img/sesion1.jpg", caption: "Primera sesión" }` — add or remove freely |
| `missions[]` | Projects. `image` = card cover, `gallery` = list of screenshots shown in the mission's detail card. `status`: `pendiente` · `curso` · `beta` · `lanzado` (only mark `lanzado` when it's real — it becomes a planet in the background) |
| `collab` | Partner areas/clubs, their joint missions, and an optional `image` of the joint project |

**Photos:** put them in an `img/` folder and use normal paths, e.g. `photo: "img/miguel.jpg"`. Square images around 600×600 for council photos; 1600×900 for mission covers. Keep each image under ~500 KB (compress with squoosh.app).

To test locally before publishing: `npx serve .` and open the printed address. Opening `index.html` by double-clicking won't load the fonts/libraries, because they use absolute `/assets/…` paths.
