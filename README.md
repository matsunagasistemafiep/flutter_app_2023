# Aplicativo Flutter

Para baixar o projeto, vá em Code -> Download Zip.

![image](https://github.com/matsunagasistemafiep/flutter_app_2023/assets/83678675/32347416-d63a-4bfc-893f-446c11f16225)

Descopacte a pasta .zip e abra com o Visual Studio Code.

Ou se tiver uma conta no GitHub e o Git configurado no seu computador, faça o clone do projeto:

``git clone https://github.com/matsunagasistemafiep/flutter_app_2023.git``

## Execução do projeto
Executar o comando ``flutter pub get`` para instalar as dependências.

Em seguida, execute ``flutter run`` com um emulador do Android aberto.

Se for executar no Google Chrome, ``flutter run -d chrome --web-renderer=html``.

## Adicionando ícones
Gere um arquivo .png de ícone, de preferência de tamanho 1024x1024. Salve a imagem na pasta assets/icons/app-icon.png.

Executar o comando ``flutter pub add flutter_launcher_icons`` para instalar a dependência para definir o ícone do seu aplicativo.

Em seguida, inclua o atributo abaixo no arquivo pubspec.yaml:

``flutter_launcher_icons:``

``  android: "launcher_icon"``

``  ios: true``

``  image_path: "asset/icons/pet.png"``


Salve o arquivo. Execute o comando ``flutter pub get``

No final, execute o comando ``dart run flutter_launcher_icons``

### Alterando o ícone de aplicativos para Android

Veja os ícones, em diferentes resoluções sendo salvos em android\app\src\main\res

Em seguida, vá no arquivo android\app\src\main\AndroidManifest.xml. Procure pelo atributo android:label e android:icon. Defina respectivamente o nome do aplicativo e o ícone definido anteriormente (launcher_icon).

Desinstale o aplicativo do seu emulador e em seguida, execute ``flutter run``.

### Alterando o ícone de aplicativos para iOS
Essa configuração vale apenas se estiver executando o aplicativo no XCode, para iOS.

Vá em ios>Runner e abra o arquivo info.plist.

Defian o nome no parâmetro CFBundleName.

# Recursos adiconais

## URLs

`flutter pub add url_launcher` 

## Geolocalização

`flutter pub add permission_handler`

`flutter pub add geolocator`

`flutter pub add geocoding`

## Foto - câmera ou galeria

`flutter pub add image_picker`
