import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:resupply_ai/features/home/data/models/main_details_model.dart';
import 'package:resupply_ai/features/home/data/repo/home_repo_impl.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final HomeRepoImpl _homeRepoImpl = HomeRepoImpl();
  getAllProducts({required String url, String? searchValue}) async {
    var result =
        await _homeRepoImpl.getAllDetails(searchValue: searchValue, url: url);

    result.fold(
      (failure) {
        emit(HomeErrorState(failure.errorMessage));
      },
      (mainDetailsMap) {
        // SAFETY: make sure list is not null
        final list = mainDetailsMap ?? [];

        // Check if any item contains the key 'title'
        final containsTitle = list.any(
          (item) => item is Map<String, dynamic> && item.containsKey('title'),
        );

        emit(
          HomeLoadedState(
            mainDetaislList: list,
            isContainTitle: containsTitle,
          ),
        );
      },
    );
  }

  getAllProductsDetails({required String url, String? searchValue}) async {
    var result =
        await _homeRepoImpl.getAllDetails(searchValue: searchValue, url: url);

    result.fold(
      (failure) {
        emit(HomeErrorState(failure.errorMessage));
      },
      (mainDetailsMap) {
        // SAFETY: make sure list is not null
        final list = mainDetailsMap ?? [];

        // Check if any item contains the key 'title'
        final containsTitle = list.any(
          (item) => item is Map<String, dynamic> && item.containsKey('title'),
        );

        emit(
          HomeDetailsLoadedState(
            mainDetaislList: list,
            isContainTitle: containsTitle,
          ),
        );
      },
    );
  }
}
