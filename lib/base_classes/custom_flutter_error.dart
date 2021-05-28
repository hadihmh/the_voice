import 'package:flutter/foundation.dart';
import 'package:system_info/system_info.dart';

class CustomFlutterError {
  int time = 0;
  String error = "";
  String stacktrace = "";

  CustomFlutterError(
      {required this.time, required this.error, required this.stacktrace});

  CustomFlutterError.fromJson(Map<String, dynamic> json) {
    time = json['timestamp'];
    error = json['error'];
    stacktrace = json['stacktrace'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this.time;
    data['error'] = this.error;
    data['stacktrace'] = this.stacktrace;
    return data;
  }
}

class CrashModel {
  List<CustomFlutterError> crashInfo;
  CrashUserInfo userInfo;
  CrashAppInfo appInfo;
  CrashDeviceInfo deviceInfo;

  CrashModel(
      {required this.crashInfo,
      required this.userInfo,
      required this.appInfo,
      required this.deviceInfo});

  Map<String, dynamic> toJson() {
    try {
      final Map<String, dynamic> data = new Map<String, dynamic>();

      data['crash_info'] = this.crashInfo.map((v) => v.toJson()).toList();
      data['user_info'] = this.userInfo.toJson();
      data['app_info'] = this.appInfo.toJson();
      data['device_info'] = this.deviceInfo.toJson();

      return data;
    } catch (error, stacktrace) {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      debugPrint('error in convert to json $error $stacktrace');
      return data;
    }
  }
}

class CrashUserInfo {
  String id;
  String userName;

  CrashUserInfo({required this.id, required this.userName});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.id;
    data['user_name'] = this.userName;
    return data;
  }
}

class CrashAppInfo {
  String appName;
  String packageName;
  String appVersionName;
  String appVersionCode;
  String appSource;
  String dartVersion;
  String flutterVersion;

  CrashAppInfo(
      {required this.appName,
      required this.appVersionName,
      required this.appVersionCode,
      required this.appSource,
      required this.dartVersion,
      required this.flutterVersion,
      required this.packageName});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.appName;
    data['version_name'] = this.appVersionName;
    data['version_code'] = this.appVersionCode;
    data['source'] = this.appSource;
    data['dart_version'] = this.dartVersion;
    data['flutter_version'] = this.flutterVersion;
    data['package_name'] = this.packageName;
    return data;
  }
}

class CrashDeviceInfo {
  String uuid;
  String androidId;
  String osVersion;
  String brand;
  String device;
  String product;
  String hardware;
  String host;
  String model;

  String sdkVersion;
  bool isPhysicalDevice;
  String baseOS;
  String manufacturer;
  String securityPatch;
  String previewSdk;

  CrashDeviceInfo({
    required this.uuid,
    required this.osVersion,
    required this.brand,
    required this.device,
    required this.product,
    required this.hardware,
    required this.host,
    required this.model,
    required this.sdkVersion,
    required this.isPhysicalDevice,
    required this.baseOS,
    required this.androidId,
    required this.manufacturer,
    required this.securityPatch,
    required this.previewSdk,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['device_id'] = this.uuid;
    data['android_id'] = this.androidId;
    data['os_version'] = this.osVersion;
    data['brand'] = this.brand;
    data['device'] = this.device;
    data['hardware'] = this.hardware;
    data['host'] = this.host;
    data['model'] = this.model;
    data['product'] = this.product;
    data['sdk_version'] = this.sdkVersion;
    data['preview_sdk'] = this.previewSdk;
    data['is_physical_device'] = this.isPhysicalDevice;
    data['base_os'] = this.baseOS;
    data['manufacturer'] = this.manufacturer;
    data['security_patch'] = this.securityPatch;

    data['total_physical_memory'] =
        (SysInfo?.getFreePhysicalMemory()).toInt();
    data['total_virtual_memory'] =
        (SysInfo?.getTotalVirtualMemory()).toInt();
    data['total_free_physical_memory_size'] =
        (SysInfo?.getFreePhysicalMemory()).toInt();
    data['total_free_virtual_memory_size'] =
        (SysInfo?.getFreeVirtualMemory()).toInt();

    data['total_physical_memory'] = 0;
    data['total_virtual_memory'] = 0;
    data['total_virtual_memory_size'] = 0;
    data['total_free_physical_memory_size'] = 0;
    data['total_free_virtual_memory_size'] = 0;

    data['kernel_architecture'] = SysInfo.kernelArchitecture;
    data['security_patch'] = this.securityPatch;
    return data;
  }
}

const int MEGABYTE = 1024 * 1024;
