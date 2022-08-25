// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable, constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mime/mime.dart';
import 'package:module_complete/landing_screen.dart';
import '../app_globel_data.dart';
import '../common/app_labels.dart';
import '../common/app_size_helper.dart';
import '../common/custom/custom_elevated_button.dart';
import '../common/theme/app_text_style.dart';
import '../model/app_database_response_model.dart';
import 'app_database_exception.dart';
import 'package:module_complete/app_globel_data.dart';

class DataBaseServices {
  bool isDiaologOpen = false;

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
      // String? filePath,
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
        Uri.http(Uri.encodeFull(baseURL), Uri.encodeFull(endpoint), param);

    Map<String, String> requestHeaders = {};
    dynamic accessToken =
        await GlobelData().preferenceService.getUserAccessToken();

    if (accessToken != null) {
      dynamic accessToken =
          await GlobelData().preferenceService.getUserAccessToken();
      // dynamic refreshToken = await preferenceService.getUserRefreshToken();
      bool isExpired = JwtDecoder.isExpired(accessToken);

      if (isExpired) {
        showNoInternetToast(
          AppLabels.sessionTimeout,
          AppLabels.sessionTimeoutText,
          buttonText: AppLabels.login,
          route: () => GlobelData()
              .navigationRoutesHelper
              .navigateToLoginScreen(context),
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
    log("Header :  $requestHeaders");
    log("Body :  $body");
    log("URL :  $uri");
    log("Method :  $method");

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
            showNoInternetToast(
                AppLabels.noInternetTitle, AppLabels.noInternetSubText);
          } on FetchDataException catch (e) {
            showNoInternetToast("Something Went wrong",
                'Try again or revisit the screen later. ERROR:$e');
            throw UnknownException("Try again or revisit the screen.");
          } catch (error) {
            showNoInternetToast("Oops!",
                "We can't seem to find the details you are looking for.");
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
            showNoInternetToast(
                AppLabels.noInternetTitle, AppLabels.noInternetSubText);
          }
          return responseJson;
        }

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
            showNoInternetToast("Something Went wrong",
                'Try again or revisit the screen later. ERROR:$e');
            throw UnknownException("Try again or revisit the screen.");
          } catch (error) {
            if (kDebugMode) {
              // log("Catch block:  $error");
              // final loginController = Get.put(LoginController());
              // loginController.changeLoadingStatus(false);
              showNoInternetToast("Something Went wrong",
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
              log("list data:${filePath[i]}");
              // files.addAll({"files": "${await http.MultipartFile.fromPath(
              //            'recfile', imagesList.value[i])}"});

              final mimeTypeData =
                  lookupMimeType(filePath[i], headerBytes: [0xFF, 0xD8])
                      ?.split('/');
              request.files.add(await http.MultipartFile.fromPath(
                'recfile',
                filePath[i],
              ));
            }
            // final mimeTypeData =
            //     lookupMimeType(filePath!, headerBytes: [0xFF, 0xD8])
            //         ?.split('/');
            // request.files.add(await http.MultipartFile.fromPath(
            //   'recfile',
            //   filePath,
            // ));
            log("Request : $request");
            log("Request fields: ${request.fields}");
            log("Request files: ${request.files}");
            final http.StreamedResponse response =
                await request.send().timeout(const Duration(minutes: 3));
            log("response:${response.statusCode}");

            http.Response responseStreamJson =
                await http.Response.fromStream(response);

            responseJson = _returnResponse(responseStreamJson, returnType);
          } on SocketException {
            showNoInternetToast(
                AppLabels.noInternetTitle, AppLabels.noInternetSubText);
            throw const SocketException(
                'It seems you have lost connection with internet. Check your connection setting and try again.');
          } catch (error) {
            log(error.toString());
            showNoInternetToast("Something Went wrong",
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
            showNoInternetToast(
                AppLabels.noInternetTitle, AppLabels.noInternetSubText);
          } on FetchDataException catch (e) {
            showNoInternetToast("Something Went wrong",
                'Try again or revisit the screen later. ERROR:$e');
            throw UnknownException("Try again or revisit the screen.");
          }

          return responseJson;
        }
    }
  }

  dynamic _returnResponse(http.Response response, returnType) {
    log("Response statusCode($returnType): ${response.statusCode}");

    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        log("Response Result($returnType): $responseJson");
        DataBaseResponseModel dataBaseResponseModel = DataBaseResponseModel(
            statusCode: response.statusCode, response: responseJson);
        return dataBaseResponseModel;
      case 400:
        var responseJson = response.body.runtimeType == String
            ? response.body
            : json.decode(response.body);
        log("Response Result($returnType): $responseJson");
        DataBaseResponseModel dataBaseResponseModel = DataBaseResponseModel(
            statusCode: response.statusCode, response: responseJson);
        return dataBaseResponseModel;

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

  showNoInternetToast(String message, String subText,
      {route, String? buttonText}) {
    // set it `true` since dialog is being displayed
    log("isDiaologOpen:$isDiaologOpen");
    showDiologue(message, subText, route: route, buttonText: buttonText);
  }

  showDiologue(String message, String subText, {route, String? buttonText}) {
    isDiaologOpen = true;
    Get.defaultDialog(
        title: message,
        middleText: subText,
        barrierDismissible: false,
        titleStyle: TextStyles.headingTextStyle3,
        middleTextStyle: TextStyles.textDark2TextStyle1,
        contentPadding: AppSizeHelper.spacingAllMedium,
        actions: <Widget>[
          CustomElevatedButton(
            title: buttonText ?? "TRY AGAIN",
            onPressed: route ??
                () {
                  Get.offAll(() => const LandingScreen());
                  isDiaologOpen = false;
                },
            isExpanded: true,
          )
        ],
        radius: 10);
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
