#!/bin/bash
# Double-click (Mac) to publish the Andromeda site to Vercel (production).
cd "$(dirname "$0")"
echo ""
echo " Publicando Andromeda en Vercel..."
echo ""
vercel --prod
echo ""
read -n 1 -s -r -p "Listo. Presiona cualquier tecla para cerrar."
