// // lib/core/utils/helpers/image_compressor.dart

// import 'dart:io';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:path/path.dart' as path;

// class ImageCompressor {
//   static const _supportedFormats = [
//     '.jpg',
//     '.jpeg',
//     '.png',
//     '.webp',
//     '.heic',
//     '.heif',
//     '.bmp',
//   ];

//   /// ضغط الصورة مع دعم كل الأنواع
//   static Future<File?> compressImage(
//     File file, {
//     int quality = 70,
//     int minWidth = 800,
//     int minHeight = 800,
//     CompressFormat outputFormat = CompressFormat.jpeg,
//   }) async {
//     // التحقق إن الملف موجود
//     if (!await file.exists()) return null;

//     // التحقق إن النوع مدعوم
//     final extension = path.extension(file.path).toLowerCase();
//     if (!_supportedFormats.contains(extension)) return null;

//     // تحديد مسار الملف الجديد
//     final targetPath = _generateTargetPath(
//       file.path,
//       outputFormat,
//     );

//     try {
//       final result = await FlutterImageCompress.compressAndGetFile(
//         file.absolute.path,
//         targetPath,
//         quality: quality,
//         minWidth: minWidth,
//         minHeight: minHeight,
//         format: outputFormat,
//       );

//       return result != null ? File(result.path) : null;
//     } catch (e) {
//       return null;
//     }
//   }

//   /// ضغط الصورة مع اختيار نوع الخروج
//   static Future<File?> compressToWebP(
//     File file, {
//     int quality = 70,
//     int minWidth = 800,
//     int minHeight = 800,
//   }) async {
//     return compressImage(
//       file,
//       quality: quality,
//       minWidth: minWidth,
//       minHeight: minHeight,
//       outputFormat: CompressFormat.webp,
//     );
//   }

//   /// ضغط الصورة لـ PNG (بيحافظ على الشفافية)
//   static Future<File?> compressToPng(
//     File file, {
//     int quality = 70,
//     int minWidth = 800,
//     int minHeight = 800,
//   }) async {
//     return compressImage(
//       file,
//       quality: quality,
//       minWidth: minWidth,
//       minHeight: minHeight,
//       outputFormat: CompressFormat.png,
//     );
//   }

//   /// ضغط الصورة لـ HEIC (حجم أصغر - iOS)
//   static Future<File?> compressToHeic(
//     File file, {
//     int quality = 70,
//     int minWidth = 800,
//     int minHeight = 800,
//   }) async {
//     return compressImage(
//       file,
//       quality: quality,
//       minWidth: minWidth,
//       minHeight: minHeight,
//       outputFormat: CompressFormat.heic,
//     );
//   }

//   /// ضغط صور كتير مرة واحدة
//   static Future<List<File>> compressMultiple(
//     List<File> files, {
//     int quality = 70,
//     int minWidth = 800,
//     int minHeight = 800,
//     CompressFormat outputFormat = CompressFormat.jpeg,
//   }) async {
//     final List<File> compressedFiles = [];

//     for (final file in files) {
//       final compressed = await compressImage(
//         file,
//         quality: quality,
//         minWidth: minWidth,
//         minHeight: minHeight,
//         outputFormat: outputFormat,
//       );

//       // لو نجح الضغط استخدم المضغوطة، لو لا استخدم الأصلية
//       compressedFiles.add(compressed ?? file);
//     }

//     return compressedFiles;
//   }

//   /// اختيار أفضل نوع تلقائياً
//   static Future<File?> compressSmart(File file) async {
//     final extension = path.extension(file.path).toLowerCase();

//     // لو الصورة فيها شفافية (PNG) → خليها PNG
//     if (extension == '.png') {
//       return compressToPng(file, quality: 80);
//     }

//     // لو صورة آيفون → حولها لـ JPEG
//     if (extension == '.heic' || extension == '.heif') {
//       return compressImage(
//         file,
//         quality: 70,
//         outputFormat: CompressFormat.jpeg,
//       );
//     }

//     // لو WebP → خليها WebP (أصغر حجم)
//     if (extension == '.webp') {
//       return compressToWebP(file, quality: 70);
//     }

//     // الباقي → JPEG
//     return compressImage(file, quality: 70);
//   }

//   /// التحقق إن النوع مدعوم
//   static bool isSupported(String filePath) {
//     final extension = path.extension(filePath).toLowerCase();
//     return _supportedFormats.contains(extension);
//   }

//   /// معرفة حجم الصورة
//   static Future<String> getFileSize(File file) async {
//     final bytes = await file.length();
//     if (bytes < 1024) return '$bytes B';
//     if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
//     return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
//   }

//   /// توليد مسار الملف المضغوط
//   static String _generateTargetPath(
//     String originalPath,
//     CompressFormat format,
//   ) {
//     final dir = path.dirname(originalPath);
//     final name = path.basenameWithoutExtension(originalPath);
//     final newExtension = _getExtension(format);

//     return '$dir/${name}_compressed$newExtension';
//   }

//   /// الامتداد حسب النوع
//   static String _getExtension(CompressFormat format) {
//     switch (format) {
//       case CompressFormat.jpeg:
//         return '.jpg';
//       case CompressFormat.png:
//         return '.png';
//       case CompressFormat.webp:
//         return '.webp';
//       case CompressFormat.heic:
//         return '.heic';
//     }
//   }
// }