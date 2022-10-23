import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:encrypt/encrypt.dart' as e;
import 'package:encrypt/encrypt.dart';
import 'package:file_cryptor/file_cryptor.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dynakrypt/controllers/authController.dart';
import 'package:dynakrypt/controllers/drawerController.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../main.dart';
// import 'package:shared_preferences/shared_preferences.dart';

enum Character {
  Type2,
  Type3,
}

class EncryptController extends GetxController {
  Rx<Character> character = Character.Type2.obs;

  RxInt seconds = 0.obs;
  e.Encrypted? encrypted;
  TextEditingController secondsController = TextEditingController();
  File? pickedFile;
  TextEditingController textController = TextEditingController();
  RxString encryptedText = ''.obs;
  RxString decryptedText = ''.obs;

  String? encryptedDirectory;
  RxList<MyFile> listforEncrypted = <MyFile>[].obs;
  List<FileSystemEntity> encryptedFiles = <FileSystemEntity>[];
// it will be the path for creating and reading files.
  Directory? path;
  // selected encrypted file
  MyFile? selected;
// this is to change the timer

  @override
  void onInit() async {
    super.onInit();
    // prefs = await SharedPreferences.getInstance();
    character.value = getType();
    seconds.value = getSeconds();
    await createFolder();
    encryptedFiles = await dirContents(path!);
    listforEncrypted.value = [];
    listforEncrypted.refresh();
    encryptedFiles.forEach((element) {
      listforEncrypted.add(MyFile(file: File(element.path)));
    });
  }

  void openFile(String p) async {
    String fn = getFileName(p);
    var parts = fn.split('-');
    var last = parts.last;
    int seconds = 4;
    var sp = last.split('.');

    try {
      seconds = int.parse(sp[0]);
      Timer(Duration(seconds: seconds + 4), () async {
        print("The file delete operation");
        print("..................");print(p);
        print("The file delete operation");
        print("..................");
        await deleteFile(p);
      });
      await OpenFilex.open(p);
      // Timer(Duration(seconds: seconds + 4), () async {
      //   await deleteFile(p);
      // });
    } catch (e) {
      print(e.toString());
    }

    // await /OpenFilex.open(p);
  }

  deleteFile(String p) async {
    File ffff = File(p);
    try {
      await ffff.delete();
      // onInit();
      Get.snackbar('Success', 'The file has been deleted');
    } catch (e) {
      print(e.toString());
    }
  }

  void f(String p) async {
    await OpenFilex.open(p);
  }

  changeType(Character c, int type) {
    character.value = c;
    box.put('typee', type);
    update();
  }

  Character getType() {
    int a = box.get('typee', defaultValue: 0);
    Character c = a == 1 ? Character.Type2 : Character.Type3;
    return c;
  }

  int getSeconds() {
    return box.get('seconds') ?? 0;
  }

  void setSeconds(int a) async {
    seconds.value = a;
    await box.put('seconds', a);

    update();
  }

  // this is to create a folder and ask for permissions.
  Future<String> createFolder() async {
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userName = box.get('currentUser', defaultValue: null);

    if (userName != null) {
      final Directory _appDocDir=await getApplicationDocumentsDirectory();

      path = Directory("${_appDocDir.path}/$userName/");
      // var status = await Permission.storage.status;
      // // var s = await Permission.accessMediaLocation.status;
      // // var m = await Permission.manageExternalStorage.request();

      // if (!status.isGranted) {
      //   await Permission.storage.request();
      //   await Permission.accessMediaLocation.request();
      //   await Permission.manageExternalStorage.request();
      // }
      if ((await path!.exists())) {
        print("ios path exisr");
        print("ios path exisr");print("ios path exisr");
        return path!.path;
      } else {
        await path!.create();

        return path!.path;
      }
    } else {
      Get.snackbar('Error', 'Sorry there was a problem');

      return "storage/emulated/0/Dynakrypt/";
    }
  }

  String getFileNameReverse(String f) {
    List names = f.split('.');
    String name = '';
    name = names[0] + "." + names[1];
    return name;
  }

  String getFileName(String dir) {
    List parts = dir.split('/');
    String part = parts.last;
    return part;
  }

  void setSelected(int i) {
    listforEncrypted[i].isSelected = true;
    selected = listforEncrypted[i];
    for (int j = 0; j < listforEncrypted.length; j++) {
      if (j != i) {
        listforEncrypted[j].isSelected = false;
      }
    }
    listforEncrypted.refresh();
  }

// this is to get a list of files from the app folder.
  Future<List<FileSystemEntity>> dirContents(Directory dir) {
    var files = <FileSystemEntity>[];
    var completer = Completer<List<FileSystemEntity>>();
    var lister = dir.list(recursive: false);
    lister.listen((file) => files.add(file),
        // should also register onError
        onDone: () => completer.complete(files));
    return completer.future;
  }
  // void listofFiles() async {
  //   decryptedDirectory = Directory('storage/emulated/0/Impossible').path;

  //   files.value = Directory('storage/emulated/0/Impossible/')
  //       .listSync(); //use your folder name insted of resume.
  //   files.refresh();
  // }
// String getFileName()

  pickAndDecrypt() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result!.files.single.path!.contains('.txt')) {
      if (result != null) {
        File file = File(result.files.single.path!);
        var bytes = file.readAsBytesSync();
        List pathpieces = result.files.single.path!.split('/');
        String p = '';
        for (int i = 0; i < pathpieces.length - 1; i++) {
          p += pathpieces[i];

          if (i < pathpieces.length - 2) {
            p += '/';
          }
        }
        print("decrypting texttt");
        String? userName = box.get('currentUser', defaultValue: null);

        // if (userName != null) {
        //   path = Directory("storage/emulated/0/Dynakrypt/$userName/");
        print("...............");
        print(userName.toString());
        print(getFileName(result.files.single.path!));
        print("decrypting textt pathhht");
        print("...............");

        File textFile = File(await createFolder() +
            getFileNameReverse(getFileName(result.files.single.path!)));

        textFile.writeAsBytesSync(bytes);

        final key = e.Key.fromUtf8('11223344556677889911223344556677');
        final iv = e.IV.fromLength(16);
        final encrypter = e.Encrypter(e.AES(key));

        try {
          var bbbb = textFile.readAsStringSync();

          // final key = e.Key.fromUtf8('11223344556677889911223344556677');
          // final iv = e.IV.fromLength(16);
          // final encrypter = e.Encrypter(e.AES(key));
          String dec = encrypter.decrypt(Encrypted.fromBase64(bbbb), iv: iv);
          File decryptedFilee = File(await createFolder() +
              getFileNameReverse(getFileName(result.files.single.path!)));
          decryptedFilee.writeAsString(dec);
          // await deleteFile(path);

          //   path = Directory("storage/emulated/0/Dynakrypt/$userName/");
          print("......trying to delete try");
          print(userName.toString());
          print(getFileName(result.files.single.path!));


          Get.snackbar('Success', 'Your file has successfully been decrypted');
          // openFile(newfile.path);


        } catch (e) {
          var bbbb = textFile.readAsBytes();

          // final key = e.Key.fromUtf8('11223344556677889911223344556677');
          // final iv = e.IV.fromLength(16);
          // final encrypter = e.Encrypter(e.AES(key));
          // String dec = encrypter.decrypt(bbbb, iv: iv);
          // File decryptedFilee = File(await createFolder() +
          //     getFileNameReverse(getFileName(result.files.single.path!)));
          // decryptedFilee.writeAsString(dec);
          FileCryptor fileCryptor = FileCryptor(
              key: '11223344556677889911223344556677', iv: 16, dir: p);
          File decFile = await fileCryptor.decrypt(
              inputFile: getFileName(result.files.single.path!),
              outputFile:
              getFileNameReverse(getFileName(result.files.single.path!)));
          File newfile = decFile.copySync(await createFolder() +
              getFileNameReverse(getFileName(result.files.single.path!)));
          //   path = Directory("storage/emulated/0/Dynakrypt/$userName/");
          print("......trying to delete catch");
          print(userName.toString());
          print(getFileName(result.files.single.path!));
          String fn = getFileName(result.files.single.path!);
          var parts = fn.split('-');
          var last = parts.last;
          int seconds = 4;
          var sp = last.split('.');
          print("file should delete in ");
          // print(int.parse(sp[0]));
          print("last paarts $last");

          Get.snackbar('Success', 'Your file has successfully been decrypted');
          openFile(newfile.path);

          try {
            seconds = int.parse(sp[0]);
            Timer(Duration(seconds: seconds + 4), () async {
              print("The text file delete operation");
              print("..................");print(p);
              print("The text file delete operation");
              print("..................");
              final Directory _appDocDir=await getApplicationDocumentsDirectory();

              path = Directory("${_appDocDir.path}/$userName/");

              await deleteFile(path.toString()+getFileName(result.files.single.path!));

            });
            // Timer(Duration(seconds: seconds + 4), () async {
            //   await deleteFile(p);
            // });
          } catch (e) {
            print(e.toString());
          }
        }
      }
    } else {
      if (result != null) {
        String pathhh = result.files.single.path!;
        // var rr = pathhh.split('-');
        // if (!rr[rr.length - 1].contains('D')) {
        File file = File(result.files.single.path!);
        var bytes = file.readAsBytesSync();
        List pathpieces = result.files.single.path!.split('/');
        String p = '';
        for (int i = 0; i < pathpieces.length - 1; i++) {
          p += pathpieces[i];

          if (i < pathpieces.length - 2) {
            p += '/';
          }
        }
        try {
          FileCryptor fileCryptor = FileCryptor(
              key: '11223344556677889911223344556677', iv: 16, dir: p);
          File decFile = await fileCryptor.decrypt(
              inputFile: getFileName(result.files.single.path!),
              outputFile:
              getFileNameReverse(getFileName(result.files.single.path!)));
          File newfile = decFile.copySync(await createFolder() +
              getFileNameReverse(getFileName(result.files.single.path!)));
          openFile(newfile.path);
          // String newPath = newfile.path;
          // String newfilename = getFileName(newPath);
          // var newfilenamepart = newfilename.split('-');

          Get.snackbar('Success', 'Your file has successfully been decrypted');
        } catch (e) {
          Get.snackbar('Sorry', "Sorry this file can't be decrypted");
        }
      } else {
        Get.snackbar('Error', 'No file selected');
      }
    }
    // }
  }

  selectAndDecryptFile(String pathOfFile) async {
    File file = File(pathOfFile);
    var bytes = file.readAsBytesSync();
    List pathpieces = pathOfFile.split('/');
    String p = '';
    for (int i = 0; i < pathpieces.length - 1; i++) {
      p += pathpieces[i];

      if (i < pathpieces.length - 2) {
        p += '/';
      }
    }
    FileCryptor fileCryptor =
    FileCryptor(key: '11223344556677889911223344556677', iv: 16, dir: p);
    File decFile = await fileCryptor.decrypt(
        inputFile: getFileName(pathOfFile),
        outputFile: getFileNameReverse(getFileName(pathOfFile)));
  }

// this is for  encryption of files.

  void pickandencrypt(Character c) {
    // if (c == Character.Type1) {
    //   pickAndEncryptFile1();
    // }

    if (c == Character.Type2) {
      pickAndEncryptFile2();
    }
    if (c == Character.Type3) {
      pickAndEncryptFileType3();
    }
  }

  pickAndEncryptFile1() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      pickedFile = File(result.files.single.path!);

      var bytes = pickedFile!.readAsBytesSync();
      final key = e.Key.fromUtf8('11223344556677889911223344556688');
      final iv = e.IV.fromLength(16);
      final encrypter = e.Encrypter(e.AES(key));
      // encrypter.encryptBytes(input)
      String zeros = '';
      for (int i = 0; i < 100000; i++) {
        zeros += '0';
      }
      encrypted = encrypter.encryptBytes(zeros.codeUnits, iv: iv);
      String fileName = getFileName(pickedFile!.path);
      // var sss = pickedFile!.path.split('.');
      // String fileName = sss[0] + '.' + '.txt';
      // if (c == Character.Type2) {
      //   var names = fileName.split('.');
      //   fileName = names[0] + '-D' + "." + names[1];
      // }
      // if (c == Character.Type3) {
      //   var names = fileName.split('.');
      //   fileName = names[0] + '-' + seconds.toString() + '.' + names[1];
      // }
      try {
        File file = File(await createFolder() + fileName + '.aes');
        file.writeAsBytesSync(encrypted!.bytes);
        Get.snackbar('Success',
            'Your File has been saved at ${file.absolute.toString()}',
            duration: Duration(seconds: 3), backgroundColor: Colors.white);
      } catch (e) {}
    } else {
      Get.snackbar('0 Files', '0 Files Selected');
    }
  }

  pickAndEncryptFile2() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      pickedFile = File(result.files.single.path!);
      String zeros = '';
      for (int i = 0; i < 100000; i++) {
        zeros += '0';
      }
      var bytes = zeros.codeUnits;
      // var bytes = pickedFile!.readAsBytesSync();
      final key = e.Key.fromUtf8('11223344556677889911223344556677');
      final iv = e.IV.fromLength(16);
      final encrypter = e.Encrypter(e.AES(key));
      // encrypter.encryptBytes(input)

      encrypted = encrypter.encryptBytes(bytes, iv: iv);
      // String fileName = getFileName(pickedFile!.path);
      var sss = pickedFile!.path.split('/');
      var last = sss.last;
      var vvv = last.split('.');

      String fileName = vvv[0] + '.' + 'txt';

      // if (c == Character.Type2) {
      //   var names = fileName.split('.');
      //   fileName = names[0] + '-D' + "." + names[1];
      // }
      // if (c == Character.Type3) {
      //   var names = fileName.split('.');
      //   fileName = names[0] + '-' + seconds.toString() + '.' + names[1];
      // }
      try {
        File file = File(await createFolder() + fileName + '.aes');

        file.writeAsBytesSync(encrypted!.bytes);
        Get.snackbar('Success',
            'Your File has been saved at ${file.absolute.toString()}',
            duration: Duration(seconds: 3), backgroundColor: Colors.white);
      } catch (e) {
        printInfo(info: e.toString());
      }
    } else {
      Get.snackbar('0 Files', '0 Files Selected');
    }
  }

  pickAndEncryptFileType3() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      pickedFile = File(result.files.single.path!);

      var bytes = pickedFile!.readAsBytesSync();
      final key = e.Key.fromUtf8('11223344556677889911223344556677');
      final iv = e.IV.fromLength(16);
      final encrypter = e.Encrypter(e.AES(key));
      // encrypter.encryptBytes(input)

      encrypted = encrypter.encryptBytes(bytes, iv: iv);
      String fileName = getFileName(pickedFile!.path);
      var names = fileName.split('.');
      fileName = names[0] + '-' + seconds.toString() + '.' + names[1];
      try {
        File file = File(await createFolder() + fileName + '.aes');

        file.writeAsBytesSync(encrypted!.bytes);
        Get.snackbar('Success',
            'Your File has been saved at ${file.absolute.toString()}',
            duration: Duration(seconds: 3), backgroundColor: Colors.white);
      } catch (e) {
        printInfo(info: e.toString());
      }
    } else {
      Get.snackbar('0 Files', '0 Files Selected');
    }
  }

  pickAndEncryptFileSimply(Character c) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      pickedFile = File(result.files.single.path!);

      var bytes = pickedFile!.readAsBytesSync();
      final key = e.Key.fromUtf8('11223344556677889911223344556677');
      final iv = e.IV.fromLength(16);
      final encrypter = e.Encrypter(e.AES(key));
      // encrypter.encryptBytes(input)

      encrypted = encrypter.encryptBytes(bytes, iv: iv);
      String fileName = getFileName(pickedFile!.path);
      try {
        File file = File(await createFolder() + fileName + '.aes');

        file.writeAsBytesSync(encrypted!.bytes);
        Get.snackbar('Success',
            'Your File has been saved at ${file.absolute.toString()}',
            duration: Duration(seconds: 3), backgroundColor: Colors.white);
      } catch (e) {}
    } else {
      Get.snackbar('0 Files', '0 Files Selected');
    }
  }

  // this is for text encryption and decryption
  void encryptText() async {
    final key = e.Key.fromUtf8('11223344556677889911223344556677');
    final iv = e.IV.fromLength(16);
    final encrypter = e.Encrypter(e.AES(key));
    // encrypter.encryptBytes(input)

    encrypted = encrypter.encrypt(textController.text, iv: iv);
    encryptedText.value = encrypted!.base64;

    var bytes = encryptedText.value.codeUnits;

    File file = File(await createFolder() +
        'text' +
        DateTime.now().millisecondsSinceEpoch.toString() +
        '.txt' +
        '.aes');
    file.writeAsBytesSync(bytes);
    Get.snackbar(
        'Success', 'Your file has successfully has been saved at ${file.path}');

    update();
  }

  void decryptText() {
    final key = e.Key.fromUtf8('11223344556677889911223344556677');
    final iv = e.IV.fromLength(16);
    final encrypter = e.Encrypter(e.AES(key));

    final decrypted = encrypter.decrypt(encrypted!, iv: iv);
    decryptedText.value = decrypted;

    update();
  }

//   void deleteUserFolder(String name) {
//     Directory d = Directory('storage/emulated/0/Impossible/$name/');
//     d.deleteSync(recursive: true);
//   }
}

class MyFile {
  bool isSelected;
  File file;
  MyFile({required this.file, this.isSelected = false});
}
