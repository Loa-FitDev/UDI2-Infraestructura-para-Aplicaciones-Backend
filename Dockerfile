# ==========================================
# ETAPA 1: Compilación y Publicación (Build)
# ==========================================
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src

# Copiar archivo de proyecto y restaurar dependencias
COPY *.csproj ./
RUN dotnet restore

# Copiar todo el código fuente y compilar en modo Release
COPY . ./
RUN dotnet publish -c Release -o /app/publish /p:UseAppHost=false

# ==========================================
# ETAPA 2: Entorno de Ejecución (Runtime)
# ==========================================
FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS final
WORKDIR /app

# Copiar los artefactos compilados desde la etapa 'build'
COPY --from=build /app/publish .

# Exponer el puerto configurado en Kestrel
EXPOSE 5000

# Definir la variable de entorno para que Kestrel escuche en todas las interfaces
ENV ASPNETCORE_URLS=http://+:5000  

# Comando de inicio del contenedor
ENTRYPOINT ["dotnet", "Plantilla_practica.dll"]
