# Chocolita Installer
Instalador para el tema base de Wordpress [Chocolita.](https://github.com/monchitonet/Chocolita)
![alt tag](https://raw.githubusercontent.com/kikeonline/chocolita-install/master/screen.gif)

### Instalación y Uso
En la [Terminal.](https://www.google.com.ni/search? q=google+search+link&oq=google+search+link&aqs=chrome..69i57j69i64.3252j0j4&sourceid=chrome&es_sm=119&ie=UTF-8#q=terminal+window&pws=1) asegurate de que estas en tu carpeta themes de Wordpress /wordpress/wp-content/themes/.

  ```shell
  $ cd /wordpress/wp-content/themes/
  ```

#### Opción 1: Ejectuar el script desde server remoto.
1. Copia y pega la siguiente linea, sigue las instrucciones.
  
  ```shell
  $ bash <(curl -s https://raw.githubusercontent.com/kikeonline/chocolita-install/master/chocolita.sh)
  ```

#### Opción 2: Ejecutuar Script localmente.
1. Baja el script con la siguiente linea.
  ```shell
  $ wget https://raw.githubusercontent.com/kikeonline/chocolita-install/master/chocolita.sh
  ```

2. Dale permisos ejecutables al script.
  ```shell
  $ sudo chmod +x chocolita.sh
  ```
  
3. Ejecutar y sigue instrucciones.
  ```shell
  $ ./chocolita.sh
  ```
  
### Contribuciones
- [Leandro Gómez](https://github.com/leogg)

Con gusto pueden clonar/forkear/pull/push para mejorar el script ✌️
