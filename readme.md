

# .NET 8
## Gerando certificado para rodar em https:
dotnet dev-certs https --trust

## Função em PS para debugar/rodar em ambiente de desenvolvimento sem o hot-reload
function dotnet-run{dotnet watch --no-hot-reload}

## Para gerar arquivos de debug/build no VSCode

Pressionar F1 > Digitar ".NET" > Escolher a opção "Generate Assets For Build and Debug"