// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable, constant_identifier_names
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mime/mime.dart';
import '../app_globel_data.dart';
import '../common/app_labels.dart';
import '../model/app_database_response_model.dart';
import '../screens/auth/controller/auth_screen_controller.dart';
import 'app_database_exception.dart';
import 'package:module_complete/app_globel_data.dart';

class DataBaseServices {
  Future apiService(
      {GlobalKey? key,
      header,
      context,
      body,
      bool multiPart = false,
      params,
      required METHOD method,
      required baseURL,
      endpoint,
      List<String>? filePath,
      String? returnType}) async {
    var param;
    if (multiPart) {
      // param = {
      //   'uploadType': params.toString(),
      // };
      body = body;
    } else {
      param = params;
    }
    var uri =
        Uri.https(Uri.encodeFull(baseURL), Uri.encodeFull(endpoint), param);

    Map<String, String> requestHeaders = {};
    dynamic accessToken =
        await GlobelData().preferenceService.getUserAccessToken();
    if (accessToken != null) {
      dynamic accessToken =
          await GlobelData().preferenceService.getUserAccessToken();
      // dynamic refreshToken = await preferenceService.getUserRefreshToken();
      bool isExpired = JwtDecoder.isExpired(accessToken);
      if (isExpired) {
        GlobelData().authController.showNoInternetToast(
              AppLabels.sessionTimeout,
              AppLabels.sessionTimeoutText,
              buttonText: AppLabels.login,
              route: () => GlobelData().authController.logoutUser(),
            );
      }

      requestHeaders = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      };
    } else {
      requestHeaders = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
    }

    if (header != null) {
      requestHeaders.addAll(header);
    }
    if (body != null && !multiPart) {
      body = json.encode(body);
    }
    debugPrint("Header :  $requestHeaders");
    debugPrint("Body :  $body");
    debugPrint("Params :  $params");
    debugPrint("URL :  $uri");
    debugPrint("Method :  $method");

    switch (method) {
      case METHOD.GET:
        {
          var responseJson;
          try {
            final response = await http
                .get(uri, headers: requestHeaders)
                .timeout(const Duration(minutes: 3));

            responseJson = _returnResponse(response, returnType);
          } on SocketException {
            GlobelData().authController.showNoInternetToast(
                AppLabels.noInternetTitle, AppLabels.noInternetSubText);
          } on FetchDataException catch (e) {
            GlobelData().authController.showNoInternetToast(
                "Something Went wrong",
                'Try again or revisit the screen later. ERROR:$e');
            throw UnknownException("Try again or revisit the screen.");
          } catch (error) {
            GlobelData().authController.showNoInternetToast("Oops!",
                "We can't seem to find the details you are looking for.");
            // debugPrint('error in API response: $error');
          }

          return responseJson;
        }
      case METHOD.DELETE:
        {
          var responseJson;
          try {
            final response = await http.delete(uri, headers: requestHeaders);
            responseJson = _returnResponse(response, returnType);
          } on SocketException {
            GlobelData().authController.showNoInternetToast(
                AppLabels.noInternetTitle, AppLabels.noInternetSubText);
          } catch (error) {}
          return responseJson;
        }
        break;

      case METHOD.POST:
        {
          var responseJson;
          http.Response response;
          try {
            response = await http
                .post(uri, headers: requestHeaders, body: body)
                .timeout(const Duration(minutes: 3));

            responseJson = _returnResponse(response, returnType);
          } on FetchDataException catch (e) {
            GlobelData().authController.showNoInternetToast(
                "Something Went wrong",
                'Try again or revisit the screen later. ERROR:$e');
            throw UnknownException("Try again or revisit the screen.");
          } catch (error) {
            if (kDebugMode) {
              // debugPrint("Catch block:  $error");
              final loginController = Get.put(AuthScreenController());
              loginController.changeLoadingStatus(false);
              GlobelData().authController.showNoInternetToast(
                  "Something Went wrong",
                  'Try again or revisit the screen later. ERROR:$error');
            }
          }
          return responseJson;
        }

//MULTIPART API SERVICE

      case METHOD.MULTIPART:
        {
          var responseJson;
          try {
            var request = http.MultipartRequest(
              'POST',
              uri,
            );
            if (header != null) {
              request.headers.addAll(header);
            }
            if (body != null) {
              request.fields.addAll(body);
            }

            for (int i = 0; i < filePath!.length; i++) {
              final mimeTypeData =
                  lookupMimeType(filePath[i], headerBytes: [0xFF, 0xD8])
                      ?.split('/');
              request.files.add(await http.MultipartFile.fromPath(
                'recfile',
                filePath[i],
              ));
            }

            final http.StreamedResponse response =
                await request.send().timeout(const Duration(minutes: 3));
            print("response:${response.statusCode}");

            http.Response responseStreamJson =
                await http.Response.fromStream(response);

            responseJson = _returnResponse(responseStreamJson, returnType);
          } on SocketException {
            GlobelData().authController.showNoInternetToast(
                AppLabels.noInternetTitle, AppLabels.noInternetSubText);
            throw const SocketException(
                'It seems you have lost connection with internet. Check your connection setting and try again.');
          } catch (error) {
            GlobelData().authController.showNoInternetToast(
                "Something Went wrong",
                'Try again or revisit the screen later. ERROR:$error');
          }

          return responseJson;
        }

      default:
        {
          var responseJson;
          try {
            final response = await http
                .post(uri, headers: requestHeaders, body: body)
                .timeout(const Duration(minutes: 3));
            responseJson = _returnResponse(response, returnType);
          } on SocketException {
            GlobelData().authController.showNoInternetToast(
                AppLabels.noInternetTitle, AppLabels.noInternetSubText);
          } on FetchDataException catch (e) {
            GlobelData().authController.showNoInternetToast(
                "Something Went wrong",
                'Try again or revisit the screen later. ERROR:$e');
            throw UnknownException("Try again or revisit the screen.");
          }

          return responseJson;
        }
    }
  }

  dynamic _returnResponse(http.Response response, returnType) {
    debugPrint("Response statusCode($returnType): ${response.statusCode}");

    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        debugPrint("Response Result($returnType): $responseJson");
        DataBaseResponseModel wrapperApiResponseModel = DataBaseResponseModel(
            statusCode: response.statusCode, response: responseJson);
        return wrapperApiResponseModel;
      case 400:
        var responseJson = response.body.runtimeType == String
            ? response.body
            : json.decode(response.body);
        debugPrint("Response Result($returnType): $responseJson");
        DataBaseResponseModel wrapperApiResponseModel = DataBaseResponseModel(
            statusCode: response.statusCode, response: responseJson);
        return wrapperApiResponseModel;

      case 401:
        throw UnauthorisedException(response.body.toString());
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

enum METHOD {
  GET,
  PUT,
  FUTURE_GET,
  POST,
  DELETE,
  PATCH,
  MULTIPART,
}

enum RequestType { JSON, FORM }
