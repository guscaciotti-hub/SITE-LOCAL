# Evoluze Marketing — Site Local (Baixada Santista)

Landing page da **Evoluze Marketing** com posicionamento local: *"A agência de marketing que vai até a sua empresa"* — Santos, São Vicente, Praia Grande e região.

## O que tem aqui

| Pasta / arquivo | O que é |
|---|---|
| `index.html` | O site completo (HTML único, sem build, pronto pra publicar) |
| `assets/img/` | Todas as imagens próprias (logo, clientes, fotos) — **extraídas do v7 e salvas como arquivos**, sem depender do Manus |
| `referencia/` | Os arquivos originais que serviram de base (v7 + guia de clonagem), guardados pra nunca mais perder nada |

## Como o site foi montado

- **Visual**: idêntico ao `evoluze_v7_original.html` (hero split claro, carrossel de plataformas, seção dark de serviços, clientes, sobre, formulário) — o design "premium" foi preservado.
- **Mensagem**: adaptada do institucional/nacional para o **posicionamento local presencial**:
  - Badge: "Agência de Marketing — Baixada Santista"
  - Headline: "A agência de marketing que **vai até a sua empresa**"
  - Nova seção **"Onde atendemos"** com as cidades da região + CTA de WhatsApp
  - Diferenciais com "Atendimento presencial" e "Conteúdo gravado na sua empresa"
  - Formulário com campo **Cidade** (qualifica o lead local)
  - SEO local: title, description e dados estruturados (schema.org) com as cidades

## Antes de publicar — 3 pendências

1. **Formulário**: criar conta gratuita no [Formspree](https://formspree.io), pegar o ID e substituir `SUBSTITUA_SEU_ID` no `index.html` (linha do `<form>`). Sem isso o formulário não envia — mas o WhatsApp funciona normalmente.
2. **Google Tag Manager / Meta Pixel**: os códigos estão comentados no `<head>`. Descomente e troque `GTM-XXXXXXX` e `SEU_PIXEL_ID` quando for rodar campanha.
3. **Foto da Dra. Nicole Vargas**: no v7 original ela usa a mesma foto da Dra. Ísis Minamo. Trocar `assets/img/dra-isis-minamo.png` na terceira card quando tiver a foto certa.

## Como publicar

O site é estático — qualquer host serve:

- **Netlify / Vercel**: arrastar a pasta ou conectar este repositório (deploy automático a cada push).
- Apontar o domínio `evoluzemarketing.com.br` depois do deploy.

## Observações

- Imagens de fundo dos cards de serviço e o dashboard do hero vêm do Unsplash (CDN estável); logos de plataformas vêm da Wikimedia. Tudo o que é **da marca** está local em `assets/img/`.
- WhatsApp configurado: `+55 13 98228-7720` com mensagens pré-preenchidas de diagnóstico presencial.
