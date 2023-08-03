FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 As base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/core/sdk:3.1 As build
WORKDIR /src
COPY ["dotnet-made-easy-with-docker.csproj", "./"]
RUN dotnet restore "./dotnet-made-easy-with-docker.csproj"
COPY . .
RUN dotnet build "dotnet-made-easy-with-docker.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "dotnet-made-easy-with-docker.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "dotnet-made-easy-with-docker.dll"]
