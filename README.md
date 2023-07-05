# emsdk-setup

> Setup emsdk for local development

The [Emscripten](https://emscripten.org/) toolchain is distributed as a standalone [Emscripten SDK](https://github.com/emscripten-core/emsdk) that allows you to compile C and C++ code to WebAssembly, which can run in web browsers.

This [emsdk-setup](https://github.com/isurfer21/emsdk-setup) project provides a single command `ems` that wraps the `emsdk` commands and prevents any conflicts with other similar commands.

## Prerequisite
Before using this project, you need to install the [emsdk](https://github.com/emscripten-core/emsdk), which is the **Emscripten SDK**. Please follow the instructions [here](https://emscripten.org/docs/getting_started/downloads.html) to install it.

## Setup
To use this project, you need to do the following steps:

1. Copy the path of the emsdk directory that you installed in the previous step. You can do this by opening a terminal or command prompt and typing:

   ```
   cd emsdk
   pwd
   ```

   This will print the full path of the emsdk directory. Copy this path to your clipboard.

2. Add the copied path to the system environment variable with the name `EMSDK`. Depending on your operating system, you can do this in different ways:

   - On Windows, you can open the Control Panel, go to System and Security, then System, then Advanced System Settings, then Environment Variables. Click on New under System Variables, enter `EMSDK` as the variable name and paste the path as the variable value. Click OK to save the changes.

   - On Linux or macOS, you can open a terminal and type:

      ```
      export EMSDK=/path/to/emsdk
      ```

      Replace `/path/to/emsdk` with the path that you copied in the previous step. You can also add this line to your `.bashrc` or `.profile` file to make it permanent.

3. Copy the files `ems.cmd` and `ems.ps1` from this project to a directory that is in your system environment variable `PATH` on Windows whereas copy `ems.sh` file on Linux/macOS to export in global environment variable. You can do this in any of these ways:

   - Add the `emsdk-setup` directory path to your `PATH`. To do this, you can follow the same steps as in step 2, but use `PATH` as the variable name and append the directory path to the existing value, separated by a semicolon on Windows or a colon on Linux/macOS.

   - Copy these files to a directory that is already in your `PATH`. You can find out which directories are in your `PATH` by typing:

      ```
      echo $PATH
      ```

      This will print a list of directories separated by semicolons on Windows or colons on Linux/macOS. Choose one of these directories and copy the files there.

   - Copy these files to the `system32` folder on Windows or the `/bin` directory on Linux/macOS. These directories are usually in your `PATH` by default, so you don't need to modify anything. However, you may need administrative privileges to copy files there.

      - The full path of the `system32` dir on Windows is `C:\Windows\System32`. This directory contains many system files and executables that are essential for Windows to function properly. It is also included in the `PATH` environment variable, which means that you can run any executable in this directory from any location in the command prompt.

      - The full path of the `bin` directory on Linux and macOS is `/bin`. This directory contains many common commands and utilities that are used by the operating system and users. It is also included in the `PATH` environment variable, which means that you can run any executable in this directory from any location in the terminal.

###  On macOS / Linux

You need to convert a `ems.sh` file to executable on Mac or Linux. 

So, remove the extension from `ems.sh` and change the **permissions** of the file to make it executable by using the `chmod` command. 

For example, if you want to make the file executable only by yourself, you can write:

```bash
mv ems.sh ems
chmod u+x ems
```

If you want to make the file executable by anyone on the system, you can write:

```bash
mv ems.sh ems
chmod a+x ems
```

After doing these steps, you can run the script by typing:

```bash
./ems
```

or by double-clicking it on Mac.

## Usage
To use emsdk, you normally need to use commands like `emcc` or `em++`, for example:

```
emcc hello.c -o hello.html
``` 

or 

```
em++ hello.cpp -o hello.html
```

These commands compile your C or C++ code to WebAssembly and generate an HTML file that can run it in a browser.

With this project, you just need to prefix these commands with `ems`, for example:

```
ems emcc hello.c -o hello.html
``` 

or 

```
ems em++ hello.cpp -o hello.html
```

This way, you can use all the `emsdk` commands with the `ems` prefix. This ensures that you are using the correct version of emsdk and avoids any conflicts with other commands.