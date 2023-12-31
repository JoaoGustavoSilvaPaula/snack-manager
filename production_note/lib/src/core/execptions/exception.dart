import 'package:flutter/material.dart';

abstract class Failure {
  final String errorMessage;

  Failure({
    StackTrace? stackTrace,
    String? label,
    dynamic exception,
    this.errorMessage = '',
  }) {
    if (stackTrace != null) {
      debugPrintStack(label: label, stackTrace: stackTrace);
    }
    //ErrorReport.externalFailureError(exception, stackTrace, label);
    //https://github.com/Bwolfs2/movie_app_monolith/blob/master/lib/app/core/error/failure.dart
  }
}

class UnknownError extends Failure {
  @override
  // ignore: overridden_fields
  final String errorMessage;
  final dynamic exception;
  final StackTrace? stackTrace;
  final String? label;

  UnknownError({
    this.errorMessage = 'Unknown Error',
    this.label,
    this.exception,
    this.stackTrace,
  }) : super(
          stackTrace: stackTrace,
          label: label,
          exception: exception,
        );
}
