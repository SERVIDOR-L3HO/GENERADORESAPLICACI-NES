# ULTRAGOL - Generador de APK Android

## Descripción del Proyecto

Sistema automatizado para generar aplicaciones Android (APK) a partir de páginas web usando Apache Cordova. El proyecto convierte la página web https://ultragol-l3ho.com.mx/index.html en una aplicación Android nativa instalable.

## Estado Actual

✅ **Proyecto Completado** - La APK se ha generado exitosamente y está lista para descargar e instalar en dispositivos Android.

- **APK Generada:** `ultragol.apk` (3.5 MB)
- **Ubicación:** `/home/runner/workspace/ultragol.apk`
- **Última Compilación:** Octubre 13, 2025

## Estructura del Proyecto

```
.
├── build-apk.sh           # Script automatizado de construcción
├── ultragol.apk          # APK Android generada
├── README.md             # Documentación para el usuario
├── replit.md             # Este archivo (información del proyecto)
└── ultragol-app/         # Proyecto Cordova (generado automáticamente)
    ├── www/              # Archivos web (index.html con iframe)
    ├── platforms/        # Código nativo Android
    └── config.xml        # Configuración de Cordova
```

## Detalles de la Aplicación

- **Nombre:** ULTRAGOL
- **ID:** com.l3ho.ultragol
- **Versión:** 1.0.0
- **SDK Mínimo:** Android API 22 (Android 5.0 Lollipop)
- **SDK Objetivo:** Android API 35 (Android 15)

## Tecnologías Utilizadas

- **Apache Cordova 12.x:** Framework para aplicaciones móviles híbridas
- **Android SDK Build Tools 35.0.0:** Herramientas de compilación Android
- **OpenJDK 17:** Compilador Java
- **Gradle 8.13:** Sistema de construcción
- **Node.js 20:** Runtime JavaScript

## Workflow Configurado

### Build APK
- **Comando:** `bash -c "chmod +x build-apk.sh && ./build-apk.sh"`
- **Tipo:** Console
- **Duración:** ~2-3 minutos
- **Salida:** APK debug de 3.5 MB

El workflow ejecuta automáticamente:
1. Instalación de Cordova
2. Descarga y configuración del Android SDK
3. Creación del proyecto Cordova
4. Configuración de permisos y recursos
5. Compilación de la APK
6. Copia de la APK a la raíz del proyecto

## Cambios Recientes

### Octubre 13, 2025
- ✅ Instalación de dependencias (Node.js, OpenJDK, Android SDK)
- ✅ Creación del script de construcción automatizado
- ✅ Configuración del proyecto Cordova con permisos completos
- ✅ Generación exitosa de la APK (3.5 MB)
- ✅ Configuración del workflow automático
- ✅ Mejoras de robustez en el script (verificación de errores, detección de plataforma)
- ✅ Documentación completa (README.md)

## Arquitectura de la Aplicación

### Frontend
- **index.html:** Contiene un iframe que carga la página web remota
- **Estilo:** CSS embebido para pantalla completa sin márgenes
- **Seguridad:** Content Security Policy configurada para permitir cualquier origen

### Configuración
- **Permisos:** Acceso completo a internet, navegación ilimitada
- **Intents:** Soporta tel:, sms:, mailto:, geo:, market:
- **Orientación:** Automática (portrait/landscape)

### Icono
- Icono genérico SVG con las letras "UG" en verde (#4CAF50)
- Fondo verde con círculo blanco

## Proceso de Construcción

El script `build-apk.sh` realiza los siguientes pasos:

1. **Instalación de Cordova:** npm install -g cordova
2. **Configuración de Java:** Verificación de OpenJDK 17
3. **Variables de entorno:** JAVA_HOME, ANDROID_HOME, ANDROID_SDK_ROOT
4. **Descarga de SDK:** Android Command Line Tools
5. **Instalación de componentes:** platform-tools, build-tools, SDK platform
6. **Limpieza:** Eliminación de proyectos anteriores
7. **Creación del proyecto:** cordova create con ID y nombre específicos
8. **Configuración web:** index.html con iframe a la web original
9. **Permisos:** config.xml con acceso completo
10. **Icono:** Generación de icono SVG
11. **Plataforma Android:** Verificación y adición si es necesario
12. **Compilación:** Gradle build en modo debug
13. **Copia:** APK movida a la raíz del proyecto
14. **Verificación:** Confirmación de que la APK existe

## Características del Script

- ✅ Completamente automatizado (sin intervención manual)
- ✅ Verificación de errores en cada paso
- ✅ Manejo inteligente de plataformas ya instaladas
- ✅ Limpieza automática de proyectos anteriores
- ✅ Compilación reproducible
- ✅ Validación de la APK generada
- ✅ Variables de entorno configuradas automáticamente

## Preferencias del Usuario

- **Idioma:** Español
- **Framework:** Apache Cordova (preferido para conversión web a app)
- **Modo de compilación:** Debug (para instalación directa sin firma)
- **Automatización:** Completamente automatizado, ejecutable con un comando

## Notas Importantes

### Dependencia de Internet
La aplicación requiere conexión a internet para funcionar, ya que carga el contenido desde https://ultragol-l3ho.com.mx/index.html mediante un iframe.

### Modo Debug vs Release
El proyecto genera APKs en modo debug por defecto para facilitar la instalación directa. Para producción (Google Play Store), se requeriría:
- Compilación en modo release
- Firma digital con keystore
- Optimización con zipalign
- Cumplimiento con políticas de Google Play

### Ejecuciones Repetidas
El script está diseñado para ser ejecutado múltiples veces. En cada ejecución:
- Limpia el proyecto anterior (`rm -rf ultragol-app`)
- Recrea todo desde cero
- Genera una nueva APK

### Permisos de Android
La aplicación solicita permisos para:
- Internet (requerido para cargar la web)
- Instalación desde fuentes desconocidas (para instalar la APK)

## Solución de Problemas

### Error: Platform android already added
✅ **Solucionado:** El script ahora verifica si el directorio `platforms/android` existe antes de intentar agregar la plataforma.

### Error: Build tools version mismatch
✅ **Solucionado:** Se instalan las versiones correctas (35.0.0) que coinciden con el targetSdkVersion.

### Timeout en la compilación
✅ **Solucionado:** El workflow está configurado sin límite de tiempo para permitir que Gradle complete la compilación.

## Próximos Pasos Potenciales

1. **Personalización del icono:** Reemplazar el icono genérico con el logo oficial de ULTRAGOL
2. **Modo release:** Configurar firma digital para publicación en Google Play
3. **Optimización:** Reducir el tamaño de la APK
4. **Splash screen:** Agregar pantalla de inicio personalizada
5. **Notificaciones push:** Integrar servicio de notificaciones
6. **Modo offline:** Implementar cache para funcionar sin internet

## Recursos

- **Documentación Cordova:** https://cordova.apache.org/docs/
- **Android SDK:** https://developer.android.com/studio
- **Gradle:** https://gradle.org/
- **Web Original:** https://ultragol-l3ho.com.mx/index.html

## Contacto y Soporte

Para regenerar la APK, ejecuta el workflow "Build APK" o el comando:
```bash
./build-apk.sh
```

La APK estará disponible en `/home/runner/workspace/ultragol.apk` para descarga.
