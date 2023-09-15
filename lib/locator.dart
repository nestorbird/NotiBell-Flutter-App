import 'package:notibell_mobile_app/services/face_detection_service/camera.service.dart';
import 'package:notibell_mobile_app/services/face_detection_service/face_detector_service.dart';
import 'package:notibell_mobile_app/services/face_detection_service/ml_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupServices() {
  locator.registerLazySingleton<CameraService>(() => CameraService());
  locator
      .registerLazySingleton<FaceDetectorService>(() => FaceDetectorService());
  locator.registerLazySingleton<MLService>(() => MLService());
}
