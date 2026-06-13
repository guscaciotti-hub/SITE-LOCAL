#!/usr/bin/env bash
# Baixa as imagens externas do site (logos de plataformas + fotos Unsplash)
# para dentro do repositório, eliminando dependência de CDN de terceiros.
set -euo pipefail

UA="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0 Safari/537.36"
baixar() { # baixar <url> <destino>
  curl -fsSL --retry 3 --retry-delay 2 -A "$UA" -o "$2" "$1"
  echo "ok: $2 ($(du -h "$2" | cut -f1))"
}

mkdir -p vendor/plataformas vendor/fotos

# Logos de plataformas (Wikimedia Commons)
W="https://upload.wikimedia.org/wikipedia/commons/thumb"
baixar "$W/7/7c/Meta_Platforms_Inc._logo.svg/1200px-Meta_Platforms_Inc._logo.svg.png"            vendor/plataformas/meta.png
baixar "$W/0/01/LinkedIn_Logo.svg/1200px-LinkedIn_Logo.svg.png"                                  vendor/plataformas/linkedin.png
baixar "$W/e/e1/Logo_of_YouTube_%282015-2017%29.svg/1200px-Logo_of_YouTube_%282015-2017%29.svg.png" vendor/plataformas/youtube.png
baixar "$W/6/6b/WhatsApp.svg/240px-WhatsApp.svg.png"                                             vendor/plataformas/whatsapp.png
baixar "$W/3/3e/Salesforce_Corporate_Logo_RGB.svg/1200px-Salesforce_Corporate_Logo_RGB.svg.png"  vendor/plataformas/salesforce.png
baixar "$W/a/a9/Amazon_logo.svg/1200px-Amazon_logo.svg.png"                                      vendor/plataformas/amazon.png
baixar "$W/2/2f/Google_2015_logo.svg/1200px-Google_2015_logo.svg.png"                            vendor/plataformas/google.png

# Fotos (Unsplash) — hero + cards de serviço na ordem do HTML
U="https://images.unsplash.com"
baixar "$U/photo-1551288049-bebda4e38f71?w=1600&q=90" vendor/fotos/hero-dashboard.jpg
baixar "$U/photo-1611532736597-de2d4265fba3?w=900&q=80" vendor/fotos/servico-1.jpg
baixar "$U/photo-1552664730-d307ca884978?w=600&q=80"  vendor/fotos/servico-2.jpg
baixar "$U/photo-1547658719-da2b51169166?w=600&q=80"  vendor/fotos/servico-3.jpg
baixar "$U/photo-1677442135703-1787eea5ce01?w=600&q=80" vendor/fotos/servico-4.jpg
baixar "$U/photo-1611162617213-7d7a39e9b1d7?w=600&q=80" vendor/fotos/servico-5.jpg
baixar "$U/photo-1601506521793-dc748fc80b67?w=600&q=80" vendor/fotos/servico-6.jpg

echo "Total: $(find vendor -type f | wc -l) imagens"
