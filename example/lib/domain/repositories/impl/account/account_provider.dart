import 'dart:io';

import 'package:example/domain/domain.dart';
import 'package:example/domain/entity/menu_model.dart';
import 'package:flutter_eden/eden.dart';

abstract class IAccountProvider {
  Future<Response<MenuModel?>> getMenuList();
  Future<Response<MenuModel?>> uploadImage(
    String filePath,
    Progress? uploadProgress,
  );
}

class AccountProvider extends EdenBaseProvider implements IAccountProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder =
        (val) => MenuModel.fromJson(val as Map<String, dynamic>);
    super.onInit();
  }

  @override
  Future<Response<MenuModel?>> getMenuList() {
    final path = appList.menuList;
    return get(path);
  }

  @override
  Future<Response<MenuModel?>> uploadImage(
    String filePath,
    Progress? uploadProgress,
  ) {
    final file = File(filePath);

    // 创建 multipart 请求
    final headers = {
      'Content-Type': 'multipart/form-data',
    };

    // 'file_key_name' 是你的API期望的字段名，你可能需要根据实际API进行更改
    final imageUpload =
        MultipartFile(file.openRead(), filename: filePath.split("/").last);

    final formData = FormData({
      'file_key_name': imageUpload,
    });

    return post(
      '/upload-endpoint',
      formData,
      headers: headers,
      uploadProgress: uploadProgress,
    ); // '/upload-endpoint' 是上传图片的API路径，你可能需要根据实际API进行更改
  }
}
