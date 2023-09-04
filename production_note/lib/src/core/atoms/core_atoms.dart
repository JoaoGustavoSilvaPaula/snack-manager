import 'package:asp/asp.dart';

import '../execptions/exception.dart';

final globalLoaderStage = Atom(
  false,
  key: 'globalLoaderStage',
);

final globalExceptionStage = Atom<GlobalException?>(
  null,
  key: 'globalExceptionStage',
  pipe: interval(const Duration(seconds: 1)),
);
