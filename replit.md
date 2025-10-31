# ULTRAGOL - Generador de APK Android

## Descripción del Proyecto

Sistema automatizado para generar aplicaciones Android (APK) a partir del sitio web UltraGol usando Apache Cordova. El proyecto convierte la plataforma web completa en una aplicación Android nativa instalable.

## Estado Actual

✅ **Proyecto Configurado y APK Generada** - La APK se ha generado exitosamente y está lista para descargar e instalar en dispositivos Android.

- **APK Generada:** `ultragol.apk` (91 MB)
- **Ubicación:** `/home/runner/workspace/ultragol.apk`
- **Última Compilación:** Octubre 31, 2025

## Estructura del Proyecto

```
.
├── build-apk.sh           # Script automatizado de construcción
├── ultragol.apk          # APK Android generada (91 MB)
├── README.md             # Documentación para el usuario
├── replit.md             # Este archivo (información del proyecto)
├── proyecto-web/         # Código fuente del sitio web (clonado de GitHub)
│   ├── index.html        # Página principal
│   ├── css/              # Estilos CSS
│   ├── js/               # JavaScript
│   ├── data/             # Datos JSON (fixtures, standings, etc.)
│   ├── assets/           # Recursos (imágenes, iconos)
│   ├── attached_assets/  # Assets adicionales
│   ├── server.js         # Servidor Express.js
│   └── package.json      # Dependencias Node.js
└── ultragol-app/         # Proyecto Cordova (generado automáticamente)
    ├── www/              # Archivos web completos del sitio
    ├── platforms/        # Código nativo Android
    └── config.xml        # Configuración de Cordova
```

## Detalles de la Aplicación

- **Nombre:** ULTRAGOL
- **ID:** com.l3ho.ultragol
- **Versión:** 1.0.0
- **SDK Mínimo:** Android API 22 (Android 5.0 Lollipop)
- **SDK Objetivo:** Android API 35 (Android 15)
- **Tamaño APK:** 91 MB (incluye todos los assets, CSS, JS, y recursos)

## Tecnologías Utilizadas

- **Apache Cordova 12.x:** Framework para aplicaciones móviles híbridas
- **Android SDK Build Tools 35.0.0:** Herramientas de compilación Android
- **OpenJDK 17:** Compilador Java
- **Gradle 8.13:** Sistema de construcción
- **Node.js 20:** Runtime JavaScript
- **Express.js 5.1.0:** Servidor web (incluido en la app)

## Repositorio Original

- **GitHub:** https://github.com/SERVIDOR-L3HO/ARCHIVOSORIGINALESPARAAPK.git
- **Directorio Local:** `/home/runner/workspace/proyecto-web`
- **Dependencias Instaladas:** PayPal SDK, Stripe, Express, Helmet, CORS, y más

## Workflow Configurado

### Build APK
- **Comando:** `bash -c "chmod +x build-apk.sh && ./build-apk.sh"`
- **Tipo:** Console
- **Duración:** ~2-3 minutos
- **Salida:** APK debug de 91 MB (incluye todos los archivos web completos)

El workflow ejecuta automáticamente:
1. Instalación de Cordova
2. Descarga y configuración del Android SDK
3. Creación del proyecto Cordova
4. Clonado de archivos desde el repositorio GitHub
5. Configuración de permisos y recursos
6. Compilación de la APK con Gradle
7. Copia de la APK a la raíz del proyecto

## Características del Sitio Web Incluidas

✅ **Liga MX y Ligas Europeas:**
- Marcadores en vivo
- Tabla de posiciones
- Calendario de partidos
- Estadísticas de equipos
- Goleadores

✅ **Streaming:**
- Enlaces a transmisiones en vivo
- Videos de highlights
- Integración con YouTube

✅ **Firebase:**
- Autenticación de usuarios (Google OAuth)
- Base de datos Firestore
- Comentarios en tiempo real
- Chat global
- Notificaciones push

✅ **Monetización:**
- Google AdSense
- Donaciones vía PayPal
- Sistema de pagos con Stripe (configurado pero no implementado)

✅ **UI/UX Moderna:**
- Splash screen animado
- Barra de navegación inferior
- Tema oscuro con naranja/dorado
- Animaciones CSS personalizadas
- Diseño responsive

## Cómo Usar

### Para generar la APK nuevamente:

1. **Ejecutar el workflow:** Haz clic en el botón "Build APK" en el panel de workflows
2. **Esperar 2-3 minutos:** El proceso descargará, configurará y compilará todo
3. **Descargar la APK:** Una vez terminado, encuentra `ultragol.apk` en la raíz del proyecto

### O ejecuta manualmente:

```bash
chmod +x build-apk.sh
./build-apk.sh
```

La APK estará disponible en `/home/runner/workspace/ultragol.apk`

## Instalación en Android

1. Descarga el archivo `ultragol.apk` a tu dispositivo Android
2. Habilita "Fuentes desconocidas" en Configuración > Seguridad
3. Abre el archivo APK y presiona "Instalar"
4. Una vez instalada, abre la app ULTRAGOL

## Permisos de Android

La aplicación solicita permisos para:
- **Internet:** Requerido para cargar contenido en vivo, Firebase, APIs
- **Almacenamiento:** Para guardar preferencias y datos en caché

## Configuración de Cordova

**config.xml configurado con:**
- Acceso completo a internet (`<access origin="*" />`)
- Navegación ilimitada para iframes y contenido externo
- Intents soportados: `tel:`, `sms:`, `mailto:`, `geo:`, `market:`
- Orientación automática (portrait/landscape)
- CSP (Content Security Policy) ajustado para Firebase y APIs externas

## Cambios Recientes

### Octubre 31, 2025
- ✅ Clonado del repositorio original desde GitHub
- ✅ Instalación de dependencias Node.js (Express, PayPal SDK, etc.)
- ✅ Actualización del script build-apk.sh para usar el nuevo repositorio
- ✅ Configuración del workflow "Build APK"
- ✅ Generación exitosa de la APK (91 MB)
- ✅ Verificación de la compilación y copia a la raíz

## Arquitectura de la Aplicación

### Frontend
- **Archivos completos:** Todos los HTML, CSS, JS del repositorio GitHub original
- **Assets locales:** Imágenes, iconos, videos incluidos en la APK
- **Seguridad:** Content Security Policy configurada para permitir Firebase, APIs externas, iframes

### Backend Incluido
- **Express.js server:** Servidor Node.js empaquetado en la APK
- **APIs locales:** `/api/videos`, `/api/fixtures`, `/api/fixtures/:league`
- **PayPal integration:** Endpoints para procesar donaciones
- **Static files:** Todos los archivos servidos localmente

### Configuración
- **Permisos:** Acceso completo a internet, navegación ilimitada
- **Intents:** Soporta llamadas, SMS, email, geo, market
- **Orientación:** Automática (portrait/landscape)

## Dependencias de Producción

```json
{
  "@paypal/paypal-server-sdk": "^1.1.0",
  "cookie-parser": "^1.4.7",
  "cors": "^2.8.5",
  "express": "^5.1.0",
  "express-session": "^1.18.2",
  "helmet": "^8.1.0",
  "stripe": "^18.5.0"
}
```

## Solución de Problemas

### La APK no se instala
- Asegúrate de habilitar "Fuentes desconocidas" en tu dispositivo Android
- Verifica que tengas espacio suficiente (mínimo 150 MB)

### Error durante la compilación
- El script automáticamente reinstala Android SDK si hay problemas
- Ejecuta de nuevo el workflow "Build APK"

### La app no carga contenido
- La aplicación requiere conexión a internet activa
- Verifica que Firebase esté configurado correctamente

## Próximos Pasos Potenciales

1. **Personalización del icono:** Usar el logo oficial de ULTRAGOL
2. **Modo release:** Configurar firma digital para Google Play Store
3. **Optimización:** Reducir el tamaño de la APK
4. **Splash screen:** Personalizar con branding ULTRAGOL
5. **Notificaciones push:** Implementar con Firebase Cloud Messaging
6. **Modo offline:** Cache para funcionar sin internet

## Recursos

- **Documentación Cordova:** https://cordova.apache.org/docs/
- **Android SDK:** https://developer.android.com/studio
- **Repositorio GitHub:** https://github.com/SERVIDOR-L3HO/ARCHIVOSORIGINALESPARAAPK.git

## Contacto y Soporte

Para regenerar la APK, ejecuta el workflow "Build APK" o el comando:
```bash
./build-apk.sh
```

La APK estará disponible en `/home/runner/workspace/ultragol.apk` para descarga.
