# Evoluze Marketing — Site Local (Baixada Santista)

Landing page da **Evoluze Marketing** com posicionamento local: *"A agência de marketing que vai até a sua empresa"* — Santos, São Vicente, Praia Grande e região.

## O que tem aqui

| Pasta / arquivo | O que é |
|---|---|
| `public/index.html` | O site completo (HTML único, sem build, pronto pra publicar) |
| `public/assets/img/` | Todas as imagens próprias (logo, clientes, fotos) — **extraídas do v7 e salvas como arquivos**, sem depender do Manus |
| `referencia/` | Os arquivos originais que serviram de base (v7 + guia de clonagem), guardados pra nunca mais perder nada — **não vai pro ar** |
| `netlify.toml` | Diz ao Netlify pra publicar só a pasta `public/` (preview) |

> A pasta `public/` é exatamente o que vai pro ar — em qualquer host, é só subir o **conteúdo** dela.

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

Hospedagem definitiva: **Hostinger**, com o domínio próprio `evoluzemarketing.com.br`.

### Publicação automática (GitHub → Hostinger) — recomendado

O workflow `.github/workflows/deploy-hostinger.yml` envia a pasta `public/` para a `public_html` da Hostinger **sozinho, a cada alteração no site**. Configuração única (≈5 min):

1. **Pegar os dados de FTP na Hostinger**: hPanel → **Arquivos → Contas FTP**. Anote o *host* (ex.: `ftp.evoluzemarketing.com.br` ou um IP) e o *usuário*; se não souber a senha, redefina ali mesmo.
2. **Guardar como segredos no GitHub** (a senha nunca fica no código): [Settings → Secrets and variables → Actions](https://github.com/guscaciotti-hub/SITE-LOCAL/settings/secrets/actions) → *New repository secret* → criar os três:
   - `FTP_HOST` · `FTP_USERNAME` · `FTP_PASSWORD`
3. **Primeira publicação**: aba **Actions → Publicar na Hostinger → Run workflow**. Depois disso, todo push que mexer em `public/` publica sozinho.

> Se a conta FTP já abrir dentro de `public_html`, troque `server-dir` para `./` no workflow. Se o FTPS falhar na conexão, troque `protocol: ftps` por `ftp`.

### Publicação manual (alternativa)

1. No hPanel: **Sites → Gerenciar → Gerenciador de Arquivos → `public_html`**.
2. Envie o conteúdo da pasta `public/` (ou o `evoluze-hostinger.zip` extraído) — o `index.html` precisa ficar direto em `public_html/`, não dentro de subpasta.

### Domínio e SSL

Confira se o `evoluzemarketing.com.br` está apontado pro plano (comprado na própria Hostinger já vem apontado; de fora, use os nameservers que o hPanel mostrar) e ative o **SSL grátis (Let's Encrypt)** em Segurança → SSL, com "forçar HTTPS".

## Observações

- Imagens de fundo dos cards de serviço e o dashboard do hero vêm do Unsplash (CDN estável); logos de plataformas vêm da Wikimedia. Tudo o que é **da marca** está local em `assets/img/`.
- WhatsApp configurado: `+55 13 98228-7720` com mensagens pré-preenchidas de diagnóstico presencial.
