# Construimos la aplicación con las dependencias de desarrollo.
FROM node:16-alpine3.14 AS pre-build-env
WORKDIR /app
COPY package*.json ./

RUN npm install --only=development

COPY . .
RUN npm run build

# Instalamos solamente las dependencias necesaria para la ejecución de la aplicación.
FROM node:16-alpine3.14 AS build-env
WORKDIR /app
COPY package*.json ./

RUN npm install --only=production

# Copiamos la carpeta dist construida en la imagen PRE-BUILD-ENV.
COPY --from=pre-build-env /app/dist ./dist
# Este paso podemos omitirlo, ya que solamente necesitas la carpeta dist para ejecutar la aplicación,
# pero tal vez tu aplicación necesite algunos archivos que tienes en la raíz, si este es el caso solamente copia esos archivos.
COPY . . 

# Volvemos a copiar la aplicación, pero esta vez en la imagen Distroless.
FROM gcr.io/distroless/nodejs:16
USER nonroot:nonroot
WORKDIR /app
COPY --from=build-env --chown=nonroot:nonroot /app /app
CMD ["dist/index.js"]
