#!/bin/bash

set -e

export CI=true
export CORDOVA_TELEMETRY=0

echo "======================================"
echo "Construcción de APK Android con Cordova"
echo "======================================"

echo ""
echo "Paso 1: Instalando Cordova globalmente..."
npm install -g cordova --silent

echo ""
echo "Paso 2: Verificando instalación de Java..."
java -version

echo ""
echo "Paso 3: Configurando variables de entorno para Android..."
export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))
export ANDROID_SDK_ROOT=$HOME/android-sdk
export ANDROID_HOME=$ANDROID_SDK_ROOT
export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools

echo "JAVA_HOME: $JAVA_HOME"
echo "ANDROID_SDK_ROOT: $ANDROID_SDK_ROOT"
echo "ANDROID_HOME: $ANDROID_HOME"

echo ""
echo "Paso 4: Descargando Android SDK Command Line Tools..."
mkdir -p $ANDROID_SDK_ROOT/cmdline-tools
cd $ANDROID_SDK_ROOT/cmdline-tools
if [ ! -d "latest" ]; then
    wget -q https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip -O cmdline-tools.zip
    unzip -q cmdline-tools.zip
    mv cmdline-tools latest
    rm cmdline-tools.zip
fi

echo ""
echo "Paso 5: Instalando componentes de Android SDK..."
yes | $ANDROID_SDK_ROOT/cmdline-tools/latest/bin/sdkmanager --licenses
$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/sdkmanager "platform-tools" "platforms;android-35" "build-tools;35.0.0"

echo ""
echo "Paso 6: Volviendo al directorio del proyecto..."
cd /home/runner/workspace

echo ""
echo "Paso 7: Limpiando proyecto anterior si existe..."
rm -rf ultragol-app

echo ""
echo "Paso 8: Creando proyecto Cordova..."
cordova create ultragol-app com.l3ho.ultragol ULTRAGOL

cd ultragol-app

echo ""
echo "Paso 9: Creando index.html con iframe..."
cat > www/index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="Content-Security-Policy" content="default-src * 'unsafe-inline' 'unsafe-eval' data: gap: content:">
    <title>ULTRAGOL</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }
        html, body {
            width: 100%;
            height: 100%;
            overflow: hidden;
        }
        iframe {
            width: 100%;
            height: 100%;
            border: none;
        }
    </style>
</head>
<body>
    <iframe src="https://ultragol-l3ho.com.mx/index.html" allowfullscreen></iframe>
</body>
</html>
EOF

echo ""
echo "Paso 10: Configurando config.xml con permisos..."
cat > config.xml << 'EOF'
<?xml version='1.0' encoding='utf-8'?>
<widget id="com.l3ho.ultragol" version="1.0.0" xmlns="http://www.w3.org/ns/widgets" xmlns:cdv="http://cordova.apache.org/ns/1.0">
    <name>ULTRAGOL</name>
    <description>Aplicación web ULTRAGOL</description>
    <author email="dev@l3ho.com.mx" href="https://ultragol-l3ho.com.mx">
        L3HO Team
    </author>
    <content src="index.html" />
    <access origin="*" />
    <allow-intent href="http://*/*" />
    <allow-intent href="https://*/*" />
    <allow-intent href="tel:*" />
    <allow-intent href="sms:*" />
    <allow-intent href="mailto:*" />
    <allow-intent href="geo:*" />
    <allow-navigation href="*" />
    <platform name="android">
        <allow-intent href="market:*" />
        <preference name="android-minSdkVersion" value="22" />
        <preference name="android-targetSdkVersion" value="35" />
    </platform>
    <preference name="DisallowOverscroll" value="true" />
    <preference name="Orientation" value="default" />
</widget>
EOF

echo ""
echo "Paso 11: Creando icono genérico SVG..."
cat > www/icon.svg << 'EOF'
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
    <rect width="512" height="512" fill="#4CAF50"/>
    <circle cx="256" cy="256" r="200" fill="white"/>
    <text x="256" y="300" font-family="Arial" font-size="120" font-weight="bold" text-anchor="middle" fill="#4CAF50">UG</text>
</svg>
EOF

echo ""
echo "Paso 12: Convirtiendo SVG a PNG para el icono..."
if command -v convert &> /dev/null; then
    convert -background none www/icon.svg -resize 512x512 www/icon.png
else
    echo "ImageMagick no disponible, usando el SVG directamente"
    cp www/icon.svg www/icon.png
fi

echo ""
echo "Paso 13: Agregando plataforma Android..."
if [ ! -d "platforms/android" ]; then
    cordova platform add android
else
    echo "Plataforma Android ya está instalada (directorio platforms/android existe), continuando..."
fi

echo ""
echo "Paso 14: Compilando APK en modo debug..."
cordova build android --debug

echo ""
echo "======================================"
echo "✅ APK generada exitosamente!"
echo "======================================"
echo ""
echo "📱 Ruta de la APK:"
APK_PATH=$(find platforms/android/app/build/outputs/apk/debug -name "*.apk" | head -n 1)
if [ -n "$APK_PATH" ] && [ -f "$APK_PATH" ]; then
    FULL_PATH="/home/runner/workspace/ultragol-app/$APK_PATH"
    echo "$FULL_PATH"
    echo ""
    echo "Copiando APK a la raíz del proyecto para fácil acceso..."
    cp "$APK_PATH" /home/runner/workspace/ultragol.apk
    
    if [ -f "/home/runner/workspace/ultragol.apk" ]; then
        echo ""
        echo "✅ APK copiada exitosamente a: /home/runner/workspace/ultragol.apk"
        echo ""
        echo "Tamaño de la APK:"
        ls -lh /home/runner/workspace/ultragol.apk | awk '{print $5}'
    else
        echo "❌ Error al copiar la APK a la raíz del proyecto"
        exit 1
    fi
else
    echo "❌ No se encontró la APK generada o el archivo no existe"
    exit 1
fi

echo ""
echo "======================================"
echo "🎉 ¡Proceso completado!"
echo "======================================"
