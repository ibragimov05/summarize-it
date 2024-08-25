import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:summarize_it/core/network/dio_client.dart';
import 'package:summarize_it/core/utils/apis.dart';

class AudioService {
  final DioClient _dioClient = DioClient();

  Future<String> downloadAudio({
    required String summary,
    required String summaryLang,
  }) async {
    try {
      String summaryAudioUrl = '';
      if (summaryLang == 'uz') {
        final response = await _dioClient.post(
          url: 'https://uzbekvoice.ai/api/v1/tts',
          data: {
            "text": summary,
            "model": "fotima-neutral",
            "blocking": "true",
            "webhook_notification_url": "https://example.com",
          },
          options: Options(
            headers: {
              'Authorization': Apis.uzbekVoiceAiKEY,
            },
          ),
        );
        summaryAudioUrl = response.data['result']['url'];
      } else {
        final response = await _dioClient.post(
          url: 'https://api.v7.unrealspeech.com/speech',
          data: {
            'Text': summary,
            'VoiceId': 'Dan',
            'Bitrate': '192k',
            'Speed': '0',
            'Pitch': '1',
            'TimestampType': 'sentence',
          },
          options: Options(
            headers: {
              'Authorization': 'Bearer ${Apis.unrealSpeechKEY}',
              'x-rapid-api-host': 'open-ai-text-to-speech1.p.rapidapi.com',
              'Content-Type': 'application/json',
            },
          ),
        );
        summaryAudioUrl = response.data['OutputUri'];
      }
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
