FROM mcr.microsoft.com/dotnet/runtime:6.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["src/MyConsoleApp/MyConsoleApp.csproj", "MyConsoleApp/"]
RUN dotnet restore "src/MyConsoleApp/MyConsoleApp.csproj"
COPY . .
WORKDIR "/src/MyConsoleApp"
RUN dotnet build "MyConsoleApp.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "MyConsoleApp.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "MyConsoleApp.dll"]
