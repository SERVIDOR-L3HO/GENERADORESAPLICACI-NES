# ULTRAGOL - Aplicación Android

## Descripción

Esta es una aplicación Android generada automáticamente usando Apache Cordova. La aplicación contiene todos los archivos originales de la página web ULTRAGOL, incluyendo HTML, CSS, JavaScript, imágenes y assets, permitiendo que funcione de forma local en tu dispositivo.

## Información de la Aplicación

- **Nombre:** ULTRAGOL
- **ID de la App:** com.l3ho.ultragol
- **Versión:** 1.0.0
- **Plataforma:** Android (API 22+)

## APK Generada

La APK está lista para instalar en dispositivos Android:

📱 **Archivo APK:** `ultragol.apk`
📦 **Tamaño:** 33 MB
📍 **Ubicación completa:** `/home/runner/workspace/ultragol.apk`

## Cómo Descargar e Instalar

### Descargar la APK

1. En Replit, busca el archivo `ultragol.apk` en el explorador de archivos
2. Haz clic derecho sobre el archivo
3. Selecciona "Download" para descargar la APK a tu computadora

### Instalar en Android

1. Transfiere el archivo `ultragol.apk` a tu dispositivo Android
2. En tu dispositivo Android, ve a **Configuración > Seguridad**
3. Habilita **"Fuentes desconocidas"** o **"Instalar aplicaciones desconocidas"**
4. Abre el archivo `ultragol.apk` desde tu explorador de archivos
5. Toca **"Instalar"**
6. Una vez instalada, abre la aplicación ULTRAGOL

## Cómo Regenerar la APK

Si necesitas regenerar la APK con cambios:

1. El workflow **"Build APK"** está configurado y se ejecutará automáticamente
2. Alternativamente, puedes ejecutar manualmente:

```bash
chmod +x build-apk.sh
./build-apk.sh
```

3. El proceso toma aproximadamente 2-3 minutos
4. La nueva APK se guardará automáticamente como `ultragol.apk`

## Detalles Técnicos

### Tecnologías Utilizadas

- **Apache Cordova:** Framework para crear aplicaciones móviles híbridas
- **Android SDK:** Herramientas de desarrollo de Android
- **Java/OpenJDK 17:** Para la compilación
- **Gradle:** Sistema de construcción

### Configuración del Proyecto

El proyecto Cordova incluye:

- **Archivos web completos:** Todos los archivos HTML, CSS, JS del repositorio original
- **Assets:** Todas las imágenes, iconos y recursos de la web
- **config.xml:** Configuración con todos los permisos necesarios
- **Icono:** Icono genérico con las letras "UG"

### Permisos Configurados

La aplicación tiene permisos para:
- Acceder a cualquier URL (HTTP/HTTPS)
- Abrir enlaces externos
- Realizar llamadas telefónicas (tel:)
- Enviar SMS (sms:)
- Enviar emails (mailto:)
- Abrir mapas (geo:)

## Estructura del Proyecto

```
.
├── build-apk.sh           # Script de construcción automatizado
├── ultragol.apk          # APK generada (lista para instalar)
├── ultragol-app/         # Proyecto Cordova completo
│   ├── www/              # Archivos web
│   ├── platforms/        # Código nativo Android
│   └── config.xml        # Configuración de Cordova
└── README.md             # Este archivo
```

## Modo de Compilación

La APK se compila en **modo debug** para evitar problemas con la descarga de Gradle y permitir instalación directa sin firma digital de producción.

Para una versión de producción (Google Play Store), necesitarías:
- Compilar en modo release: `cordova build android --release`
- Firmar la APK con una clave de firma
- Optimizar la APK con zipalign

## Solución de Problemas

### La instalación falla en Android

- Asegúrate de habilitar "Fuentes desconocidas" en la configuración de seguridad
- En Android 8.0+, el permiso es por aplicación (permite instalación desde el navegador/explorador de archivos)

### La aplicación no carga correctamente

- La aplicación contiene todos los archivos localmente
- Algunas funciones pueden requerir internet (Firebase, APIs externas)
- Verifica que los permisos de la app estén habilitados

### Error al compilar

- Ejecuta nuevamente el workflow "Build APK"
- Si persiste, revisa los logs del workflow para más detalles

## Contacto

Para soporte o consultas sobre la aplicación web original, visita: https://ultragol-l3ho.com.mx
