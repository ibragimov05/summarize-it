import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:summarize_it/core/network/dio_client.dart';

class AudioService {
  final DioClient _dioClient = DioClient();

  Future<String> downloadAudio(String summary) async {
    try {
      final response = await _dioClient.getAudioDownloadUrl(summary: summary);

      final summaryAudioUrl = response.data['OutputUri'];

      final audioResponse = await _dioClient.get(
        url: summaryAudioUrl,
        options: Options(
          responseType: ResponseType.bytes,
        ),
      );

      final firebaseAudioUrl = await uploadToFirebase(audioResponse.data);

      return firebaseAudioUrl;
    } on FirebaseException catch (e) {
      throw (e.message ?? 'Unknown Error');
    } on DioException catch (e) {
      throw (e.response!.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> uploadToFirebase(Uint8List audioBytes) async {
    final ref = FirebaseStorage.instance.ref();
    final filename = UniqueKey().toString();
    final path = ref.child("audios").child("$filename.mp3");
    final uploadTask = path.putData(audioBytes);

    await uploadTask;
    return await path.getDownloadURL();
  }
}
