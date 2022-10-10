import 'package:ontari_app/resource/user_repo.dart';
import 'package:rxdart/rxdart.dart';

import '../providers/bloc_provider.dart';

abstract class UserDataBehaviorBloc<T> extends BlocBase {
  final _dataSubject = BehaviorSubject<T?>();
  BehaviorSubject<T?> get dataSubject => _dataSubject;
  Stream<T?> get dataStream => _dataSubject.stream;
  T? get dataValue => _dataSubject.stream.value;

  final BehaviorSubject<bool> isLoadingSubject = BehaviorSubject.seeded(false);
  Stream<bool> get isLoadingStream => isLoadingSubject.stream;
  bool get isLoadingValue => isLoadingSubject.stream.value;

  UserRepo get dataRepo;

  Future<void> getData() async {
    if (isLoadingSubject.stream.value) {
      return;
    }
    if (!isLoadingSubject.isClosed) {
      isLoadingSubject.sink.add(true);
    }

    try {
      final res = await dataRepo.getUserDetailRepos();

      if (res != null) {
        _dataSubject.sink.add(res as T?);
      }
    } catch (e) {
      _dataSubject.sink.addError(e);
    } finally {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (!isLoadingSubject.isClosed) {
          isLoadingSubject.sink.add(false);
        }
      });
    }
  }

  Future<void> refresh() {
    dataRepo.refresh();
    return getData();
  }

  @override
  void dispose() {
    _dataSubject.close();
  }
}
