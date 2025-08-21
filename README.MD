
# deepseek_bash

## Installation

Clone or copy the repository, then run the installation script:

```bash
cd deepseek_bash
chmod +x install_dp.sh
./install_dp.sh
```


This will:

- Make sure the `dp` script is executable in the current directory
- Prompt you for your DeepSeek API token and create the file `~/.deepseek_bash` if it does not exist
- Set a default history value (`HISTORY=10`)


You can then use the script with:

```bash
./dp [options] <question>
```

See below for usage examples and options.

## English

This script allows you to interact with DeepSeek's API to generate and execute bash commands, with options for confirmation, debugging, and saving output to files. It also sends your recent bash history to DeepSeek for better context.

### Parameters

- `-c` or `--confirmation`: Ask for confirmation before executing the generated command. Default is yes (press Enter).
- `-d` or `--debug`: Show the question sent to DeepSeek, the JSON payload, the API response, and the proposed command. Does not execute the command.
- `-s <file>` or `--save <file>`: Save the output of the generated command to the specified file, instead of executing it in the terminal.
- `-p <file>` or `--push <file>`: Include the content of one or more files in the question sent to DeepSeek. You can use multiple `-p` options to send several files.

### Examples

- `./dp -s README.MD list my files`
  - Sends the prompt "list my files" to DeepSeek, executes the returned command, and saves its output to `README.MD`.
- `./dp -c list files in color`
  - Asks for confirmation before executing the command suggested by DeepSeek.
- `./dp -d show disk usage`
  - Shows all debug information for the prompt "show disk usage".
- `./dp give me a sample README.MD file`
  - Asks DeepSeek for a sample README.MD file and creates it on disk if used with `-s`.
- `./dp -p README.MD summarize in one sentence in Dutch`
  - Sends the content of `README.MD` to DeepSeek and asks for a summary in Dutch. The response will be displayed as plain text (not executed as a command).
  
### Exemples

- `./dp liste fichiers de ce répertoire en couleurs et avec juste la taille lisible en Mo`
  - Liste les fichiers du répertoire courant en couleurs et affiche uniquement la taille lisible en Mo.

## Français

Ce script permet d'interagir avec l'API DeepSeek pour générer et exécuter des commandes bash, avec des options de confirmation, de debug et de sauvegarde du résultat dans un fichier. Il envoie aussi votre historique bash récent à DeepSeek pour plus de contexte.

### Paramètres

- `-c` ou `--confirmation` : Demande une confirmation avant d'exécuter la commande générée. Par défaut, oui (Entrée).
- `-d` ou `--debug` : Affiche la question envoyée à DeepSeek, le JSON, la réponse de l'API et la commande proposée. N'exécute pas la commande.
- `-s <fichier>` ou `--save <fichier>` : Sauvegarde le résultat de la commande générée dans le fichier indiqué, au lieu de l'afficher dans le terminal.
- `-p <fichier>` ou `--push <fichier>` : Ajoute le contenu d'un ou plusieurs fichiers à la question envoyée à DeepSeek. Vous pouvez utiliser plusieurs options `-p` pour envoyer plusieurs fichiers.

### Exemples

- `./dp -s README.MD liste mes fichiers`
  - Envoie le prompt "liste mes fichiers" à DeepSeek, exécute la commande retournée et sauvegarde le résultat dans `README.MD`.
- `./dp -c liste les fichiers en couleurs`
  - Demande une confirmation avant d'exécuter la commande proposée par DeepSeek.
- `./dp -d montre l'utilisation du disque`
  - Affiche toutes les informations de debug pour le prompt "montre l'utilisation du disque".
- `./dp donne moi un fichier d'exemple README.MD`
  - Demande à DeepSeek un exemple de fichier README.MD et le crée sur le disque si utilisé avec `-s`.
- `./dp -p README.MD résume moi en une phrase en néerlandais`
  - Envoie le contenu de `README.MD` à DeepSeek et demande un résumé en néerlandais. La réponse sera affichée en texte simple (non exécutée comme commande).
  
### Examples

### Exemples


## Contributing

If you would like to propose improvements or modifications to this code:

- Fork the repository on GitHub
- Create a branch with your changes
- Open a pull request describing your modifications
- Or simply open an issue to suggest ideas or report bugs

All contributions and feedback are welcome!

## Details

- The script uses the API token from `~/.deepseek_bash`.
- The number of bash history lines sent to DeepSeek is configurable via the `HISTORY` variable in `~/.deepseek_bash`.
- All output and files are created in the current directory unless a full path is specified.
- The script is compatible with bash and Linux environments.


### Example of `.deepseek_bash` file

```bash
DEEPSEEK_API_TOKEN="sk-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
HISTORY=10
```

Replace `sk-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx` with your DeepSeek API token. You can adjust `HISTORY` to change how many previous bash commands are sent for context.
