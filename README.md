# LuzTube — Launcher personal de YouTube

LuzTube es un launcher de YouTube diseñado para ofrecer un entorno de visualización seguro, controlado y altamente personalizable. Ideal para padres que buscan gestionar el contenido infantil, o para cualquiera que quiera una experiencia YouTube sin distracciones, con perfiles múltiples, wallpapers, fuentes personalizadas y estadísticas.

---

## Funcionalidades

### 👤 Perfiles múltiples
- Sistema multi-perfil tipo Netflix/Disney+
- Selector full-screen con avatar por letra + color
- Foto de perfil desde el dispositivo (recorte cuadrado, WebP)
- Cada perfil tiene su propio historial, favoritos y configuración

### 🖼️ Wallpapers personalizados
- Subí cualquier imagen desde tu dispositivo
- Modos: Cover, Contain, Stretch, Tile
- Efectos: blur, darken, brightness, saturation
- Se almacenan por perfil en IndexedDB

### 🔤 Fuentes personalizadas
- Subí fuentes TTF, OTF, WOFF o WOFF2
- Activación/desactivación por perfil
- Sin dependencia de internet — funcionan offline

### 🛡️ Control Parental
- **Lista blanca (Whitelist):** solo canales aprobados
- **Modo Shorts:** activar/desactivar YouTube Shorts
- Acceso restringido al panel admin con contraseña

### 📊 Panel Admin
- Dashboard con tarjetas de resumen (usuarios, videos, canales, horas)
- Gráficos Chart.js (barras por usuario, doughnut de categorías)
- Top canales por score
- Tabla de actividad persistente (500 entradas máximo)
- Migración automática de datos antiguos

### 📈 Estadísticas
- Tiempo de visualización por perfil
- Videos vistos, sesiones, búsquedas realizadas
- Persistencia en servidor + IndexedDB + localStorage

---

## Requisitos

| Requisito | Detalle |
|-----------|---------|
| **Python** | 3.7+ (usa solo librerías estándar) |
| **Internet** | Solo la primera vez (carga React, Babel, Chart.js desde CDN) |
| **API Key** | YouTube Data API v3 (se configura desde el panel) |

---

## Inicio Rápido

### macOS / Linux
```bash
bash START_LuzTube.sh
```

### Windows
Hacé doble clic en `START_LuzTube.bat` (o ejecutalo como Administrador).

Los scripts detectan si falta Python y lo instalan automáticamente via `brew` (macOS) o `winget` (Windows).

### Manual
```bash
python3 server.js
```

Luego abrí en el navegador:
- **Local:** http://localhost:8080
- **Red:** http://IP_DE_TU_MAQUINA:8080 (accesible desde cualquier dispositivo en la misma WiFi)

---

## Estructura del proyecto

```
LuzTubeRevival/
├── server.js              # Servidor Python (estáticos + API /data)
├── luztube_v5.html        # Frontend React completo
├── START_LuzTube.sh       # Script de inicio para macOS/Linux
├── START_LuzTube.bat      # Script de inicio para Windows
├── data.json              # Persistencia del servidor (se crea solo)
└── .gitignore
```

---

## Almacenamiento

| Dato | Dónde se guarda |
|------|----------------|
| Perfiles (sin avatar) | `data.json` + localStorage |
| Avatares | IndexedDB (store: "avatars") |
| Wallpapers | IndexedDB (store: "wallpapers") |
| Fuentes | IndexedDB (store: "fonts") |
| Config global | `data.json` + localStorage |
| Actividad | `data.json` (máx 500 entradas) |

---

## API Key de YouTube

Para que las búsquedas y canales funcionen, necesitás una clave de **YouTube Data API v3**:

1. Andá a https://console.cloud.google.com/
2. Creá un proyecto → habilitá **YouTube Data API v3**
3. Creá una **API Key** (sin restricciones o con restricción HTTP)
4. En LuzTube, andá a 🔑 **Conexión YouTube** y pegala

---

## Panel Admin

La contraseña por defecto es `Shokeados`. Se recomienda cambiarla en la pestana **Configuración** del panel.

---

## Tecnologías

- **Backend:** Python 3 (http.server estándar)
- **Frontend:** React 18 + Babel Standalone (sin bundler)
- **Gráficos:** Chart.js 4
- **Imágenes:** Canvas API + WebP + IndexedDB
- **YouTube:** iframe embed + Data API v3
