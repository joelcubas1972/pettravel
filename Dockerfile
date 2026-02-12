FROM eclipse-temurin:11-jdk

WORKDIR /app

# Instalar Ant
RUN apt-get update && apt-get install -y ant && rm -rf /var/lib/apt/lists/*

# Copiar todo el proyecto
COPY . .

# Compilar
RUN ant clean dist

# Exponer puerto
EXPOSE $PORT

# Comando para ejecutar
CMD java -jar lib/webapp-runner.jar --port $PORT dist/*.war
