
LuzTube es un launcher de YouTube diseñado para ofrecer un entorno de visualización seguro, controlado y altamente personalizable. Es la solución ideal para padres y tutores que buscan gestionar el contenido al que acceden los menores, garantizando una navegación filtrada, privada y libre de distracciones.
🚀 Características Principales
🛡️ Control Parental y Filtros
Lista Blanca (Whitelist): Acceso restringido exclusivamente a los canales aprobados desde el Panel de Administración.
Gestión de Shorts: Habilita o deshabilita la visualización de YouTube Shorts según tus preferencias de seguridad.
Panel de Administración Seguro: Entorno protegido por contraseña para configurar toda la experiencia del usuario final.
🎨 Personalización
Interfaz Adaptable: Incluye múltiples prefabs y opciones de configuración para ajustar la apariencia y funcionalidad de la aplicación según tus necesidades.
🔐 Panel de Administración
El Panel de Administración es el núcleo del control parental.
Credenciales por defecto:
Contraseña: Shokeados
Nota: Se recomienda encarecidamente cambiar esta contraseña inmediatamente tras el primer inicio.
Funcionalidades:
Gestión dinámica de la lista blanca (añadir/quitar canales).
Monitoreo de historial de reproducción y estadísticas de uso.
Configuración avanzada de video y restricciones.
Persistencia de datos en formato JSON.
Gestión de credenciales de administrador.
🛠 Funcionamiento y Configuración
Requisitos Previos
Python: Asegúrate de tener Python instalado en tu sistema.
Google Cloud API Key: Es obligatorio configurar una API Key de YouTube Data API v3 para que la aplicación pueda realizar consultas. Al iniciar la aplicación por primera vez, verás instrucciones detalladas en pantalla para obtener tu clave desde la consola de Google Cloud.
Guía de Inicio (macOS)
Navegar al proyecto:
Bash




cd ruta/a/tu/proyecto/LuzTube
Ejecutar el script de inicio:
Bash




sh START_LuzTube.sh
Acceso:
Una vez el servidor esté activo (puerto 8080), abre tu navegador en: http://localhost:8080
💡 Notas Importantes
Configuración Inicial: Por motivos de conveniencia, la aplicación incluye una lista de canales precargada de uso personal. Te recomiendo encarecidamente revisar y modificar esta lista desde el Panel de Administración para adaptarla a tus necesidades específicas.
Gestión de Datos: Toda la información (historial, configuración y lista blanca) se almacena localmente en el archivo data.json. Esto garantiza que tu privacidad y la del menor permanezcan bajo tu control total, sin servicios en la nube de terceros.
Desarrollado con ❤️ para una navegación segura.
