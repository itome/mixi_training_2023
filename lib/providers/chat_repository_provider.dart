import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mixi_training_2023/repositories/chart_repository.dart';

final chatRepositoryProvider = Provider((ref) => ChatRepository());
